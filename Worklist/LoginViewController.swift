//
//  LoginViewController.swift
//  Worklist
//
//  Created by Vaibhav M on 26/10/18.
//  Copyright © 2018 Vaibhav M. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var lblNoteAttributed: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.usernameTextField.delegate = self
        self.passwordTextField.delegate = self
        
        self.loginView.layer.cornerRadius = 15
       
        self.hideKeyboardWhenTappedAround()
        self.attributedLabelSetup()

    }
    
   //MARK:   Login details are compared from Local Database.
    func validateUserAndLogin() {
    
        if !(usernameTextField?.text?.isEmpty)! && !(passwordTextField?.text?.isEmpty)! {
            
            if validations.isValidEmail(email: usernameTextField.text!) {
                
                if validations.isPasswordValid(password: passwordTextField.text!) {
                    
                    localDatabase.logIn(usernameTxtField: usernameTextField, passTxtField: passwordTextField)
                    
                } else {
                    utilities.displayAlert(title: invalidPassword, message: passwordLength)
                }
            } else {
                utilities.displayAlert(title: invalidEmail, message: enterEmail)
            }
            
        } else {
            utilities.displayAlert(title: invalidCredentials, message: fillAllFields)
        }
    }

//MARK:  TextField Attributes
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == usernameTextField {
            
        textField.resignFirstResponder()
        passwordTextField.becomeFirstResponder()
            
        } else {
            textField.resignFirstResponder()
        }
        
        return true
    }
    
    
//MARK:  Action Buttons
    @IBAction func forgotPasswordTapped(_ sender: Any) {
 
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle : nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "ForgotPasswordViewController") as! ForgotPasswordViewController
        
        let navigationController = UINavigationController(rootViewController: viewController)
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        appdelegate.window!.rootViewController = navigationController
        
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        
        validateUserAndLogin()
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle : nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "DashboardViewController") as! DashboardViewController
        
        let navigationController = UINavigationController(rootViewController: viewController)
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        appdelegate.window!.rootViewController = navigationController
        
    }
    
    @IBAction func signupTapped(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle : nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        
        let navigationController = UINavigationController(rootViewController: viewController)
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        appdelegate.window!.rootViewController = navigationController
        
        
    }
    
    func attributedLabelSetup() {
        
        lblNoteAttributed.text =  "Have you been locked out of your account? Need to reset your password? Simply go to https://accountservices.wipro.com to unlock, change/reset your password."
        let text = (lblNoteAttributed.text)!
        
        
        let style = NSMutableParagraphStyle()
        style.alignment = NSTextAlignment.center
        
        
        
        let underlineAttriString = NSMutableAttributedString(string: text, attributes: [NSAttributedString.Key.font:UIFont(
            name: "GothamNarrow-Medium",
            size: 11.0)!, NSAttributedString.Key.paragraphStyle: style])
        let range1 = (text as NSString).range(of: "https://accountservices.wipro.com")
        
        underlineAttriString.addAttribute(NSAttributedString.Key.font,
                                          value: UIFont(
                                            name: "GothamNarrow-Medium",
                                            size: 11.0)!,
                                          range: range1)
        lblNoteAttributed.attributedText = underlineAttriString
        lblNoteAttributed.isUserInteractionEnabled = true;
        lblNoteAttributed.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.tapLabel(_:))))
    }
    
    @objc func tapLabel(_ gesture: UITapGestureRecognizer) {
    
        let text = (lblNoteAttributed.text)!
        let termsRange = (text as NSString).range(of: "https://accountservices.wipro.com")
    

        if gesture.didTapAttributedTextInLabel(lblNoteAttributed, inRange: termsRange) {
    
            let url:URL? = URL(string: "https://accountservices.wipro.com")
    
            if(url != nil &&  UIApplication.shared.canOpenURL(url!)){
              
                UIApplication.shared.open(url!, options: [:], completionHandler: nil)
            }
        }
    }
    
}

//MARK:  dismiss keyboard on background tap
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:    #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
    
//MARK:  tap on attibuted string
extension UITapGestureRecognizer {
    
        func didTapAttributedTextInLabel(_ label: UILabel, inRange targetRange: NSRange) -> Bool {
            // Create instances of NSLayoutManager, NSTextContainer and NSTextStorage
            let layoutManager = NSLayoutManager()
            let textContainer = NSTextContainer(size: CGSize.zero)
            let textStorage = NSTextStorage(attributedString: label.attributedText!)
    
            // Configure layoutManager and textStorage
            layoutManager.addTextContainer(textContainer)
            textStorage.addLayoutManager(layoutManager)
    
            // Configure textContainer
            textContainer.lineFragmentPadding = 0.0
            textContainer.lineBreakMode = label.lineBreakMode
            textContainer.maximumNumberOfLines = label.numberOfLines
            let labelSize = label.bounds.size
            textContainer.size = labelSize
    
            // Find the tapped character location and compare it to the specified range
            let locationOfTouchInLabel = self.location(in: label)
            let textBoundingBox = layoutManager.usedRect(for: textContainer)
            let textContainerOffset = CGPoint(x: (labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x,
                                                  y: (labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y);
            let locationOfTouchInTextContainer = CGPoint(x: locationOfTouchInLabel.x - textContainerOffset.x,
                                                             y: locationOfTouchInLabel.y - textContainerOffset.y);
            let indexOfCharacter = layoutManager.characterIndex(for: locationOfTouchInTextContainer, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
    
            return NSLocationInRange(indexOfCharacter, targetRange)
    }
}


