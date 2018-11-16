//
//  ApprovalCollectionViewCell.swift
//  Worklist
//
//  Created by Vaibhav M on 31/10/18.
//  Copyright © 2018 Vaibhav M. All rights reserved.
//

import UIKit

class ApprovalCollectionViewCell: UITableViewCell {

    @IBOutlet weak var approvalType: UILabel!
    @IBOutlet weak var approvalDate: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var priorityImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func approveTapped(_ sender: Any) {
    utilities.displayAlert(title: alert, message: requestApproved)
        
    }
    
    @IBAction func rejectTapped(_ sender: Any) {
    utilities.displayAlert(title: alert, message: requestRejected)
    }
    
}
