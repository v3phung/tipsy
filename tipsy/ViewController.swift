//
//  ViewController.swift
//  tipsy
//
//  Created by Derrick Wong on 12/8/16.
//  Copyright © 2016 Derrick Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
 
    @IBAction func calculateTip(_ sender: AnyObject) {
        let tipPercentages = [0.15, 0.18, 0.20]
        let bill = Double (billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        setDefault()
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String( format: "$%.2f", total)
    }
    
    func setDefault(){
        let tipPercentages = [0.15, 0.18, 0.20]
        let defaults = UserDefaults.standard
        let value = tipPercentages[tipControl.selectedSegmentIndex]
        defaults.set(value, forKey: "default_tip_percentage")
        defaults.synchronize()
    }
    
    func defaultTip(){
        let defaults = UserDefaults.standard
        let tipValue = defaults.double(forKey: "default_tip_percentage")
        
        // highlight the segmented control choice
        switch tipValue {
            case 0.15:
                tipControl.selectedSegmentIndex = 0
            case 0.18:
                tipControl.selectedSegmentIndex = 1
            case 0.20:
                tipControl.selectedSegmentIndex = 2
            default:
                tipControl.selectedSegmentIndex = 0
        }
        
        let bill = Double (billField.text!) ?? 0
        let tip = bill * tipValue
        let total = bill + tip

        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String( format: "$%.2f", total)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        // This is a good place to retrieve the default tip percentage from NSUserDefaults
        // and use it to update the tip amount
        defaultTip()
    }
    

}

