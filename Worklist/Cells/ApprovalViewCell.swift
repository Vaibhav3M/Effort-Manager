//
//  ApprovalViewCell.swift
//  Worklist
//
//  Created by Vaibhav Malhotra on 31/10/18.
//  Copyright © 2018 Vaibhav Malhotra. All rights reserved.
//

import UIKit

class ApprovalViewCell: UITableViewCell {

    @IBOutlet weak var descriptionCell: UITextView!
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var typeCell: UILabel!
    @IBOutlet weak var nameCell: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        imageCell.layer.cornerRadius = 25
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
