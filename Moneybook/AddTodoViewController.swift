//
//  AddTodoViewController.swift
//  Moneybook
//
//  Created by Macbook Pro retina on 2016. 11. 14..
//  Copyright © 2016년 com. All rights reserved.
//

import UIKit

class AddTodoViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var Array = ["외식", "교통", "식품", "유흥", "통신비"]

    @IBAction func pickdate(_ sender: UITextField) {
        let datePickerView:UIDatePicker = UIDatePicker()
        
        datePickerView.datePickerMode = UIDatePickerMode.date
        
        sender.inputView = datePickerView
        
        datePickerView.addTarget(self, action: #selector(self.datePickerValueChanged), for: UIControlEvents.valueChanged)
    }
    
    @IBAction func EditingContentBegin(_ sender: UITextField) {
        self.view.endEditing(true)
        self.ContentsPicker.isHidden = false
    }
    @IBAction func EditingContentEnd(_ sender: Any) {
         self.ContentsPicker.isHidden = true
    }
    
    @IBOutlet weak var ContentsPicker: UIPickerView!
    @IBOutlet weak var SpendingData: UITextField!
    
    @IBOutlet weak var classify: UITextField!
    @IBOutlet weak var contest: UITextField!
    @IBOutlet weak var date: UITextField!
    @IBAction func donebuttonTapped(_ sender: Any) {
        
        array.append(TODO(spend: SpendingData.text!))
        array_contents.append(TODO(contents: contest.text!))
        
        
        
        array_date.append(TODO(date : date.text!))
        
        Stringtemp = SpendingData.text
        
        tempcontents = contest.text
        tempdate = date.text
        tempclassified = classify.text
        
        let split_date = date.text?.components(separatedBy: "-")
        
        let temp_index = Int((split_date?[1])!)
        
        //["외식", "교통", "식품", "유흥", "통신비"]
        
        switch (classify.text)! {
        case "외식" :
            arr_dinner_spend[(temp_index! - 1)] += Int(SpendingData.text!)!
            Spend_count[(temp_index! - 1)] += 1
            break
        case "교통" :
            arr_trans_spend[(temp_index! - 1)] += Int(SpendingData.text!)!
            Spend_count[(temp_index! - 1)] += 1
        case "식품" :
            arr_food_spend[(temp_index! - 1)] += Int(SpendingData.text!)!
            Spend_count[(temp_index! - 1)] += 1
        case "유흥" :
            arr_play_spend[(temp_index! - 1)] += Int(SpendingData.text!)!
            Spend_count[(temp_index! - 1)] += 1
        case "통신비" :
            arr_phone_spend[(temp_index! - 1)] += Int(SpendingData.text!)!
            Spend_count[(temp_index! - 1)] += 1
        default:
            break
        }
        
        
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
        self.ContentsPicker.delegate = self
        self.ContentsPicker.dataSource = self

        self.ContentsPicker.isHidden = true
        self.view.addSubview(ContentsPicker)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func datePickerValueChanged(_ sender:UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        date.text = dateFormatter.string(from: sender.date)
        
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        print("\(row)'s String : \(Array[row])")
        return Array[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        print(Array.count)
        return Array.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        classify.text = Array[row]
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
