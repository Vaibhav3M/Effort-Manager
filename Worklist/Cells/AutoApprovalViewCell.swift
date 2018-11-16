//
//  AutoApprovalViewCell.swift
//  Worklist
//
//  Created by Vaibhav M on 04/11/18.
//  Copyright © 2018 Vaibhav M. All rights reserved.
//

import UIKit

class AutoApprovalViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var priorityIndicator: UIView!
    
    @IBOutlet weak var approvalType: UILabel!
    
    @IBOutlet weak var approvalDescription: UILabel!
    
    @IBOutlet weak var dateApproved: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        priorityIndicator.layer.cornerRadius = priorityIndicator.frame.height / 2
        priorityIndicator.layer.masksToBounds = true
        priorityIndicator.backgroundColor = customGrey
        priorityIndicator.layer.borderWidth = 1.0
        priorityIndicator.layer.borderColor = UIColor.lightGray.cgColor
        
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
        profileImage.layer.masksToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
