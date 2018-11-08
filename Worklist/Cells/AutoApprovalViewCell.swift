//
//  AutoApprovalViewCell.swift
//  Worklist
//
//  Created by Bimalesh Sahoo on 04/11/18.
//  Copyright © 2018 Bimalesh Sahoo. All rights reserved.
//

import UIKit

class AutoApprovalViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var approvalType: UILabel!
    
    @IBOutlet weak var approvalDescription: UILabel!
    
    @IBOutlet weak var dateApproved: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
        profileImage.layer.masksToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
