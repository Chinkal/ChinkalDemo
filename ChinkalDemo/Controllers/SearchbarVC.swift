//
//  SearchbarVC.swift
//  ChinkalDemo
//
//  Created by chinkalshah on 03/08/19.
//  Copyright © 2019 chinkalshah. All rights reserved.
//

import UIKit
import CoreLocation

class SearchbarVC: UIViewController , UITableViewDelegate , UITableViewDataSource, DataDownloadCompletionDelegate{

    // MARK: Constants
    let AirportList = "AirportList"
    
    // MARK: Objects
    var arrayViewModels :[AirportViewModel] = [AirportViewModel]()
    var arrayAirport :[Airport] = [Airport]()
    var filteredData: [Airport] = [Airport]()
    
    // MARK: Outlets
    @IBOutlet weak var tblCityList: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!

    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        tblCityList.delegate = self
        tblCityList.dataSource = self
        
        self.ConfigureSearchbar()
        self.downloadAllDataFromJson()
    }
    
    //MARK: - Api Handlers

    private func downloadAllDataFromJson() {
        ApiHandler.downloadAirportLlist(ApiHandler.requestType.getAirportJsonData.rawValue, httpmethod: "POST", andPostparameters: "", Delegate: self)
    }

    // MARK: - SearchBar Handlers
    func ConfigureSearchbar (){
        
        searchBar.setImage(UIImage(named: "SearchIcon"), for: .search, state: .normal)
        searchBar.layer.cornerRadius = 4
        searchBar.clipsToBounds = true
        searchBar.layer.backgroundColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.10).cgColor
        
        let searchTextField: UITextField? = searchBar.value(forKey: "searchField") as? UITextField
        let attributeDict = [NSAttributedString.Key.foregroundColor: UIColor.white]
        searchTextField!.attributedPlaceholder = NSAttributedString(string: "Search", attributes: attributeDict)
        
        self.searchBar.delegate = self
        for view in searchBar.subviews {
            for subview in view.subviews {
                //print(subview)
                if subview is UITextField {
                    
                    let textField: UITextField = subview as! UITextField
                    textField.font = UIFont(name: "Avenir Next", size: 15)
                    textField.textColor = UIColor.white
                    textField.backgroundColor = UIColor.clear
                    
                    let glassIconView = textField.leftView as! UIImageView
                    glassIconView.image = glassIconView.image?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
                    glassIconView.tintColor = UIColor.white
                    
                }
            }
        }
        
    }
    
    // MARK: - Table View Data Source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "CityListCell"
        var cell: CityListCell? = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? CityListCell
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: cellIdentifier) as? CityListCell
        }
        
        let airport = filteredData[indexPath.row]
        let airportViewModel = AirportViewModel(airport: airport)
        cell?.configurecell(airportViewModel)
        
        cell?.selectionStyle = .none
        cell?.backgroundColor = UIColor.clear
        
        return cell!
    }
    
    // MARK: - Table View Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let airport = filteredData[indexPath.row]
        let userLocation = airport.location

        for airport in arrayAirport {
            airport.Getdistance(to: userLocation!)
        }
        self.performSegue(withIdentifier: self.AirportList, sender: nil)
    }
    
    
    //MARK: - Network Delegate
    func dataDownloadCompleted(error:Error? , data:Data){
        if error == nil {
            do {
                let jsonArray = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSMutableArray
                jsonArray.forEach {
                    let dict = $0 as? NSDictionary
                    let airportModel = Airport.init(dictionary: dict!)
                    arrayAirport.append(airportModel!)
                }
                
            } catch {
                // Something went wrong
            }
        }
        
        
    }
    
    //MARK: - Navigation Handlers

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == AirportList {
            if let destinationVC = segue.destination as? AirportListVC {
                destinationVC.arrayAirportForListItems = self.arrayAirport
            }
        }
    }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// MARK: - SearchBar Delegates
extension SearchbarVC : UISearchBarDelegate
{
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        return true
    }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if searchBar.text == ""{
            filteredData = []
        }
        self.tblCityList.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        filteredData = []
        searchBar.text = ""
        searchBar.resignFirstResponder()
        self.tblCityList.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // searchActive = false;
        searchBar.resignFirstResponder()
    }

    // This method updates filteredData based on the text in the Search Box
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty  else {
            filteredData = []
            tblCityList.reloadData()
            ; return }
        filteredData = arrayAirport.filter({ airport -> Bool in
            return airport.city!.lowercased().contains(searchText.lowercased())
        })
        tblCityList.reloadData()
    }

    
}
