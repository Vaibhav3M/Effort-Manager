//
//  Validations.swift
//  Worklist
//
//  Created by Vaibhav M on 14/11/18.
//  Copyright © 2018 Vaibhav M. All rights reserved.
//

import UIKit

class validations {
    
    static func isValidName(name : String) -> Bool {
        let nameRegEx = "^[a-zA-Z]{4,}(?: [a-zA-Z]+){0,2}$"
        let Test = NSPredicate(format: "SELF MATCHES %@", nameRegEx)
        return Test.evaluate(with: name)
    }
    
    static func isValidId(id: String) -> Bool {
        
        let idRegEx = "^[0-9]{2,}$"
        let idTest = NSPredicate(format: "SELF MATCHES %@", idRegEx)
        return idTest.evaluate(with: id)
        
    }
    
    static func isPasswordValid(password : String) -> Bool {
        
        let passwordRegEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{6,}"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return passwordTest.evaluate(with: password)
    }
    
    static func isValidEmail(email : String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
}
