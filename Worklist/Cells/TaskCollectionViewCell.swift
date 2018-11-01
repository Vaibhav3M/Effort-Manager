//
//  TaskCollectionViewCell.swift
//  Worklist
//
//  Created by Vaibhav Malhotra on 31/10/18.
//  Copyright © 2018 Vaibhav Malhotra. All rights reserved.
//

import UIKit

class TaskCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var taskTypeCell: UILabel!
    
    @IBOutlet weak var descriptionCell: UILabel!
    
    @IBOutlet weak var dueDateCell: UILabel!
    @IBOutlet weak var priorityCell: UIImageView!
    
    @IBOutlet weak var viewMoreItems: UIView!
    @IBOutlet weak var btnMoreItemView: UIButton!
    @IBOutlet weak var btnMoreItems: UIButton!
    @IBOutlet weak var lblMoreItems: UILabel!
    
    @IBAction func btnMoreItemViewAction(_ sender: Any) {

    }
    
    
}
