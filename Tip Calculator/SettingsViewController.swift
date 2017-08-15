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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        let defaultIndex = defaults.integer(forKey: "index")
        segControl.selectedSegmentIndex = defaultIndex
        
        // Do any additional setup after loading the view.
    }

    @IBAction func segValueChanged(_ sender: Any) {
        
        let defaults = UserDefaults.standard
        defaults.set(segControl.selectedSegmentIndex, forKey: "index")
        defaults.synchronize()
        //self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
