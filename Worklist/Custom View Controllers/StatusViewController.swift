//
//  StatusViewController.swift
//  Worklist
//
//  Created by Vaibhav M on 04/11/18.
//  Copyright © 2018 Vaibhav M. All rights reserved.
//

import UIKit

class StatusViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var statusTableView: UITableView!
    
    @IBOutlet weak var lblStatusCount: UILabel!
    
    @IBOutlet weak var btnAutoApproval: UIButton!
    @IBOutlet weak var btnFloatStatus: UIButton!
    @IBOutlet weak var btnFloatTask: UIButton!
    @IBOutlet weak var btnFloatApproval: UIButton!
    @IBOutlet weak var btnFloatClose: UIButton!
    @IBOutlet weak var floatingBtnView: UIView!

    var statusDataList = [StatusData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        statusData()
        lblStatusCount.text = String(statusDataList.count)
        lblStatusCount.layer.cornerRadius = lblStatusCount.frame.width / 2
        lblStatusCount.layer.masksToBounds = true
        
	//MARK: floating btn actions
        btnFloatClose.addTarget(self, action: #selector(close), for: .touchUpInside)
        btnFloatApproval.addTarget(self, action: #selector(approval), for: .touchUpInside)
        btnFloatTask.addTarget(self, action: #selector(task), for: .touchUpInside)
        btnFloatStatus.addTarget(self, action: #selector(status), for: .touchUpInside)
        btnAutoApproval.addTarget(self, action: #selector(autoApproval), for: .touchUpInside)
	
    }
    
    //MARK: table view functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statusDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = statusTableView.dequeueReusableCell(withIdentifier: "status", for: indexPath as IndexPath) as! StatusViewCell
        
        var data = StatusData()
        
        data = statusDataList[indexPath.row]
        
        cell.statusType.text = data.statusType
        cell.profileImage.image = data.profileImage
        cell.daysLeft.text = "Days Left: " + String(data.daysLeft)
        cell.escalation.text = data.escalationType
        
       //MARK: priority color setting property using color literal
        if data.daysLeft == 0 {
            cell.priorityIndicator.backgroundColor = customRed
        } else if data.daysLeft < 5 && data.daysLeft > 0 {
            cell.priorityIndicator.backgroundColor = customYellow
        } else if data.daysLeft > 4 {
            cell.priorityIndicator.backgroundColor = customGrey
            cell.priorityIndicator.layer.borderWidth = 1.0
            cell.priorityIndicator.layer.borderColor = UIColor.lightGray.cgColor
        }
        
       //MARK:  yes and no colour property setting
        if cell.escalation.text == "Yes" {
            cell.escalation.textColor = customBlue
        } else if cell.escalation.text == "No" {
            cell.escalation.textColor = customDarkGrey
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
   //MARK: swipe Row Actions
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let reminder = UIContextualAction.init(style: .normal, title: "Send Reminder") { (action, view, nil) in
            
            self.statusTableView.reloadData()
            
            utilities.displayAlert(title: alert, message: reminderSent)
        }
        
        reminder.image = UIImage(named: "reminder-icon")
        reminder.backgroundColor = customBlue
        
        let config = UISwipeActionsConfiguration(actions: [reminder])
        config.performsFirstActionWithFullSwipe = false
        
        return config
    }
    
    
    func statusData() {
        
        for i in 0...7 {
            
            let statusData = StatusData()
            
            statusData.statusType = statusType[i]
            statusData.profileImage = statusImage[i]
            statusData.daysLeft = daysLeft[i]
            statusData.escalationType = escalation[i]
            
            statusDataList.append(statusData)
        
        }
            
    }
    
    //MARK: objc function definations
    
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
        
    }
    
    //MARK: Action Buttons
    @IBAction func profileTapped(_ sender: Any) {
        let profileView = self.storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        
        self.navigationController?.pushViewController(profileView, animated: true)
        
    }
    
    @IBAction func notificationTapped(_ sender: Any) {
        let notificationView = self.storyboard?.instantiateViewController(withIdentifier: "NotificationViewController") as! NotificationViewController
        
        self.navigationController?.pushViewController(notificationView, animated: true)
    }
    
    @IBAction func logoutTapped(_ sender: Any) {
        utilities.logoutAlert(controller: self)

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
        let notificationView = self.storyboard?.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        
        self.navigationController?.pushViewController(notificationView, animated: false)
    }
    
}
