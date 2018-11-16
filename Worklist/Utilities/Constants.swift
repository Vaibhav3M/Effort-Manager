//
//  Constants.swift
//  Worklist
//
//  Created by Vaibhav M on 14/11/18.
//  Copyright © 2018 Vaibhav M. All rights reserved.
//

import UIKit

//MARK:  TASK DATA
var taskType : [String] = ["My Time", "My Goal", "My Career", "My Time"]
var taskDetail : [String] = ["Update Efforts", "Fill G&O", "Update Profile", "Update Efforts"]
var taskDescription : [String] = ["Update Efforts", "Fill G&O", "Update Profile", "Update Efforts"]
var taskPriority : [UIImage] = [UIImage(named: "medium-icon")!, UIImage(named: "high")!, UIImage(named: "medium-icon")!, UIImage(named: "medium-icon")!]
var taskDueDate : [String] = ["Due on 23 June 18", "Due on 20 June 18", "Due on 18 June 18", "Due on 23 June 18"]

//MARK:  APPROVAL DATA

var name : [String] = ["Rimmy Will", "John Will", "Mohan","Rimmy Will", "John Will", "Mohan"]
var approvalType : [String] = ["My Time", "My Leave","Expense Claims", "My Time", "My Leave","Expense Claims"]
var image : [UIImage] = [UIImage(named: "profile1")!,UIImage(named: "profile2")!,UIImage(named: "profile3")!,UIImage(named: "profile1")!,UIImage(named: "profile2")!,UIImage(named: "profile3")!]
var approvalDescription : [String] = ["Efforts", "Annual Leave", "Claim Approval", "Efforts", "Annual Leave", "Claim Approval"]
var approvalDueDate : [String] = ["Will be auto approved on 8:30 PM 23 June 2018","Due on 23 June 18", "Will be auto approved on 8:30 PM 23 June 2018", "Will be auto approved on 8:30 PM 23 June 2018","Due on 23 June 18", "Will be auto approved on 8:30 PM 23 June 2018"]
var approvalPriority : [UIImage] = [UIImage(named: "medium-icon")!,UIImage(named: "high")!, UIImage(named: "medium-icon")!, UIImage(named: "medium-icon")!,UIImage(named: "high")!, UIImage(named: "medium-icon")!]

//MARK:  Notification DATA
var notificationType : [String] = ["Clarification Request", "Attendance Edit", "Expense Claims", "Goals and Objectives", "Clarification Request", "Attendance Edit", "Expense Claims", "Goals and Objectives"]
var notificationDescription : [String] = ["Lorem ipsum dolor sit amet, consectetur", "Lorem ipsum dolor sit amet, consectetur", "Lorem ipsum dolor sit amet, consectetur", "Lorem ipsum dolor sit amet, consectetur", "Lorem ipsum dolor sit amet, consectetur", "Lorem ipsum dolor sit amet, consectetur", "Lorem ipsum dolor sit amet, consectetur", "Lorem ipsum dolor sit amet, consectetur"]
var notificationDate : [String] = ["Today", "Today", "Today", "05-11-2018", "01-11-2018", "31-10-2018", "25-10-2018", "15-10-2018"]
var notificationImage : [UIImage] = [UIImage(named: "profile1")!, UIImage(named: "profile2")!, UIImage(named: "profile3")!, UIImage(named: "profile2")!, UIImage(named: "profile1")!, UIImage(named: "profile3")!, UIImage(named: "profile1")!, UIImage(named: "profile2")!]

//MARK:  Status DATA
var statusType : [String] = ["My Time", "My Learning", "My Career", "My Time","My Time", "My Goal", "My Career", "My Time"]
var escalation : [String] = ["Yes", "Yes", "No", "Yes", "No", "Yes", "No", "Yes"]

var statusImage : [UIImage] = [UIImage(named: "profile1")!,UIImage(named: "profile2")!, UIImage(named: "profile3")!,UIImage(named: "profile2")!, UIImage(named: "profile1")!,UIImage(named: "profile3")!, UIImage(named: "profile1")!,UIImage(named: "profile2")!]

var daysLeft : [Int] = [2, 0, 1, 2, 5, 7, 8, 2]

//MARK:  Auto APPROVAL DATA
var autoApprovalDate : [String] = ["Today", "Today", "21-11-2018", "22-11-2018", "24-11-2018", "30-11-2018"]

//MARK:  COLOR CONSTANTS

let customBlue = #colorLiteral(red: 0, green: 0.6352941176, blue: 0.8784313725, alpha: 1) //hex code - 00A2E0
let customGreen = #colorLiteral(red: 0.06274509804, green: 0.6823529412, blue: 0.4823529412, alpha: 1) //hex code - 10AE7B
let customRed = #colorLiteral(red: 0.9254901961, green: 0.2352941176, blue: 0.1019607843, alpha: 1) //hex code - EC3C1A
let customYellow = #colorLiteral(red: 0.9803921569, green: 0.8784313725, blue: 0.2666666667, alpha: 1) // hex code - FAE044
let customGrey = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) // hex code - FFFFFF
let customDarkGrey = #colorLiteral(red: 0.4, green: 0.4, blue: 0.4, alpha: 1) // hex code - 666666

//MARK:  Alert Messages

let invalidEmail = "Invalid Email!"
let invalidPassword = "Invalid Password!"
let invalidCredentials = "Invalid Credentials!"
let passwordLength = "Password length should be atleast 6 characters and must contain 1 Lowercase 1 Uppercase and 1 Number."
let enterEmail = "Please Enter your work email Id."
let fillAllFields = "Please fill all the fields."
let misMatch = "Mis Match!"
let passwordUnmatch = "Passwords Do not Match."
let invalidId = "Invalid Employee Id!"
let enterId = "Please Enter your employee Id."
let alert = "Alert!"
let invalidName = "Invalid Name."
let requestApproved = "Request Approved Successfully"
let requestRejected = "Request Rejected Successfully"
let blank = ""
let allClear = "All Cleared !"
let reminderSent = "Reminder Successfully Sent."
