//
//  AddTodoViewController.swift
//  Moneybook
//
//  Created by Macbook Pro retina on 2016. 11. 14..
//  Copyright © 2016년 com. All rights reserved.
//

import UIKit

class AddTodoViewController: UIViewController {

    //let tempstring: String?
    @IBAction func pickdate(_ sender: UITextField) {
        let datePickerView:UIDatePicker = UIDatePicker()
        
        datePickerView.datePickerMode = UIDatePickerMode.date
        
        sender.inputView = datePickerView
        
        datePickerView.addTarget(self, action: #selector(self.datePickerValueChanged), for: UIControlEvents.valueChanged)
    }
    
    @IBOutlet weak var SpendingData: UITextField!
    
    @IBOutlet weak var classify: UITextField!
    @IBOutlet weak var contest: UITextField!
    @IBOutlet weak var date: UITextField!
    @IBAction func donebuttonTapped(_ sender: Any) {
        
        array.append(TODO(spend: SpendingData.text!))
        
        Stringtemp = SpendingData.text
        
        tempcontents = contest.text
        tempdate = date.text
        tempclassified = classify.text
        
        SpendingSum += Int(SpendingData.text!)!
        
        self.dismiss(animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
        
        dateFormatter.dateStyle = DateFormatter.Style.medium
        
        dateFormatter.timeStyle = DateFormatter.Style.none
        
        date.text = dateFormatter.string(from: sender.date)
        
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
