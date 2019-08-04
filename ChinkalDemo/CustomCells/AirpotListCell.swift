//
//  AirpotListCell.swift
//  ChinkalDemo
//
//  Created by chinkalshah on 03/08/19.
//  Copyright © 2019 chinkalshah. All rights reserved.
//

import UIKit

class AirpotListCell: UITableViewCell {

    // MARK: Outlets
    @IBOutlet weak var lblCountry: UILabel!
    @IBOutlet weak var lblRunWayLength: UILabel!
    @IBOutlet weak var lblAirportName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // MARK: - Helpers
    public func configurecell(_ ViewModel: AirportViewModel) {
        self.lblCountry.text = ViewModel.country + " - "
        if(ViewModel.runway_length != nil){
            self.lblRunWayLength.text = " Runwaylength - " + ViewModel.runway_length
        }else{
            self.lblRunWayLength.text = " Runwaylength - "
        }
        self.lblAirportName.text =  ViewModel.name
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
