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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        let defaultIndex = defaults.integer(forKey: "index")
        tipControl.selectedSegmentIndex = defaultIndex
        calculateTip()
    }
    
    @IBAction func tapGesture(_ sender: Any) {
        view.endEditing(true)
    }
    
    func calculateTip(){
        let tipPercentages = [0.18, 0.20, 0.25]
        
        let bill = Double(billTextField.text!) ?? 0
        //_ip = bill * 0.2
        let total = bill + tipPercentages[tipControl.selectedSegmentIndex] * bill
        tipLabel.text = String(format: "$%.2f", tipPercentages[tipControl.selectedSegmentIndex] * bill)
        totalLabel.text = String(format: "$%.2f", total)
    }

    @IBAction func editingChanged(_ sender: Any) {
        calculateTip()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

