//
//  StatusViewCell.swift
//  Worklist
//
//  Created by Bimalesh Sahoo on 04/11/18.
//  Copyright © 2018 Bimalesh Sahoo. All rights reserved.
//

import UIKit

class StatusViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var statusType: UILabel!
    
    @IBOutlet weak var escalation: UILabel!
    
    @IBOutlet weak var daysLeft: UILabel!
    
    @IBOutlet weak var priorityIndicator: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        priorityIndicator.layer.cornerRadius = priorityIndicator.frame.height / 2
        priorityIndicator.layer.masksToBounds = true
        
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
        profileImage.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
