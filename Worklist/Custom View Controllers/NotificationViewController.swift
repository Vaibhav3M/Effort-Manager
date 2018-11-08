//
//  NotificationViewController.swift
//  Worklist
//
//  Created by Bimalesh Sahoo on 06/11/18.
//  Copyright © 2018 Bimalesh Sahoo. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var notificationTableView: UITableView!
    
    @IBOutlet weak var btnAutoApproval: UIButton!
    @IBOutlet weak var btnFloatStatus: UIButton!
    @IBOutlet weak var btnFloatTask: UIButton!
    @IBOutlet weak var btnFloatApproval: UIButton!
    @IBOutlet weak var btnFloatClose: UIButton!
    @IBOutlet weak var floatingBtnView: UIView!

    
    var notificationDataList = [NotificationData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        notificationData()
        
        //floating btn actions
        btnFloatClose.addTarget(self, action: #selector(close), for: .touchUpInside)
        btnFloatApproval.addTarget(self, action: #selector(approval), for: .touchUpInside)
        btnFloatTask.addTarget(self, action: #selector(task), for: .touchUpInside)
        btnFloatStatus.addTarget(self, action: #selector(status), for: .touchUpInside)
        btnAutoApproval.addTarget(self, action: #selector(autoApproval), for: .touchUpInside)
        
}
    
// Tableview functions Datasource and Delegates
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notificationDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = notificationTableView.dequeueReusableCell(withIdentifier: "notification", for: indexPath as IndexPath) as! NotificationViewCell
        
        var data = NotificationData()
        
        data = notificationDataList[indexPath.row]
        
        cell.notificationType.text = data.notificationType
        cell.notificationDescription.text = data.notificationDescription
        cell.notificationDate.text = data.notificationDate
        cell.profileImage.image = data.profileImage
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        tableView.deselectRow(at: indexPath, animated: true)
    }

    
    func notificationData() {
        
        var notificationType : [String] = ["Clarification Request", "Attendance Edit", "Expense Claims", "Goals and Objectives", "Clarification Request", "Attendance Edit", "Expense Claims", "Goals and Objectives"]
        var notificationDescription : [String] = ["Lorem ipsum dolor sit amet, consectetur", "Lorem ipsum dolor sit amet, consectetur", "Lorem ipsum dolor sit amet, consectetur", "Lorem ipsum dolor sit amet, consectetur", "Lorem ipsum dolor sit amet, consectetur", "Lorem ipsum dolor sit amet, consectetur", "Lorem ipsum dolor sit amet, consectetur", "Lorem ipsum dolor sit amet, consectetur"]
        var notificationDate : [String] = ["Today", "Today", "Today", "05-11-2018", "01-11-2018", "31-10-2018", "25-10-2018", "15-10-2018"]
        var profileImage : [UIImage] = [UIImage(named: "profile1")!, UIImage(named: "profile2")!, UIImage(named: "profile3")!, UIImage(named: "profile2")!, UIImage(named: "profile1")!, UIImage(named: "profile3")!, UIImage(named: "profile1")!, UIImage(named: "profile2")!]
        
        for i in 0...7 {
            
            let notificationData = NotificationData()
            
            notificationData.notificationType = notificationType[i]
            notificationData.notificationDescription = notificationDescription[i]
            notificationData.notificationDate = notificationDate[i]
            notificationData.profileImage = profileImage[i]
            
            notificationDataList.append(notificationData)
            
        }
        
    }
    
    //clear all button function
    
    func clearAll() {
        utilities.displayAlert(title: "Alert!", message: "All Notifications cleared.")
        
        //add clear action here ----------- ///////
        
        notificationTableView.reloadData()
    }
    
    
    // left swipe to clear row action
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let clear = UIContextualAction.init(style: .normal, title: "Clear") { (action, view, nil) in
            
            self.notificationTableView.reloadData()
            
        }
        
        clear.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        clear.image = #imageLiteral(resourceName: "reject-icon-s")
        
        let config = UISwipeActionsConfiguration(actions: [clear])
        config.performsFirstActionWithFullSwipe = false
        
        return config
    }
    
    //objc function definations
    
    @objc func showMoreTaskViewButton()  {
        
        let taskView = self.storyboard?.instantiateViewController(withIdentifier: "TaskApprovalViewController") as! TaskApprovalViewController
        
        taskView.segmentControlIndex = 0
        
                self.navigationController?.pushViewController(taskView, animated: true)
        
    }
    
    @objc func seeAllApprovalViewButton()  {
        
        let approvalView = self.storyboard?.instantiateViewController(withIdentifier: "TaskApprovalViewController") as! TaskApprovalViewController
        
        approvalView.segmentControlIndex = 1
        
                self.navigationController?.pushViewController(approvalView, animated: true)
        
    }
    
    
    @objc func close() {
        floatingBtnView.isHidden = true
    }
    
    @objc func approval() {
        floatingBtnView.isHidden = true
        
        seeAllApprovalViewButton()
    }
    
    @objc func task() {
        floatingBtnView.isHidden = true
        
        showMoreTaskViewButton()
    }
    
    @objc func autoApproval() {
        floatingBtnView.isHidden = true
        
        let autoApprovalView = self.storyboard?.instantiateViewController(withIdentifier: "AutoApprovalViewController") as! AutoApprovalViewController
        
                self.navigationController?.pushViewController(autoApprovalView, animated: true)
    }
    
    @objc func status() {
        floatingBtnView.isHidden = true
        
        let statusView = self.storyboard?.instantiateViewController(withIdentifier: "NotificationViewController") as! NotificationViewController
        
            self.navigationController?.pushViewController(statusView, animated: true)

    }
    
    
    //Button Actions
    
    @IBAction func profileTapped(_ sender: Any) {
        let profileView = self.storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        
                self.navigationController?.pushViewController(profileView, animated: true)

    }
    
    @IBAction func notificationTapped(_ sender: Any) {
    
    }
    
    @IBAction func logoutTapped(_ sender: Any) {
     utilities.logoutAlert()
    }
    
    @IBAction func clearAllTapped(_ sender: Any) {
    clearAll()
    
    }
    
    @IBAction func clearIconTapped(_ sender: Any) {
    clearAll()
    
    }
    
    @IBAction func homeTapped(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle : nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "DashboardViewController") as! DashboardViewController
        
        let navigationController = UINavigationController(rootViewController: viewController)
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        appdelegate.window!.rootViewController = navigationController
        
    }
    
    @IBAction func menuTapped(_ sender: Any) {
        floatingBtnView.isHidden = false

    }
    
    @IBAction func searchTapped(_ sender: Any) {
    }
    
}
