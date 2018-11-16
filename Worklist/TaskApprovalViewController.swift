//
//  TaskApprovalViewController.swift
//  Worklist
//
//  Created by Vaibhav M on 26/10/18.
//  Copyright © 2018 Vaibhav M. All rights reserved.
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
    var singleBool = true
    
    
    @IBOutlet weak var btnAutoApproval: UIButton!
    @IBOutlet weak var btnFloatStatus: UIButton!
    @IBOutlet weak var btnFloatTask: UIButton!
    @IBOutlet weak var btnFloatApproval: UIButton!
    @IBOutlet weak var btnFloatClose: UIButton!
    @IBOutlet weak var floatingBtnView: UIView!
    
    
    //MARK: for Task
    var taskDataList = [TaskData]()
    
    let taskCellIdentifier = "task"
    
    //MARK: for Approval
    var approvalDataList = [ApprovalData]()
    
    let approvalCellIdentifier = "approval"
    
    var segmentControlIndex = 0
    
    var cellExpanded: Bool = false
    var expandedCellIndex: Int!
    
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
        
        self.expandedCellIndex = -1
        taskApprovalSegment()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        taskApprovalToggle.selectedSegmentIndex = segmentControlIndex

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    
    
  //MARK: approval data call
    func getApprovalData() {
        
        for i in 0...5
        {
            let approvalData = ApprovalData()
            
            approvalData.approvalType = name[i] + " - " + approvalType[i]
            approvalData.profileImage = image[i]
            approvalData.approvalDescription = approvalDescription[i]
            
            approvalDataList.append(approvalData)
        }
    }
    
   //MARK: task data call
    func getTaskData() {
        
        for i in 0...3
        {
            let taskData = TaskData()
            
            taskData.dataTaskType = taskType[i]
            taskData.dataDetail = taskDetail[i]
            taskData.dataPriority = taskPriority[i]
            taskData.dataDueDate = taskDueDate[i]

            taskDataList.append(taskData)
        }
    }
    
   //MARK: tableview configurations
    
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


            cell.btnChat.isHidden = true
            cell.btnReject.isHidden = true
            cell.btnApprove.isHidden = true
            
            cell.btnChat.addTarget(self, action: #selector(clarify), for: .touchUpInside)


            
            if (cell.approvalCell.text?.contains("My Time"))! {
                
                cell.attendanceData.isHidden = false
                cell.tofa.isHidden = false
                cell.approvalDuration_Claims.text = "08.05 hrs"
                cell.inOut_leaveTime_claimType.text = "22 June: In Time 09.22 AM - Out Time 04.45 PM"
                cell.attendanceData.text = "Attendance: 09.50 hrs"
                cell.efforts_leaveRemaining_claimReason.text = "Efforts: 7 hrs"
                cell.tofa.text = "TOFA: 4 hrs"
                
            } else if (cell.approvalCell.text?.contains("My Leave"))! {
                
                cell.approvalDuration_Claims.text = "08 Days"
                cell.inOut_leaveTime_claimType.text = "01 Nov 2018 - 10 Nov 2018"
                cell.efforts_leaveRemaining_claimReason.text = "10 Annual Leaves Remaining"
                
            } else if (cell.approvalCell.text?.contains("Expense Claims"))! {
                
                cell.approvalDuration_Claims.text = "Rs. 1058"
                cell.inOut_leaveTime_claimType.text = "Conveyance: 758, Food: 300"
                cell.efforts_leaveRemaining_claimReason.text = "Reason: Late Night Expenses"

            }
                if self.expandedCellIndex == indexPath.row && singleBool
                {
                    cell.btnChat.isHidden = !cellExpanded
                    cell.btnReject.isHidden = !cellExpanded
                    cell.btnApprove.isHidden = !cellExpanded
                }
            return cell
        }
        
        return UITableViewCell()

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        if tableView == approvalTableView {
            
            if singleBulkToggle.selectedSegmentIndex == 1 {
        
        let cell = tableView.cellForRow(at: indexPath) as! ApprovalViewCell
        
        cell.imageCell.image = UIImage(named: "checked")
        
        btnBulkApproval.isUserInteractionEnabled = true
        btnBulkReject.isUserInteractionEnabled = true
        
        btnBulkApproval.addTarget(self, action: #selector(bulkApproval), for: .touchUpInside)
        btnBulkReject.addTarget(self, action: #selector(bulkReject), for: .touchUpInside)
        
            } else {
                
                self.expandedCellIndex = indexPath.row
                
                    if cellExpanded {
                        cellExpanded = false
                        self.expandedCellIndex = -1
                    } else {
                        cellExpanded = true
                        self.expandedCellIndex = indexPath.row
                    }
                    approvalTableView.reloadData()
                    approvalTableView.beginUpdates()
                    approvalTableView.endUpdates()
                
            }
            
        }
       // tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
            
            if singleBulkToggle.selectedSegmentIndex == 1 {
                
        let cell = tableView.cellForRow(at: indexPath) as! ApprovalViewCell
        
        var data = ApprovalData()
        
        data = approvalDataList[indexPath.row]
        
        cell.imageCell.image = data.profileImage
                
          }
            btnBulkApproval.isUserInteractionEnabled = false
            btnBulkReject.isUserInteractionEnabled = false
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
    if tableView == approvalTableView {
                
    if singleBulkToggle.selectedSegmentIndex == 0 {
        
    
        if self.expandedCellIndex >= 0
        {
            if self.expandedCellIndex == indexPath.row
            {
                return 230
            } else {
                return 70
                
                   }
            
            }
        }
            return 70
        }
        return 150
    }

    
    
   //MARK: right swipe to approve
    
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        if tableView == approvalTableView {
            
            if singleBulkToggle.selectedSegmentIndex == 0 {
                
            let approve = UIContextualAction.init(style: .normal, title: nil) { (action, view, nil) in
                
                utilities.displayAlert(title: "Alert!", message: "Approved Successfully")
                self.approvalTableView.reloadData()
                
            }

            
            approve.image = UIImage(named: "approved-icon-s")
            approve.backgroundColor = customGreen
            
            let config = UISwipeActionsConfiguration(actions: [approve])
            config.performsFirstActionWithFullSwipe = false
            
            return config
            
            }
        
        }


        return UISwipeActionsConfiguration()

    }
    
   //MARK: left swipe to reject and clarify
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        if tableView == approvalTableView {
            
            if singleBulkToggle.selectedSegmentIndex == 0 {
            
            let reject = UIContextualAction.init(style: .normal, title: nil) { (action, view, nil) in
                
            utilities.displayAlert(title: "Alert!", message: "Rejected Successfully")
            self.approvalTableView.reloadData()
                
            }
            reject.image = UIImage(named: "reject-icon-s")
            
            let clarification = UIContextualAction.init(style: .normal, title: nil) { (action, view, nil) in
            
            let clarificationView = self.storyboard?.instantiateViewController(withIdentifier: "ClarificationViewController") as! ClarificationViewController
                
            self.navigationController?.pushViewController(clarificationView, animated: true)

            }
            
            clarification.image = UIImage(named: "chat")
            clarification.backgroundColor = customBlue
            
            let config =  UISwipeActionsConfiguration(actions: [reject, clarification])
            config.performsFirstActionWithFullSwipe = false
            
            return config
            }

        }
        return UISwipeActionsConfiguration()

    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
   
        if tableView == approvalTableView {
        
        if cellExpanded == true {
            return false
            }
        return true
        }
        return false
    }
    
    //MARK: Task Approval Toggle Segment Configurations
    
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
    
    
  //MARK: Single Bulk Segment Configuration
    func singleBulkSegment(hidden: Bool) {
        
            btnBulkReject.isHidden = hidden
            btnBulkApproval.isHidden = hidden
            lblApprovalCount.isHidden = !hidden
            lblTotalApproval.isHidden = !hidden
        
            
            self.approvalTableView.allowsMultipleSelection = !hidden
            approvalTableView.reloadData()
        
    }
    
  //MARK: floating button defination
    
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
    
    @objc func clarify() {
        let clarifyView = self.storyboard?.instantiateViewController(withIdentifier: "ClarificationViewController") as! ClarificationViewController
        self.navigationController?.pushViewController(clarifyView, animated: true)
    }
    
  //MARK: Segment Control Actions
   
    @IBAction func taskApprovalTapped(_ sender: CustomSegmentedControl) {
        
        taskApprovalSegment()
    }
    
    
    @IBAction func singleBulkTapped(_ sender: CustomSegmentedControl) {
        
        switch singleBulkToggle.selectedSegmentIndex {
        case 0:
            singleBulkSegment(hidden: true)
            singleBool = true
        case 1:
            singleBulkSegment(hidden: false)
            singleBool = false
        default:
            break
        }
        
    }
    
    
 //MARK:  Action Buttons
    
    @IBAction func logoutTapped(_ sender: Any) {
    
        utilities.logoutAlert(controller: self)

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
    
    @IBAction func searchTapped(_ sender: Any) {
        let notificationView = self.storyboard?.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        
        self.navigationController?.pushViewController(notificationView, animated: false)
    }
    
    
}
