//
//  utilities.swift
//  Worklist
//
//  Created by Vaibhav M on 30/10/18.
//  Copyright © 2018 Vaibhav M. All rights reserved.
//

import UIKit

class utilities {
    //MARK: Alert without Action
        static func displayAlert(title: String, message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        guard let viewController = UIApplication.shared.keyWindow?.rootViewController else {
            fatalError("keyWindow has no rootViewController")
            
        }
        viewController.present(alertController, animated: true, completion: nil)
    }
 
    //MARK: Alert for Logout
    static func logoutAlert(controller: UIViewController) {
        guard let viewController = UIApplication.shared.keyWindow?.rootViewController else {
            fatalError("keyWindow has no rootViewController")
            
        }
        let logoutAlert = UIAlertController(title: "Log Out", message: "Are You Sure to Log Out ? ", preferredStyle: UIAlertController.Style.alert)
        
        logoutAlert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { (action: UIAlertAction!) in
            
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let loginController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            let appDelegate = UIApplication.shared.delegate as! AppDelegate

            controller.navigationController?.viewControllers.removeAll()
    
            appDelegate.window?.rootViewController = loginController
            appDelegate.window?.makeKeyAndVisible()
            
        }))
        
        logoutAlert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (action: UIAlertAction!) in
            logoutAlert .dismiss(animated: true, completion: nil)
        }))
        
        viewController.present(logoutAlert, animated: true, completion: nil)
    }
    
  
}
