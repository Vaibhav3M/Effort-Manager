//
//  ApprovalViewCell.swift
//  Worklist
//
//  Created by Bimalesh Sahoo on 31/10/18.
//  Copyright © 2018 Bimalesh Sahoo. All rights reserved.
//

import UIKit

class ApprovalViewCell: UITableViewCell {

    @IBOutlet weak var descriptionCell: UITextView!
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var approvalCell: UILabel!
    
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

}
