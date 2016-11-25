//
//  AddBudgetViewController.swift
//  Moneybook
//
//  Created by Macbook Pro retina on 2016. 11. 15..
//  Copyright © 2016년 com. All rights reserved.
//

import UIKit

class AddBudgetViewController: UIViewController {

    @IBOutlet weak var Money: UITextField!
    @IBOutlet weak var Content: UITextField!
    @IBOutlet weak var Date: UITextField!
    @IBAction func DoneButton(_ sender: Any) {
        
        array_budget.append(TODO(deposit: Money.text!))
        
        //Stringtemp = SpendingData.text
        
        
        tempbudgetMoney = Money.text
        tempbudgetcontents = Content.text
        tempbudgetDate = Date.text
        
        DepositSum += Int(Money.text!)!
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func datePick(_ sender: UITextField) {
        let datePickerView:UIDatePicker = UIDatePicker()

        //datePickerView.date
        datePickerView.datePickerMode = UIDatePickerMode.date
        
        sender.inputView = datePickerView
        
        datePickerView.addTarget(self, action: #selector(self.datePickerValueChanged), for: UIControlEvents.valueChanged)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func datePickerValueChanged(_ sender:UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        Date.text = dateFormatter.string(from: sender.date)
        
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
