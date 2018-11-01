//
//  LoginViewController.swift
//  Worklist
//
//  Created by Vaibhav Malhotra on 26/10/18.
//  Copyright © 2018 Vaibhav Malhotra. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.usernameTextField.delegate = self
        self.passwordTextField.delegate = self
        
        self.loginView.layer.cornerRadius = 12
        // Do any additional setup after loading the view.
    }
    
    func validateUserAndLogin() {
        let userName = self.usernameTextField?.text
        let password = self.passwordTextField?.text
        if !(userName?.isEmpty)! && !(password?.isEmpty)! {
           
            sendRequestforLogin()
        }
        else{
            utilities.displayAlert(title: "Alert", message: "Please enter Username and Password.")
        }
    }
    
    func sendRequestforLogin() {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle : nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "DashboardViewController") as! DashboardViewController

        self.navigationController?.pushViewController(viewController, animated: true)
//        let appdelegate = UIApplication.shared.delegate as! AppDelegate
//        appdelegate.window!.rootViewController = viewController
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == usernameTextField {
            
        textField.resignFirstResponder()
        passwordTextField.becomeFirstResponder()
            
        } else {
            textField.resignFirstResponder()
        }
        
        return true
    }
    
    @IBAction func forgotPasswordTapped(_ sender: Any) {
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        
        validateUserAndLogin()
        
    }
    
    @IBAction func signupTapped(_ sender: Any) {
    }
    
    @IBAction func resetTapped(_ sender: Any) {
    }
    
}
