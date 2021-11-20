//
//  TempTableViewCell.swift
//  ContinueWorking
//
//  Created by Ahmed Qazzaz on 17/11/2021.
//

import UIKit

class TempTableViewCell: UITableViewCell {

    
    @IBOutlet weak var lb_title: UILabel!
    @IBOutlet weak var imgv_logo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
