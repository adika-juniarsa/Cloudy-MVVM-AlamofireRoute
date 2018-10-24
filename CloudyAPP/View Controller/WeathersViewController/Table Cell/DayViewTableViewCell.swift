//
//  DayViewTableViewCell.swift
//  CloudyAPP
//
//  Created by febi on 10/23/18.
//  Copyright © 2018 adika.com.latihan. All rights reserved.
//

import UIKit

class DayViewTableViewCell: UITableViewCell {

    static let reuseIdentifier = "DayCell"
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
