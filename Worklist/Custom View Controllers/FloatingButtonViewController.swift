//
//  FloatingButtonViewController.swift
//  Worklist
//
//  Created by Vaibhav Malhotra on 30/10/18.
//  Copyright © 2018 Vaibhav Malhotra. All rights reserved.
//

import UIKit

class FloatingButtonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelTapped(_ sender: Any) {
    
        self.dismiss(animated: true, completion: nil)
    
    }
    
    @IBAction func approvalTapped(_ sender: Any) {
    
    
    }
    
}
