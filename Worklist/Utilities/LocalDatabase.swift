//
//  LocalDatabase.swift
//  Worklist
//
//  Created by Vaibhav M on 14/11/18.
//  Copyright © 2018 Vaibhav M. All rights reserved.
//

import UIKit
import CoreData

class localDatabase {
    //MARK: Login Details
    static func logIn(usernameTxtField: UITextField, passTxtField: UITextField) {
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "UserData")
        let username = usernameTxtField.text
        let password = passTxtField.text
        
        request.predicate = NSPredicate (format: "username == %@", username!)
        
        do {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            
            let results = try context.fetch(request)
            
            if results.count > 0 {
                
                for result in results as! [NSManagedObject] {
                    
                    let usernameCheck = (result as AnyObject).value(forKey: "username") as! String
                    UserDefaults.standard.set(usernameCheck, forKey: "Username")
                    
                    let passwordCheck = (result as AnyObject).value(forKey: "password") as! String
                    UserDefaults.standard.set(passwordCheck, forKey: "Password")
                    
                    if (username == usernameCheck) && (password == passwordCheck) {
                        
                        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle : nil)
                        let viewController = storyBoard.instantiateViewController(withIdentifier: "DashboardViewController") as! DashboardViewController
                        
                        let navigationController = UINavigationController(rootViewController: viewController)
                        let appdelegate = UIApplication.shared.delegate as! AppDelegate
                        appdelegate.window!.rootViewController = navigationController
                        
                    } else if (username == usernameCheck) && (password != passwordCheck) {
                        
                        utilities.displayAlert(title: "Invalid Password !", message: "Please enter the correct password.")
                        
                    }
                    
                }
                
            } else {
                utilities.displayAlert(title: "User Not Registered !", message: "Please sign up first.")
            }
            
            
        } catch {
            print("error")
        }
        
    }
    
    //MARK: SignUp Details
    static func signUp(nameTxtField: UITextField, idTxtField: UITextField, usernameTxtField: UITextField, passTxtField: UITextField) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "UserData")
        let username = usernameTxtField.text
        request.predicate = NSPredicate (format: "username == %@", username!)
        
        do {
            
            let results = try context.fetch(request)
            
            if results.count > 0 {
                
                for result in results as! [NSManagedObject] {
                    
                    
                    let usernameCheck = (result as AnyObject).value(forKey: "username") as! String
                    
                    if (username == usernameCheck) {
                        
                        utilities.displayAlert(title: "Already Registered !", message: "Please Log In")
                        logIn()
                    }
                    
                }
                
            } else {
                
                let _:AppDelegate = (UIApplication.shared.delegate as! AppDelegate)
                let context:NSManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                let newUser = NSEntityDescription.insertNewObject(forEntityName: "UserData", into: context) as NSManagedObject
                newUser.setValue(nameTxtField.text, forKey: "name")
                newUser.setValue(idTxtField.text, forKey: "empid")
                newUser.setValue(usernameTxtField.text, forKey: "username")
                newUser.setValue(passTxtField.text, forKey: "password")
                
                do {
                    
                    try context.save()
                    
                } catch { }
                
                print(newUser)
                print("Object Saved.")
                
                utilities.displayAlert(title: "Sign Up Successful !", message: "Please proceed to login.")
                
                logIn()
                
            }
            
        } catch {
            
        }
        
    }
    //MARK: ProfileData Details
    static func fetchProfileData(profileName: UILabel) {
        var profileNameFetch = ""
        let appDelegate =  UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "UserData")
        request.returnsObjectsAsFaults = false
        
       if let username = UserDefaults.standard.string(forKey: "Username")
       {
        request.predicate = NSPredicate (format: "username == %@", username)
        }
        
        do {
            let results = try context.fetch(request)
            
            if results.count > 0 {
                
                for result in results as! [NSManagedObject] {
                    
                    if let profileName = result.value(forKey: "name") as? String {
                        
                        profileNameFetch = profileName
                    }
                }
            }
        } catch {
            print("Error")
        }
        
        profileName.text = profileNameFetch.uppercased()
    }
    
    //MARK: Login func
    static func logIn() {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let loginController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        appDelegate.window?.rootViewController = loginController
        appDelegate.window?.makeKeyAndVisible()
        
    }
    
}
