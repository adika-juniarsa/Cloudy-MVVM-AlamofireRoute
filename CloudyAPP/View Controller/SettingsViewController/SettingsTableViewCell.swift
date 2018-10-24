//
//  SettingsTableViewCell.swift
//  CloudyAPP
//
//  Created by febi on 10/24/18.
//  Copyright © 2018 adika.com.latihan. All rights reserved.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    static let reuseIdentifier = "SettingCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//        // Configure the view for the selected state
//    }
    

}
