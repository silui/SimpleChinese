//
//  OverViewCell.swift
//  Simple Chinese
//
//  Created by Tian Qiu on 7/16/17.
//  Copyright © 2017 Luming Wang. All rights reserved.
//

import UIKit

class OverViewCell: UITableViewCell {

    
    @IBOutlet weak var Char_Field: UILabel!
    @IBOutlet weak var PinYin_Field: UILabel!
    @IBOutlet weak var Def_Field: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
