//
//  utilities.swift
//  Worklist
//
//  Created by Vaibhav Malhotra on 30/10/18.
//  Copyright © 2018 Vaibhav Malhotra. All rights reserved.
//

import UIKit

class utilities {
    //Alert without Action
    static func displayAlert(title: String, message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        guard let viewController = UIApplication.shared.keyWindow?.rootViewController else {
            fatalError("keyWindow has no rootViewController")
            
        }
        viewController.present(alertController, animated: true, completion: nil)
    }
    //Alert with Action
    static func displaySuccessAlert(title: String, message: String,delegate: UIViewController) {
        guard let viewController = UIApplication.shared.keyWindow?.rootViewController else {
            fatalError("keyWindow has no rootViewController")
        }
        var visibleController = UIViewController()
        if let nav = viewController as? UINavigationController {
            visibleController = nav.visibleViewController!
        }
        else{
            visibleController = viewController
        }
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {
            action in
            visibleController.navigationController?.popViewController(animated: true)
        }))
        visibleController.present(alert, animated: true, completion: nil)
    }
    //Alert for Logout
    static func logoutAlert() {
        guard let viewController = UIApplication.shared.keyWindow?.rootViewController else {
            fatalError("keyWindow has no rootViewController")
            
        }
        let logoutAlert = UIAlertController(title: "Log Out", message: "Are You Sure to Log Out ? ", preferredStyle: UIAlertController.Style.alert)
        
        logoutAlert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { (action: UIAlertAction!) in
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let loginController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            let appdelegate = UIApplication.shared.delegate as! AppDelegate
            appdelegate.window!.rootViewController = loginController
        }))
        
        logoutAlert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (action: UIAlertAction!) in
            logoutAlert .dismiss(animated: true, completion: nil)
        }))
        viewController.present(logoutAlert, animated: true, completion: nil)
    }
    
  
}
