//
//  SearchViewController.swift
//  Worklist
//
//  Created by Vaibhav M on 11/11/18.
//  Copyright © 2018 Vaibhav M. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var searchIcon: UIButton!
    @IBOutlet weak var searchDropDown: UIButton!
    
    @IBOutlet weak var searchTypeView: UIView!
    
    @IBOutlet weak var btnAutoApproval: UIButton!
    @IBOutlet weak var btnFloatStatus: UIButton!
    @IBOutlet weak var btnFloatTask: UIButton!
    @IBOutlet weak var btnFloatApproval: UIButton!
    @IBOutlet weak var btnFloatClose: UIButton!
    @IBOutlet weak var floatingBtnView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchTypeView.layer.shadowColor = UIColor.lightGray.cgColor
        searchTypeView.layer.shadowOffset = CGSize(width: 0,height: 2.0)
        searchTypeView.layer.shadowRadius = 2.0
        searchTypeView.layer.shadowOpacity = 1.0
        searchTypeView.layer.shadowPath = UIBezierPath(roundedRect:searchTypeView.bounds, cornerRadius:searchTypeView.layer.cornerRadius).cgPath
        
        searchIcon.addTarget(self, action: #selector(searchType), for: .touchUpInside)
        searchDropDown.addTarget(self, action: #selector(searchType), for: .touchUpInside)
        
       //MARK: floating btn actions
        btnFloatClose.addTarget(self, action: #selector(close), for: .touchUpInside)
        btnFloatApproval.addTarget(self, action: #selector(approval), for: .touchUpInside)
        btnFloatTask.addTarget(self, action: #selector(task), for: .touchUpInside)
        btnFloatStatus.addTarget(self, action: #selector(status), for: .touchUpInside)
        btnAutoApproval.addTarget(self, action: #selector(autoApproval), for: .touchUpInside)
        
        
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
    
    @objc func searchType() {
        
        searchTypeView.isHidden = false
    }
    
    
    //MARK:  Action Buttons
    @IBAction func taskSearch(_ sender: Any) {
        
        searchTypeView.isHidden = true
        searchIcon.setImage(UIImage(named: "task-button-icon-s"), for: .normal)
    }
    
    @IBAction func approvalSearch(_ sender: Any) {
        
        searchTypeView.isHidden = true
        searchIcon.setImage(UIImage(named: "approval-button-icon-s"), for: .normal)
    }
    @IBAction func autoApprovalSearch(_ sender: Any) {
        
        searchTypeView.isHidden = true
        searchIcon.setImage(UIImage(named: "status-button-icon-s"), for: .normal)
    }
    
    
    @IBAction func homeTapped(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle : nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "DashboardViewController") as! DashboardViewController
        
        let navigationController = UINavigationController(rootViewController: viewController)
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        appdelegate.window!.rootViewController = navigationController
        
    }
    
    @IBAction func menuTapped(_ sender: Any) {
        searchTypeView.isHidden = true
        floatingBtnView.isHidden = false
    }
    
    @IBAction func searchTapped(_ sender: Any) {
    }

    
}
