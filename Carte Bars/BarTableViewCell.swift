//
//  BarTableViewCell.swift
//  Carte Bars
//
//  Created by Renaud Descours on 08/04/2016.
//  Copyright © 2016 Renaud Descours. All rights reserved.
//

import UIKit

class BarTableViewCell: UITableViewCell {

    // MARK: Properties
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var adressLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
