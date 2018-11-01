//
//  TaskApprovalViewController.swift
//  Worklist
//
//  Created by Vaibhav Malhotra on 26/10/18.
//  Copyright © 2018 Vaibhav Malhotra. All rights reserved.
//

import UIKit

class TaskApprovalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var taskApprovalLbl: UILabel!
    @IBOutlet weak var approvalTableView: UITableView!
    @IBOutlet weak var taskTableView: UITableView!
    @IBOutlet weak var taskApprovalToggle: UISegmentedControl!
    @IBOutlet weak var hamburgButton: UIButton!
    @IBOutlet weak var singleBulkToggle: UISegmentedControl!
    
    //for Task
    var taskDataList = [TaskData]()
    
    let taskCellIdentifier = "task"
    
    //for Approval
    var approvalDataList = [ApprovalData]()
    
    let approvalCellIdentifier = "approval"
    
    var segmentControlIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Custom Task Approval Toggle
        self.taskApprovalToggle.layer.cornerRadius = taskApprovalToggle.bounds.height / 2
        self.taskApprovalToggle.layer.borderWidth = 1
        self.taskApprovalToggle.layer.borderColor = UIColor.yellow.cgColor
        self.taskApprovalToggle.layer.masksToBounds = true
        
        // Custom Single Bulk Toggle
        self.singleBulkToggle.layer.cornerRadius = singleBulkToggle.bounds.height / 2
        self.singleBulkToggle.layer.borderWidth = 1
        self.singleBulkToggle.layer.masksToBounds = true
        
        self.taskApprovalToggle.selectedSegmentIndex = segmentControlIndex
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        getTaskData()
        getApprovalData()
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    
    
    //approval data call
    func getApprovalData() {
        
        var name : [String] = ["Rimmy Will", "John Will", "Mohan","Rimmy Will", "John Will", "Mohan"]
        var type : [String] = ["My Time", "My Leave","Declaration", "My Time", "My Leave","Declaration"]
        var image : [UIImage] = [UIImage(named: "profile1")!,UIImage(named: "profile2")!,UIImage(named: "profile3")!,UIImage(named: "profile1")!,UIImage(named: "profile2")!,UIImage(named: "profile3")!]
        var description : [String] = ["Lorem ipsum dolor sit amet, consectetaur","Lorem ipsum dolor sit amet, consectetaur","Lorem ipsum dolor sit amet, consectetaur","Lorem ipsum dolor sit amet, consectetaur","Lorem ipsum dolor sit amet, consectetaur","Lorem ipsum dolor sit amet, consectetaur"]
        
        for i in 0...5
        {
            let approvalData = ApprovalData()
            approvalData.employeeName = name[i]
            approvalData.approvalType = type[i]
            approvalData.profileImage = image[i]
            approvalData.approvalDescription = description[i]
            
            approvalDataList.append(approvalData)
        }
    }
    
    //task data call
    func getTaskData() {
        
        var taskType : [String] = ["My Time", "My Goal", "My Career"]
        var detail : [String] = ["Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do", "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do", "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do"]
        var priority : [UIImage] = [
            UIImage(named: "medium-icon")!,
            UIImage(named: "medium-icon")!,
            UIImage(named: "medium-icon")! ]
        var dueDate : [String] = ["Due on 8:30 PM 23 June 2018", "Due on 8:30 PM 23 June 2018", "Due on 8:30 PM 23 June 2018"]
        for i in 0...2
        {
            let taskData = TaskData()
            taskData.dataTaskType = taskType[i]
            taskData.dataDetail = detail[i]
            taskData.dataPriority = priority[i]
            taskData.dataDueDate = dueDate[i]
            
            taskDataList.append(taskData)
        }
    }

    
    
    
    //tableview configurations
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var rows = 0
        
        if tableView == taskTableView {
            
            rows =  taskDataList.count
            
        } else if tableView == approvalTableView {
           
            rows =  approvalDataList.count

        }
        
        return rows
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == taskTableView {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: taskCellIdentifier, for: indexPath as IndexPath) as! TaskViewCell
            
            var data = TaskData()
            
            data = taskDataList[indexPath.row]
            
            cell.taskTypeCell.text = data.dataTaskType
            cell.descriptionCell.text = data.dataDetail
            cell.priorityCell.image = data.dataPriority
            cell.dueDatecell.text = data.dataDueDate
            
            return cell
            
        } else if tableView == approvalTableView {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: approvalCellIdentifier, for: indexPath as IndexPath) as! ApprovalViewCell
            
            var data = ApprovalData()
            
            data = approvalDataList[indexPath.row]

            cell.nameCell.text = data.employeeName
            cell.descriptionCell.text = data.approvalDescription
            cell.imageCell.image = data.profileImage
            cell.typeCell.text = data.approvalType
            
            return cell
        }
        
        return UITableViewCell()

    }
    
    
    //right swipe to approve

    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        if tableView == approvalTableView {
        
        let approve = UIContextualAction(style: .normal, title: "Approve") { (action , view, nil) in
        }
        
        approve.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        
//        utilities.displayAlert(title: "Approved Successfully", message: "")

        return UISwipeActionsConfiguration(actions: [approve])
        
        }
        
        return UISwipeActionsConfiguration()
        
    }
    
    //left swipe to reject
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        if tableView == approvalTableView {
        
        let reject = UIContextualAction(style: .normal, title: "Reject") { (action , view, nil) in
        }
        
        reject.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        
//        utilities.displayAlert(title: "Rejected Successfully", message: "")
            
        return UISwipeActionsConfiguration(actions: [reject])

        }
        
        return UISwipeActionsConfiguration()
        
    }
    
    
    //Toggle Segment Configurations
    
    @IBAction func taskApprovalTapped(_ sender: Any) {
        
        switch taskApprovalToggle.selectedSegmentIndex {
        
        case 0:
            
            taskTableView.isHidden = false
            approvalTableView.isHidden = true
            taskApprovalLbl.text = "Tasks"
            
        case 1:
            
            taskTableView.isHidden = true
            approvalTableView.isHidden = false
            taskApprovalLbl.text = "Approvals"
            
        default:
            break
        }
        
    }
    
    @IBAction func singleBulkTapped(_ sender: Any) {
    }
    
    @IBAction func logoutTapped(_ sender: Any) {
    
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle : nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        appdelegate.window!.rootViewController = viewController
    
    }
    
    @IBAction func homeTapped(_ sender: Any) {
    
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle : nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "DashboardViewController") as! DashboardViewController
        
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        appdelegate.window!.rootViewController = viewController
        
    }
    
}
