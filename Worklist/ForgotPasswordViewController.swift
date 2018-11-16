//
//  ForgotPasswordViewController.swift
//  Worklist
//
//  Created by Vaibhav M on 09/11/18.
//  Copyright © 2018 Vaibhav M. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var forgotPasswordView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var btnForgotPassword: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        forgotPasswordView.layer.cornerRadius = 15
        forgotPasswordView.layer.masksToBounds = true
        
        btnForgotPassword.layer.cornerRadius = btnForgotPassword.frame.height / 2
        btnForgotPassword.layer.masksToBounds = true
        
        btnForgotPassword.addTarget(self, action: #selector(resetPassword), for: .touchUpInside)
        self.hideKeyboardWhenTappedAround()
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
   @objc func resetPassword() {
    
        if validations.isValidEmail(email: emailTextField.text!) {
            
            utilities.displayAlert(title: "", message: "Reset password link successfully sent to  \(String(describing: emailTextField.text!))")
                
                self.logInTapped(self)
                
    }
            
         else  {
            utilities.displayAlert(title: invalidEmail, message: enterEmail)
        }
    }
    
    //MARK:  TextField Attributes
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == emailTextField {
            textField.resignFirstResponder()
        }
        
        return true
    }
    
    @IBAction func logInTapped(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let loginController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        appDelegate.window?.rootViewController = loginController
        appDelegate.window?.makeKeyAndVisible()
        
    }
    

}
