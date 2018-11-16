//
//  SignUpViewController.swift
//  Worklist
//
//  Created by Vaibhav M on 08/11/18.
//  Copyright © 2018 Vaibhav M. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {

    //MARK: Variables
    
    @IBOutlet weak var empNameTextField: UITextField!
    
    @IBOutlet weak var empIdTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var signUpView: UIView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
    
        signUpView.layer.cornerRadius = 15
        btnSignUp.layer.cornerRadius = btnSignUp.frame.height / 2
        btnSignUp.layer.masksToBounds = true
        
        self.empNameTextField.delegate = self
        self.empIdTextField.delegate = self
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        self.confirmPasswordTextField.delegate = self
        self.navigationController?.navigationBar.isHidden = true
        self.hideKeyboardWhenTappedAround()
    }
 
    //MARK: functions
    func signUp() {
        
        if !(empNameTextField?.text?.isEmpty)! && !(empIdTextField?.text?.isEmpty)! && !(emailTextField?.text?.isEmpty)! && !(passwordTextField?.text?.isEmpty)! && !(confirmPasswordTextField?.text?.isEmpty)! {
        
            if validations.isValidName(name: empNameTextField.text!)
        {
            if validations.isValidId(id: empIdTextField.text!)
            {
                if validations.isValidEmail(email: emailTextField.text!)
                {
                    if validations.isPasswordValid(password: passwordTextField.text!)
                    {
                        if passwordTextField.text == confirmPasswordTextField.text
                        {
                            
                            localDatabase.signUp(nameTxtField: empNameTextField, idTxtField: empIdTextField, usernameTxtField: emailTextField, passTxtField: passwordTextField)
                            
                        } else {
                            print("password do not match")
                            utilities.displayAlert(title: misMatch, message: passwordUnmatch)
                            
                        }
                        
                    } else {
                        print("pswd check")
                        utilities.displayAlert(title: invalidPassword, message: passwordLength)
                    }
                    
                } else {
                    print("mail check")
                    utilities.displayAlert(title: invalidEmail, message: enterEmail)
                    
                }
                
            } else {
                print("id check")
                utilities.displayAlert(title: invalidId, message: enterId)
                
            }
            
        } else {
            print("name check")
            
            utilities.displayAlert(title: alert, message: invalidName)
            }
            
        } else {
            utilities.displayAlert(title: invalidCredentials, message: fillAllFields)
        }
    }
    
    func logIn() {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let loginController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
                
        appDelegate.window?.rootViewController = loginController
        appDelegate.window?.makeKeyAndVisible()
        
    }
    
    // TextField Attributes
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == empNameTextField {
            
            textField.resignFirstResponder()
            empIdTextField.becomeFirstResponder()
            
        } else if textField == empIdTextField {
            //textField.resignFirstResponder()
            emailTextField.becomeFirstResponder()
        } else if textField == emailTextField {
            //textField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
           // textField.resignFirstResponder()
            confirmPasswordTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        
        return false
    }
    
    
  //MARK:  Action Buttons
    @IBAction func logInTapped(_ sender: Any) {
    
        logIn()
    }


    @IBAction func signUpTapped(_ sender: Any) {
        signUp()
    }
    
    
}

