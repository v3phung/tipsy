//
//  SettingsViewController.swift
//  tipsy
//
//  Created by Derrick Wong on 12/10/16.
//  Copyright © 2016 Derrick Wong. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {


    @IBOutlet weak var defaultSettings: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func setDefault(_ sender: Any) {
        let tipPercentages = [0.15, 0.18, 0.20]
        let defaults = UserDefaults.standard
        let value = tipPercentages[defaultSettings.selectedSegmentIndex]
        defaults.set(value, forKey: "default_tip_percentage")
        defaults.synchronize()
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
