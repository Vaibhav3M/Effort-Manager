//
//  ApprovalCollectionViewCell.swift
//  Worklist
//
//  Created by Vaibhav Malhotra on 31/10/18.
//  Copyright © 2018 Vaibhav Malhotra. All rights reserved.
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
    }
    
    @IBAction func rejectTapped(_ sender: Any) {
    }
    
}
