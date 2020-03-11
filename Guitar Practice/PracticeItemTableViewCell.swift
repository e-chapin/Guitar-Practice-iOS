//
//  PracticeItemTableViewCell.swift
//  Guitar Practice
//
//  Created by Eric Jameson on 3/10/20.
//  Copyright © 2020 Eric Jameson. All rights reserved.
//

import UIKit

class PracticeItemTableViewCell: UITableViewCell {

    @IBOutlet weak var itemLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
