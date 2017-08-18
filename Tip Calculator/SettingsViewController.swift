//
//  SettingsViewController.swift
//  Tip Calculator
//
//  Created by Raghav Nyati on 8/14/17.
//  Copyright © 2017 Raghav Nyati. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var segControl: UISegmentedControl!
    @IBOutlet weak var colorSeg: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        let defaultIndex = defaults.integer(forKey: "index")
        segControl.selectedSegmentIndex = defaultIndex
        
        let defaultColor = defaults.integer(forKey: "color")
        colorSeg.selectedSegmentIndex = defaultColor
        setColor()
        
    }

    @IBAction func colorSegChanged(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(colorSeg.selectedSegmentIndex, forKey: "color")
        defaults.synchronize()
        
        setColor()
    }
    
    func setColor(){
        switch(colorSeg.selectedSegmentIndex){
        case 0:
            self.view.backgroundColor = UIColor.yellow
            self.colorSeg.backgroundColor = UIColor.white
            self.colorSeg.tintColor = UIColor.brown
            self.segControl.backgroundColor = UIColor.white
            self.segControl.tintColor = UIColor.brown
            break
        case 1:
            self.view.backgroundColor = UIColor.cyan
            self.colorSeg.backgroundColor = UIColor.white
            self.colorSeg.tintColor = UIColor.brown
            self.segControl.backgroundColor = UIColor.white
            self.segControl.tintColor = UIColor.brown
            break
        case 2:
            self.view.backgroundColor = UIColor.gray
            self.colorSeg.backgroundColor = UIColor.white
            self.colorSeg.tintColor = UIColor.brown
            self.segControl.backgroundColor = UIColor.white
            self.segControl.tintColor = UIColor.brown
            break
        default:
            break
        }
    }
    
    @IBAction func segValueChanged(_ sender: Any) {
        
        let defaults = UserDefaults.standard
        defaults.set(segControl.selectedSegmentIndex, forKey: "index")
        defaults.synchronize()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
