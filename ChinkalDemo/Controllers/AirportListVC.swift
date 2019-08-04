//
//  AirportListVC.swift
//  ChinkalDemo
//
//  Created by chinkalshah on 03/08/19.
//  Copyright © 2019 chinkalshah. All rights reserved.
//

import UIKit

class AirportListVC: UIViewController , UITableViewDataSource , UITableViewDelegate {

    // MARK: Constants
    let cellSpacingHeight: CGFloat = 5
    
    // MARK: Objects
    var arrayAirportForListItems :[Airport] = [Airport]()

    // MARK: Outlets
    @IBOutlet weak var tblAirpotList: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tblAirpotList.delegate = self
        tblAirpotList.dataSource = self
        
        arrayAirportForListItems.sort(by: {$0.distance! < $1.distance!})
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Table View Data Source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(arrayAirportForListItems.count > 4){
            return 5
        }else{
            return arrayAirportForListItems.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "AirpotListCell"
        var cell: AirpotListCell? = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? AirpotListCell
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: cellIdentifier) as? AirpotListCell
        }
        
        let airport = arrayAirportForListItems[indexPath.row]
        let airportViewModel = AirportViewModel(airport: airport)
        cell?.configurecell(airportViewModel)
        
        cell?.selectionStyle = .none
        cell?.backgroundColor = UIColor.clear
        
        return cell!
    }
    
  
}
