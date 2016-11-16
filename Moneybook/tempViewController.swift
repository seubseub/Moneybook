//
//  tempViewController.swift
//  Moneybook
//
//  Created by Macbook Pro retina on 2016. 11. 16..
//  Copyright © 2016년 com. All rights reserved.
//

import UIKit

class tempViewController: UIViewController {

    @IBOutlet weak var temp: UITextField!

    @IBAction func ttt(_ sender: UITextField) {
        let datePickerView:UIDatePicker = UIDatePicker()
        
        datePickerView.datePickerMode = UIDatePickerMode.date
        
        sender.inputView = datePickerView
        
        datePickerView.addTarget(self, action: #selector(tempViewController.handleDatePicker), for: UIControlEvents.valueChanged)
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func handleDatePicker(sender: UIDatePicker) {
        var timeFormatter = DateFormatter()
        timeFormatter.dateStyle = .medium
        timeFormatter.timeStyle = .none
        temp.text = timeFormatter.string(from: sender.date)
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
