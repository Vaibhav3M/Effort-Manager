//
//  NotificationViewCell.swift
//  Worklist
//
//  Created by Bimalesh Sahoo on 06/11/18.
//  Copyright © 2018 Bimalesh Sahoo. All rights reserved.
//

import UIKit

class NotificationViewCell: UITableViewCell {

    
    @IBOutlet weak var notificationType: UILabel!
    @IBOutlet weak var notificationDescription: UILabel!
    @IBOutlet weak var notificationDate: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
        profileImage.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
