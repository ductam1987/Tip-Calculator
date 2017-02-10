//
//  ViewController.swift
//  TipCalculator
//
//  Created by Tamnd on 2/7/17.
//
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad();

        billField.keyboardType = UIKeyboardType.decimalPad;
        billField.becomeFirstResponder();
        print("view did load");
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        print("view will appear");
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);
        print("view did appear");
        if(UserDefaults.standard.bool(forKey: Constant.CHANGE_DEFAULT_TIP)){
            calculateTip(self);
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        print("view will disappear");
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated);
        print("view did disappear");
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true);
        print("Hello");
    }
    
    
    @IBAction func calculateTip(_ sender: Any) {
        
        let tipPercentages = [0.18, 0.20, 0.25];
        var segmentIndex = tipControl.selectedSegmentIndex;
        let defaultsTip = UserDefaults.standard;
        if(UserDefaults.standard.bool(forKey: Constant.CHANGE_DEFAULT_TIP)){
            segmentIndex = defaultsTip.integer(forKey: Constant.DEFAULT_TIP);
            tipControl.selectedSegmentIndex = segmentIndex;
            defaultsTip.set(false, forKey: Constant.CHANGE_DEFAULT_TIP);
            defaultsTip.synchronize();
        }
        
        let bill = Double(billField.text!) ?? 0;
        let tip = bill * (tipPercentages[segmentIndex]);
        let total = bill + tip;
        
        tipLabel.text =  tip.asLocaleCurrency;
        totalLabel.text = total.asLocaleCurrency;
    }
    
    @IBAction func selectSegment(_ sender: Any) {
        calculateTip(self);
    }
    
}

