//
//  LoginViewController.swift
//  Worklist
//
//  Created by Bimalesh Sahoo on 26/10/18.
//  Copyright © 2018 Bimalesh Sahoo. All rights reserved.
//

import UIKit
import CoreData

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.usernameTextField.delegate = self
        self.passwordTextField.delegate = self
        
        self.loginView.layer.cornerRadius = 12
    }
    
    
//  Login details are stored in CoreData.
    func validateUserAndLogin() {
        let userName = self.usernameTextField?.text
        let password = self.passwordTextField?.text
        
        if !(userName?.isEmpty)! && !(password?.isEmpty)! {
            
            if isValidEmail(email: usernameTextField.text!) {
                
                if isPasswordValid(password: passwordTextField.text!) {
                    
                    let _:AppDelegate = (UIApplication.shared.delegate as! AppDelegate)
                    let context:NSManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                    let newUser = NSEntityDescription.insertNewObject(forEntityName: "LoginData", into: context) as NSManagedObject
                    newUser.setValue(usernameTextField.text, forKey: "username")
                    newUser.setValue(passwordTextField.text, forKey: "password")
                    
                    do {
                        try context.save()
                    } catch { }
                    
                    print(newUser)
                    print("Object Saved.")
                    
                    sendRequestforLogin()
                    
                } else {
                    utilities.displayAlert(title: "Invalid Password", message: "Password length should be atleast 6 characters and must contain 1 Lowercase 1 Uppercase and 1 Number")
                }
            } else {
                utilities.displayAlert(title: "Invalid Email", message: "Please Enter Valid a Email Id")
            }
            
        } else {
            utilities.displayAlert(title: "Alert", message: "Please enter Username and Password.")
        }
    }

//email validation
    func isValidEmail(email : String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
//password validation for atleast 6 characters and must contain 1 Lowercase 1 Uppercase and 1 Number
    func isPasswordValid(password : String) -> Bool {
        
        let passwordRegEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{6,}"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return passwordTest.evaluate(with: password)
    }
    
//Navigation to Dashboard after Successful Login
    func sendRequestforLogin() {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle : nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "DashboardViewController") as! DashboardViewController

        let navigationController = UINavigationController(rootViewController: viewController)
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        appdelegate.window!.rootViewController = navigationController
        
    }

// TextField Attributes
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == usernameTextField {
            
        textField.resignFirstResponder()
        passwordTextField.becomeFirstResponder()
            
        } else {
            textField.resignFirstResponder()
        }
        
        return true
    }
    
    
// Action Buttons
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
