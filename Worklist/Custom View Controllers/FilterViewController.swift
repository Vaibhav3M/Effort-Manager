//
//  FilterViewController.swift
//  Worklist
//
//  Created by Bimalesh Sahoo on 30/10/18.
//  Copyright © 2018 Bimalesh Sahoo. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {

    @IBOutlet weak var filterView: UIView!
    
    @IBOutlet weak var applyFilterButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        filterView.layer.cornerRadius = 12
        filterView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        applyFilterButton.layer.cornerRadius = 18
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func closeTapped(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func applyFilterTapped(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }


}
