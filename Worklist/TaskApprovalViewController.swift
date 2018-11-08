//
//  TaskApprovalViewController.swift
//  Worklist
//
//  Created by Bimalesh Sahoo on 26/10/18.
//  Copyright © 2018 Bimalesh Sahoo. All rights reserved.
//

import UIKit


class TaskApprovalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var btnBulkReject: UIButton!
    @IBOutlet weak var btnBulkApproval: UIButton!
    
    @IBOutlet weak var lblTotalApproval: UILabel!
    @IBOutlet weak var lblApprovalCount: UILabel!
    @IBOutlet weak var taskApprovalLbl: UILabel!
    
    @IBOutlet weak var approvalTableView: UITableView!
    @IBOutlet weak var taskTableView: UITableView!
    
    @IBOutlet weak var taskApprovalToggle: CustomSegmentedControl!
    @IBOutlet weak var singleBulkToggle: CustomSegmentedControl!
    
    @IBOutlet weak var btnAutoApproval: UIButton!
    @IBOutlet weak var btnFloatStatus: UIButton!
    @IBOutlet weak var btnFloatTask: UIButton!
    @IBOutlet weak var btnFloatApproval: UIButton!
    @IBOutlet weak var btnFloatClose: UIButton!
    @IBOutlet weak var floatingBtnView: UIView!
    
    
    //for Task
    var taskDataList = [TaskData]()
    
    let taskCellIdentifier = "task"
    
    //for Approval
    var approvalDataList = [ApprovalData]()
    
    let approvalCellIdentifier = "approval"
    
    var segmentControlIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getTaskData()
        getApprovalData()
        lblApprovalCount.text = String(approvalDataList.count)
        
        taskApprovalToggle.layer.cornerRadius = taskApprovalToggle.frame.height / 2
        taskApprovalToggle.layer.masksToBounds = true
        
        singleBulkToggle.layer.cornerRadius = singleBulkToggle.bounds.height / 2
        singleBulkToggle.layer.masksToBounds = true
        
        lblApprovalCount.layer.cornerRadius = lblApprovalCount.frame.height / 2
        lblApprovalCount.layer.masksToBounds = true
        
        btnFloatClose.addTarget(self, action: #selector(close), for: .touchUpInside)
        btnFloatApproval.addTarget(self, action: #selector(approval), for: .touchUpInside)
        btnFloatTask.addTarget(self, action: #selector(task), for: .touchUpInside)
        btnFloatStatus.addTarget(self, action: #selector(status), for: .touchUpInside)
        btnAutoApproval.addTarget(self, action: #selector(autoApproval), for: .touchUpInside)
        
//        taskApprovalToggle.selectedSegmentIndex = segmentControlIndex
        
        taskApprovalSegment()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        taskApprovalToggle.selectedSegmentIndex = segmentControlIndex

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
            approvalData.approvalType = name[i] + " - " + type[i]
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
            UIImage(named: "high")!,
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

            cell.approvalCell.text = data.approvalType
            cell.descriptionCell.text = data.approvalDescription
            cell.imageCell.image = data.profileImage
            
            
            return cell
        }
        
        return UITableViewCell()

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        if tableView == approvalTableView {
            
            if singleBulkToggle.selectedSegmentIndex == 1 {
        
        let cell = tableView.cellForRow(at: indexPath) as! ApprovalViewCell
        
        cell.imageCell.image = UIImage(named: "approved-button")
        
        btnBulkApproval.isUserInteractionEnabled = true
        btnBulkReject.isUserInteractionEnabled = true
        
        btnBulkApproval.addTarget(self, action: #selector(bulkApproval), for: .touchUpInside)
        btnBulkReject.addTarget(self, action: #selector(bulkReject), for: .touchUpInside)
        
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
      
        if tableView == approvalTableView {
            
            if singleBulkToggle.selectedSegmentIndex == 1 {
                
        let cell = tableView.cellForRow(at: indexPath) as! ApprovalViewCell
        
        var data = ApprovalData()
        
        data = approvalDataList[indexPath.row]
        
        cell.imageCell.image = data.profileImage
                
          }
            btnBulkApproval.isUserInteractionEnabled = false
            btnBulkReject.isUserInteractionEnabled = false
            
        }
    }
    
    
    //right swipe to approve
    
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        if tableView == approvalTableView {
            
            if singleBulkToggle.selectedSegmentIndex == 0 {
                
            let approve = UIContextualAction.init(style: .normal, title: nil) { (action, view, nil) in
                
                utilities.displayAlert(title: "Alert!", message: "Approved Successfully")
                self.approvalTableView.reloadData()
                
            }

            
            approve.image = UIImage(named: "approved-icon-s")
            approve.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
            
            let config = UISwipeActionsConfiguration(actions: [approve])
            config.performsFirstActionWithFullSwipe = false
            
            return config
            
            }
        
        }


        return UISwipeActionsConfiguration()

    }
    
    //left swipe to reject and clarify
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        if tableView == approvalTableView {
            
            if singleBulkToggle.selectedSegmentIndex == 0 {
            
            let reject = UIContextualAction.init(style: .normal, title: nil) { (action, view, nil) in
                
            utilities.displayAlert(title: "Alert!", message: "Rejected Successfully")
            self.approvalTableView.reloadData()
                
            }
            reject.image = UIImage(named: "reject-icon-s")
            
            let clarification = UIContextualAction.init(style: .normal, title: "?") { (action, view, nil) in
            
            let clarificationView = self.storyboard?.instantiateViewController(withIdentifier: "ClarificationViewController") as! ClarificationViewController
                
            self.navigationController?.pushViewController(clarificationView, animated: true)

            }
            
            clarification.backgroundColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 0.8784313725, alpha: 1)
            
            let config =  UISwipeActionsConfiguration(actions: [reject, clarification])
            config.performsFirstActionWithFullSwipe = false
            
            return config
            }

    }
        return UISwipeActionsConfiguration()

    }
    
    
    //Task Approval Toggle Segment Configurations
    func taskApprovalSegment() {
        
        switch taskApprovalToggle.selectedSegmentIndex {
            
        case 0:
            
            taskTableView.isHidden = false
            approvalTableView.isHidden = true
            taskApprovalLbl.text = "Tasks"
            approvalTableView.reloadData()
            
        case 1:
            
            approvalTableView.isHidden = false
            taskTableView.isHidden = true
            taskApprovalLbl.text = "Approvals"
            
            
        default:
            
            break
            
        }
    }
    
    
    //Single Bulk Segment Configuration
    func singleBulkSegment() {
        
        switch singleBulkToggle.selectedSegmentIndex {
        case 0:
            btnBulkReject.isHidden = true
            btnBulkApproval.isHidden = true
            lblApprovalCount.isHidden = false
            lblTotalApproval.isHidden = false
            
            self.approvalTableView.allowsMultipleSelection = false
            approvalTableView.reloadData()
            
            
        case 1:
            btnBulkReject.isHidden = false
            btnBulkApproval.isHidden = false
            lblApprovalCount.isHidden = true
            lblTotalApproval.isHidden = true
            
            btnBulkApproval.isUserInteractionEnabled = false
            btnBulkReject.isUserInteractionEnabled = false

            self.approvalTableView.allowsMultipleSelection = true
            approvalTableView.reloadData()
            
            
        default:
            break
        }
        
    }
    
    //floating button defination
    
    @objc func close() {
        floatingBtnView.isHidden = true
    }
    
    @objc func approval() {
        floatingBtnView.isHidden = true
        
        taskApprovalToggle.selectedSegmentIndex = 1
        approvalTableView.isHidden = false
        taskTableView.isHidden = true
        taskApprovalLbl.text = "Approvals"
        
    }
    
    @objc func task() {
        floatingBtnView.isHidden = true
        
        taskApprovalToggle.selectedSegmentIndex = 0
        taskTableView.isHidden = false
        approvalTableView.isHidden = true
        taskApprovalLbl.text = "Tasks"
        
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
    
    @objc func bulkApproval() {
        
        utilities.displayAlert(title: "Alert !", message: "All Requests Approved.")
        approvalTableView.reloadData()
        btnBulkApproval.isUserInteractionEnabled = false
        btnBulkReject.isUserInteractionEnabled = false
    }
    
    @objc func bulkReject() {
        utilities.displayAlert(title: "Alert !", message: "All Requests Rejected.")
        approvalTableView.reloadData()
        btnBulkApproval.isUserInteractionEnabled = false
        btnBulkReject.isUserInteractionEnabled = false
    }
    
    //Segment Control Actions
   
    @IBAction func taskApprovalTapped(_ sender: CustomSegmentedControl) {
        
        taskApprovalSegment()
    }
    
    
    @IBAction func singleBulkTapped(_ sender: CustomSegmentedControl) {
        singleBulkSegment()
    }
    
    
    // Action Buttons
    
    @IBAction func logoutTapped(_ sender: Any) {
    
        utilities.logoutAlert()

    }
    
    @IBAction func profileTapped(_ sender: Any) {
        let profileView = self.storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        
        self.navigationController?.pushViewController(profileView, animated: true)
        
    }
    
    @IBAction func homeTapped(_ sender: Any) {
    
        self.storyboard?.instantiateViewController(withIdentifier: "DashboardViewController")
        self.navigationController?.popViewController(animated: false)
        
    }
    
    
    @IBAction func notificationTapped(_ sender: Any) {
        
        let notificationView = self.storyboard?.instantiateViewController(withIdentifier: "NotificationViewController") as! NotificationViewController
        
        self.navigationController?.pushViewController(notificationView, animated: true)
        
    }
    
    @IBAction func menuTapped(_ sender: Any) {
        
        floatingBtnView.isHidden = false
        
    }
    
}
