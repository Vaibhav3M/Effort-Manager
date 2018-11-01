//
//  TaskViewCell.swift
//  Worklist
//
//  Created by Vaibhav Malhotra on 29/10/18.
//  Copyright © 2018 Vaibhav Malhotra. All rights reserved.
//

import UIKit

class TaskViewCell: UITableViewCell {

    @IBOutlet weak var taskTypeCell: UILabel!
    @IBOutlet weak var descriptionCell: UITextView!
    @IBOutlet weak var priorityCell: UIImageView!
    
    @IBOutlet weak var dueDatecell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
