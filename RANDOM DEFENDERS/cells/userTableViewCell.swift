//
//  userTableViewCell.swift
//  RANDOM DEFENDERS
//
//  Created by epita on 11/07/2019.
//  Copyright © 2019 epita. All rights reserved.
//

import UIKit

class userTableViewCell: UITableViewCell {


    @IBOutlet weak var labelname: UILabel!
    @IBOutlet weak var labelMail:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

    
