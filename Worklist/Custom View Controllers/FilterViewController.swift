//
//  FilterViewController.swift
//  Worklist
//
//  Created by Vaibhav M on 30/10/18.
//  Copyright © 2018 Vaibhav M. All rights reserved.
//

import UIKit
import SwiftRangeSlider

class FilterViewController: UIViewController {
    
//MARK: Variables
    @IBOutlet weak var lblUpperDate: UILabel!
    @IBOutlet weak var lblLowerDate: UILabel!
    @IBOutlet weak var filterView: UIView!
    @IBOutlet weak var applyFilterButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filterView.layer.cornerRadius = 12
        filterView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        applyFilterButton.layer.cornerRadius = 18
        
    //MARK: Date calling and formatting
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let myString = formatter.string(from: Date())
        let yourDate = formatter.date(from: myString)
        formatter.dateFormat = "dd-MM-yyyy"
        let upperDate = formatter.string(from: yourDate!)
        
        let today = Date()
        
        let tomorrow = Calendar.current.date(byAdding: .day, value: -60, to: today)
        formatter.dateFormat = "dd-MM-yyyy"
        
        let lowerDate = formatter.string(from: tomorrow!)
        
        
        lblLowerDate.text = lowerDate
        lblUpperDate.text = upperDate
    }
    //MARK: ACtion Buttons
    @IBAction func closeTapped(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func applyFilterTapped(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    //MARK: Date Range Slider
    @IBAction func dateRangeSlider(_ sender: RangeSlider) {
    
        let today = Date()
        let date = DateFormatter()
        date.dateFormat = "dd-MM-yyyy"
        
        let lowerValue = Calendar.current.date(byAdding: .day, value: Int(sender.lowerValue)-60, to: today)
        let upperValue = Calendar.current.date(byAdding: .day, value: Int(sender.upperValue)-60, to: today)
        
        
        lblLowerDate.text = String(date.string(from: lowerValue!))
        lblUpperDate.text = String(date.string(from: upperValue!))
    
    }
    
}
