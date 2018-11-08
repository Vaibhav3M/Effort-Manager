//
//  ClarificationViewController.swift
//  Worklist
//
//  Created by Bimalesh Sahoo on 05/11/18.
//  Copyright © 2018 Bimalesh Sahoo. All rights reserved.
//

import UIKit

class ClarificationViewController: UIViewController {

    @IBOutlet weak var receiveTextField: UITextView!
    
    @IBOutlet weak var sendTextField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sendTextField.layer.cornerRadius = 15
        sendTextField.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner, .layerMinXMaxYCorner]
        
        receiveTextField.layer.cornerRadius = 15
        receiveTextField.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner, .layerMaxXMaxYCorner]
    }
    

    @IBAction func backButtonTapped(_ sender: Any) {
    self.storyboard?.instantiateViewController(withIdentifier: "TaskApprovalViewController")
        self.navigationController?.popViewController(animated: true)
    
    }
    
    @IBAction func logoutTapped(_ sender: Any) {
    
        utilities.logoutAlert()
    }
    
}
