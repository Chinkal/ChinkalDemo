//
//  CityListCell.swift
//  ChinkalDemo
//
//  Created by chinkalshah on 03/08/19.
//  Copyright © 2019 chinkalshah. All rights reserved.
//

import UIKit

class CityListCell: UITableViewCell {

    // MARK: Outlets
    @IBOutlet weak var lblCityTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - Helpers
    public func configurecell(_ ViewModel: AirportViewModel) {
        self.lblCityTitle.text = ViewModel.city
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
