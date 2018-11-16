//
//  ProfileViewController.swift
//  Worklist
//
//  Created by Vaibhav M on 01/11/18.
//  Copyright © 2018 Vaibhav M. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var imageProfile: UIImageView!
    
    @IBOutlet weak var lblProfileName: UILabel!
    
    @IBOutlet weak var lblDesignationDomain: UILabel!
    
    @IBOutlet weak var lblProjectTagged: UILabel!
    
    @IBOutlet weak var lblSupervisor: UILabel!
    
    @IBOutlet weak var lblHRManager: UILabel!

    @IBOutlet weak var btnAutoApproval: UIButton!
    @IBOutlet weak var btnFloatStatus: UIButton!
    @IBOutlet weak var btnFloatTask: UIButton!
    @IBOutlet weak var btnFloatApproval: UIButton!
    @IBOutlet weak var btnFloatClose: UIButton!
    @IBOutlet weak var floatingBtnView: UIView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileName()
        
        
        //designation practice mapping
        let designation : String = "Enterprise Architect"
        let practice : String = "Digital"
        lblDesignationDomain.text = designation + ", " + practice
        
        //project name on which tagged
        lblProjectTagged.text = "Fifth Third Processing Solutions"
        
        //Immediate Supervisor
        lblSupervisor.text = "Sandeep Anand"
        
        //HR Manager
        lblHRManager.text = "Bhagyashree Raj"
        

     //MARK: floating btn actions
        btnFloatClose.addTarget(self, action: #selector(close), for: .touchUpInside)
        btnFloatApproval.addTarget(self, action: #selector(approval), for: .touchUpInside)
        btnFloatTask.addTarget(self, action: #selector(task), for: .touchUpInside)
        btnFloatStatus.addTarget(self, action: #selector(status), for: .touchUpInside)
        btnAutoApproval.addTarget(self, action: #selector(autoApproval), for: .touchUpInside)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        //image mapping
        imageProfile.image = UIImage(named: "profile1")
        imageProfile.layer.cornerRadius = imageProfile.frame.height / 2
        imageProfile.layer.masksToBounds = true
    }
    
    //MARK: Fetch profile name from coreData
    func profileName() {
        
        localDatabase.fetchProfileData(profileName: lblProfileName)
        
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
        
        
        let statusView = self.storyboard?.instantiateViewController(withIdentifier: "StatusViewController") as! StatusViewController
        
        self.navigationController?.pushViewController(statusView, animated: true)
    }
    
  //MARK ->> Action Buttons
    @IBAction func btnProfileTapped(_ sender: Any) {
       
      
    }
    
    
    @IBAction func btnNotificationTapped(_ sender: Any) {
        
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
    
    @IBAction func btnSearchTapped(_ sender: Any) {
    
        let notificationView = self.storyboard?.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        
        self.navigationController?.pushViewController(notificationView, animated: false)
    
    }

}
