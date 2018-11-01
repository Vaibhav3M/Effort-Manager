//
//  DashboardViewController.swift
//  Worklist
//
//  Created by Vaibhav Malhotra on 31/10/18.
//  Copyright © 2018 Vaibhav Malhotra. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITableViewDelegate, UITableViewDataSource {
    
    var taskDataList  = [TaskData]()
    var approvalDataList = [ApprovalData]()
    
    @IBOutlet weak var tableBg: UIView!
    
    @IBOutlet weak var taskSee: UILabel!
    @IBOutlet weak var approvalSee: UILabel!
    
    @IBOutlet weak var taskCollectionView: UICollectionView!

    @IBOutlet weak var approvalTableView: UITableView!
    
    
    let taskCellIdentifier = "taskCell"
    let approvalCellIdentifier = "approvalCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
        taskData()
        approvalData()
        
        //tableView Corner radius
        self.approvalTableView.layer.cornerRadius = 10
        self.approvalTableView.layer.masksToBounds = true
        
        //button Styling
        taskSee.layer.cornerRadius = taskSee.frame.width / 2
        taskSee.layer.masksToBounds = true
        approvalSee.layer.cornerRadius = approvalSee.frame.width / 2
        approvalSee.layer.masksToBounds = true
        
        
        tableBg.layer.cornerRadius = 10
        tableBg.layer.masksToBounds = true
        
        tableBg.layer.shadowColor = UIColor.lightGray.cgColor
        tableBg.layer.shadowOffset = CGSize(width: 0,height: 2.0)
        tableBg.layer.shadowRadius = 2.0
        tableBg.layer.shadowOpacity = 1.0
        tableBg.layer.masksToBounds = false;
        tableBg.layer.shadowPath = UIBezierPath(roundedRect:tableBg.bounds, cornerRadius:tableBg.layer.cornerRadius).cgPath

    }
    
    
   
    func taskData() {
        
        var taskType : [String] = ["My Time", "My Goal", "My Career"]
        var description : [String] = ["Update Efforts", "Fill G&O", "Update Profile"]
        var priority : [UIImage] = [
            UIImage(named: "medium-icon")!,
            UIImage(named: "high-icon")!,
            UIImage(named: "medium-icon")!]
        var dueDate : [String] = ["Due on 23 June 18", "Due on 20 June 18", "Due on 18 June 18"]
        
        for i in 0...2 {
            
            let taskData = TaskData()
            
            taskData.dataTaskType = taskType[i]
            taskData.dataDetail = description[i]
            taskData.dataPriority = priority[i]
            taskData.dataDueDate = dueDate[i]
            
            taskDataList.append(taskData)
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return taskDataList.count

    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = taskCollectionView.dequeueReusableCell(withReuseIdentifier: taskCellIdentifier, for: indexPath as IndexPath) as! TaskCollectionViewCell
        
        var data = TaskData()
        
        data = taskDataList[indexPath.row]
        
        cell.taskTypeCell.text = data.dataTaskType
        cell.descriptionCell.text = data.dataDetail
        cell.dueDateCell.text = data.dataDueDate
        cell.priorityCell.image = data.dataPriority
        
        
        //cell customization corner radius
        cell.layer.cornerRadius = 10.0
        cell.layer.borderWidth = 1.0
        cell.layer.borderColor = UIColor.clear.cgColor
        cell.layer.masksToBounds = true
        
        //cell layer shadow settings
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0,height: 2.0)
        cell.layer.shadowRadius = 2.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false;
        cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.layer.cornerRadius).cgPath
        
        cell.btnMoreItemView.addTarget(self, action: #selector(showMoreCollectionViewButton), for: .touchUpInside)
   // $$$$$$$$$$$$$$$$$$$$ VM $$$$$$$$$$$
        cell.viewMoreItems.layer.cornerRadius = 10.0
        cell.viewMoreItems.layer.borderWidth = 1.0
        cell.viewMoreItems.layer.masksToBounds = true
     
        if indexPath.row < 2
        {
            cell.viewMoreItems.isHidden = true
        }
        cell.lblMoreItems.text = "\(taskDataList.count - 3) more tasks"
        // $$$$$$$$$$$$$$$$$$$$ VM $$$$$$$$$$$
        
        return cell
        
        
    }
    
    //collectionView custom height
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        return CGSize(width: 120 , height: 150)
    
    }
    

    //tableView functions below
    
    func approvalData() {
        
        var type : [String] = ["My Time", "My Financial"]
        var image : [UIImage] = [UIImage(named: "profile1")!,UIImage(named: "profile2")!]
        var dueDate : [String] = ["Will be auto approved on 8:30 PM 23 June 2018","Due on 23 June 18"]
        var description : [String] = ["Annual Leave", "Declaration"]
        var priority : [UIImage] = [UIImage(named: "medium-icon")!,UIImage(named: "high-icon")!]
        
        for i in 0...1 {
        
        let approvalData = ApprovalData()
        
        approvalData.approvalType = type[i] + " - " + description[i]
        approvalData.profileImage = image[i]
        approvalData.approvalDueDate = dueDate[i]
        approvalData.priorityImage = priority[i]
            
        approvalDataList.append(approvalData)
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return approvalDataList.count
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = approvalTableView.dequeueReusableCell(withIdentifier: approvalCellIdentifier, for: indexPath as IndexPath) as! ApprovalCollectionViewCell
        
        var data = ApprovalData()
        
        data = approvalDataList[indexPath.row]
        
        cell.approvalType.text = data.approvalType
        cell.profileImage.image = data.profileImage
        cell.approvalDate.text = data.approvalDueDate
        cell.priorityImage.image = data.priorityImage
        
        //imageview circular
        cell.profileImage.layer.cornerRadius = (cell.profileImage.frame.width) / 2
        cell.profileImage.layer.masksToBounds = true
        
        // $$$$$$$$$$$$$$$$$$$$$$$$$ VM $$$$$$$$$$$
        if (indexPath.row == approvalDataList.count - 1) {
            cell.separatorInset = UIEdgeInsets(top: 0, left: cell.frame.size.width, bottom: 0, right: 15)
        }
        // $$$$$$$$$$$$$$$$$$$$$$$$$ VM $$$$$$$$$$$

        return cell
        
    }
   
    
    @IBAction func taskSeeTapped(_ sender: Any) {
    
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle : nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "TaskApprovalViewController") as! TaskApprovalViewController
        
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        appdelegate.window!.rootViewController = viewController
        
    }
    
    @IBAction func approvalSeeTapped(_ sender: Any) {
    
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle : nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "TaskApprovalViewController") as! TaskApprovalViewController
        
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        appdelegate.window!.rootViewController = viewController
    
    }
    
    @IBAction func homeTapped(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle : nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "DashboardViewController") as! DashboardViewController
        
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        appdelegate.window!.rootViewController = viewController
        
    }
    
    @IBAction func searchTapped(_ sender: Any) {
    }
    
    @IBAction func approveTapped(_ sender: Any) {
    }
    
    @IBAction func rejectTapped(_ sender: Any) {
    }
    
    @IBAction func logoutTapped(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle : nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        appdelegate.window!.rootViewController = viewController
        
        
    }
    
    @IBAction func notificationTapped(_ sender: Any) {
    }
    
    
    @objc func showMoreCollectionViewButton()  {
         
        let taskViewController = self.storyboard?.instantiateViewController(withIdentifier: "TaskApprovalViewController") as! TaskApprovalViewController
        taskViewController.segmentControlIndex = 0
        self.navigationController?.pushViewController(taskViewController, animated: true)
    }
    
}
