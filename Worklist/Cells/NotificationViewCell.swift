//
//  NotificationViewCell.swift
//  Worklist
//
//  Created by Vaibhav M on 06/11/18.
//  Copyright © 2018 Vaibhav M. All rights reserved.
//

import UIKit

class NotificationViewCell: UITableViewCell {

    @IBOutlet weak var priorityIndicator: UIView!
    
    @IBOutlet weak var notificationType: UILabel!
    @IBOutlet weak var notificationDescription: UILabel!
    @IBOutlet weak var notificationDate: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        priorityIndicator.layer.cornerRadius = priorityIndicator.frame.height / 2
        priorityIndicator.layer.masksToBounds = true
        priorityIndicator.backgroundColor = customGrey
        priorityIndicator.layer.borderWidth = 1.0
        priorityIndicator.layer.borderColor = UIColor.lightGray.cgColor
        
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
        profileImage.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
