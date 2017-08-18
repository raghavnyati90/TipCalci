//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Raghav Nyati on 8/14/17.
//  Copyright © 2017 Raghav Nyati. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        billTextField.becomeFirstResponder()
        
    }
    
    func closeApp(){
        let defaults = UserDefaults.standard
        defaults.set(NSDate(), forKey: "closingTime")
        defaults.set(billTextField.text, forKey: "billAmount")
    }
    
    func openApp(){
        let defaults = UserDefaults.standard
        let currentTime = NSDate()
        let closingTime: NSDate = defaults.object(forKey: "closingTime") as! NSDate
        let currentTimeInterval = currentTime.timeIntervalSince1970
        let closingTimeInterval = closingTime.timeIntervalSince1970
        
        if((currentTimeInterval - closingTimeInterval) > 600){
            billTextField.text = ""
        }else{
            billTextField.text = defaults.string(forKey: "billAmount")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        let defaultIndex = defaults.integer(forKey: "index")
        tipControl.selectedSegmentIndex = defaultIndex
        billTextField.text = defaults.string(forKey: "billAmount")
        switch(defaults.integer(forKey: "color")){
        case 0:
            self.view.backgroundColor = UIColor.yellow
            self.tipControl.backgroundColor = UIColor.white
            self.tipControl.tintColor = UIColor.brown
            break
        case 1:
            self.view.backgroundColor = UIColor.cyan
            self.tipControl.backgroundColor = UIColor.white
            self.tipControl.tintColor = UIColor.brown
            break
        case 2:
            self.view.backgroundColor = UIColor.gray
            self.tipControl.backgroundColor = UIColor.white
            self.tipControl.tintColor = UIColor.brown
            break
        default:
            break
        }
        calculateTip()
    }
    
    @IBAction func tapGesture(_ sender: Any) {
        view.endEditing(true)
    }
    
    func calculateTip(){
        let tipPercentages = [0.18, 0.20, 0.25]
        
        let bill = Double(billTextField.text!) ?? 0
        let total = bill + tipPercentages[tipControl.selectedSegmentIndex] * bill
        
        let locale = Locale.current
        let currencyCode = locale.currencyCode
        let currencySymbol = locale.currencySymbol
        tipLabel.text =  "\(currencySymbol!)" + String(format: "%.2f", tipPercentages[tipControl.selectedSegmentIndex] * bill) + " \(currencyCode!)"
        totalLabel.text = "\(currencySymbol!)"  + "" + String(format: "%.2f", total) + " \(currencyCode!)"
    }

    @IBAction func editingChanged(_ sender: Any) {
        calculateTip()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

