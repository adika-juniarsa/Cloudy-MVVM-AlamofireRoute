//
//  LocationTableViewCell.swift
//  CloudyAPP
//
//  Created by febi on 10/24/18.
//  Copyright © 2018 adika.com.latihan. All rights reserved.
//

import UIKit

class LocationTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    static let reuseIdentifier = "LocationCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(withViewModel viewModel: LocationRepresentable) {
        nameLabel.text = viewModel.text
    }

}
