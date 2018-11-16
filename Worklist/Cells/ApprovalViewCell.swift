//
//  ApprovalViewCell.swift
//  Worklist
//
//  Created by Vaibhav M on 31/10/18.
//  Copyright © 2018 Vaibhav M. All rights reserved.
//

import UIKit

class ApprovalViewCell: UITableViewCell {

    @IBOutlet weak var descriptionCell: UITextView!
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var approvalCell: UILabel!
    @IBOutlet weak var approvalDuration_Claims: UILabel!
    @IBOutlet weak var inOut_leaveTime_claimType: UILabel!
    @IBOutlet weak var attendanceData: UILabel!
    @IBOutlet weak var efforts_leaveRemaining_claimReason: UILabel!
    @IBOutlet weak var tofa: UILabel!
    
    @IBOutlet weak var btnApprove: UIButton!
    @IBOutlet weak var btnReject: UIButton!
    @IBOutlet weak var btnChat: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    // Initialization code
        
        imageCell.layer.cornerRadius = imageCell.frame.width / 2
        imageCell.layer.masksToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    // Configure the view for the selected state
    }

    //MARK: Action Buttons
    @IBAction func approveTapped(_ sender: Any) {
    utilities.displayAlert(title: alert, message: requestApproved)

    }
    
    @IBAction func rejectTapped(_ sender: Any) {
    utilities.displayAlert(title: alert, message: requestRejected)
        
    }
    
}
