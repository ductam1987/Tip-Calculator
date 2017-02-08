//
//  SettingViewController.swift
//  TipCalculator
//
//  Created by Tamnd on 2/8/17.
//
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        let defaultsTip = UserDefaults.standard;
        let segmentIndex = defaultsTip.integer(forKey: "SEGMENT");
        segmentControl.selectedSegmentIndex = segmentIndex;

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
