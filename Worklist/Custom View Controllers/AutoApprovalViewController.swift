//
//  AutoApprovalViewController.swift
//  Worklist
//
//  Created by Bimalesh Sahoo on 04/11/18.
//  Copyright © 2018 Bimalesh Sahoo. All rights reserved.
//

import UIKit

class AutoApprovalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var autoApprovalTableView: UITableView!
    
    @IBOutlet weak var lblApprovalCount: UILabel!
    
    @IBOutlet weak var btnAutoApproval: UIButton!
    @IBOutlet weak var btnFloatStatus: UIButton!
    @IBOutlet weak var btnFloatTask: UIButton!
    @IBOutlet weak var btnFloatApproval: UIButton!
    @IBOutlet weak var btnFloatClose: UIButton!
    @IBOutlet weak var floatingBtnView: UIView!
    
    var autoApprovalDataList = [AutoApprovalData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        autoApprovalData()
        
        lblApprovalCount.text = String(autoApprovalDataList.count)
        lblApprovalCount.layer.cornerRadius = lblApprovalCount.frame.width / 2
        lblApprovalCount.layer.masksToBounds = true
        
        //floating btn actions
        btnFloatClose.addTarget(self, action: #selector(close), for: .touchUpInside)
        btnFloatApproval.addTarget(self, action: #selector(approval), for: .touchUpInside)
        btnFloatTask.addTarget(self, action: #selector(task), for: .touchUpInside)
        btnFloatStatus.addTarget(self, action: #selector(status), for: .touchUpInside)
        btnAutoApproval.addTarget(self, action: #selector(autoApproval), for: .touchUpInside)
    }
    
    
    // tableview functions delegate & datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return autoApprovalDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = autoApprovalTableView.dequeueReusableCell(withIdentifier: "autoApproval", for: indexPath as IndexPath) as! AutoApprovalViewCell
        
        var data = AutoApprovalData()
        
        data = autoApprovalDataList[indexPath.row]
        
        cell.approvalType.text = data.approvalType
        cell.approvalDescription.text = data.approvalDescription
        cell.profileImage.image = data.profileImage
        cell.dateApproved.text = data.autoApprovalDate
        
        
        return cell
    }
    
    
    //left swipe to clear Row Action
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    
        let clear = UIContextualAction.init(style: .normal, title: "Clear") { (action, view, nil) in
            
            self.autoApprovalTableView.reloadData()
            
        }

        clear.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        clear.image = #imageLiteral(resourceName: "reject-icon-s")
        
        let config = UISwipeActionsConfiguration(actions: [clear])
        config.performsFirstActionWithFullSwipe = false
        
        return config
    }
    
    //auto_approval data
    func autoApprovalData() {
        
        var approvalType : [String] = ["My Time", "My Learning", "My Career", "My Time","My Time", "My Goal", "My Career", "My Time"]
        var description : [String] = ["OOD", "Additional Skill Mapping", "Update Profile", "Update Efforts","Update Efforts", "Fill G&O", "Update Profile", "Update Efforts"]
        
        var profileImage : [UIImage] = [UIImage(named: "profile1")!,UIImage(named: "profile2")!, UIImage(named: "profile3")!,UIImage(named: "profile2")!, UIImage(named: "profile1")!,UIImage(named: "profile3")!, UIImage(named: "profile1")!,UIImage(named: "profile2")!]
        
        var autoApprovalDate : [String] = ["Today", "Today", "Today", "Today", "21-11-2018", "22-11-2018", "24-11-2018", "30-11-2018"]
        
        for i in 0...7 {
            
            let autoApprovalData = AutoApprovalData()
            
            autoApprovalData.approvalType = approvalType[i]
            autoApprovalData.approvalDescription = description[i]
            autoApprovalData.profileImage = profileImage[i]
            autoApprovalData.autoApprovalDate = autoApprovalDate[i]
            
            autoApprovalDataList.append(autoApprovalData)
            
        }
        
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
    
    // floating button functions
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
    }
    
    @objc func status() {
        floatingBtnView.isHidden = true
        
        let statusView = self.storyboard?.instantiateViewController(withIdentifier: "StatusViewController") as! StatusViewController
        
        self.navigationController?.pushViewController(statusView, animated: true)
    }
    
    
    // action buttons
    
    @IBAction func profileTapped(_ sender: Any) {
        let profileView = self.storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
      
        self.navigationController?.pushViewController(profileView, animated: true)
        
    }
    
    @IBAction func notificationTapped(_ sender: Any) {
        
        let notificationView = self.storyboard?.instantiateViewController(withIdentifier: "NotificationViewController") as! NotificationViewController
        
        self.navigationController?.pushViewController(notificationView, animated: true)
    }
    
    @IBAction func logoutTapped(_ sender: Any) {
        utilities.logoutAlert()

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
