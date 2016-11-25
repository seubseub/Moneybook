//
//  AddTodoViewController.swift
//  Moneybook
//
//  Created by Macbook Pro retina on 2016. 11. 14..
//  Copyright © 2016년 com. All rights reserved.
//

import UIKit

class AddTodoViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    @IBAction func Picker(_ sender: Any) {
        self.performSegue(withIdentifier: "showpop", sender: self)
        
        
        
        classify.text = classisegue
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showpop") {
            let vc = segue.destination
            vc.preferredContentSize = CGSize(width: 250, height: 180)
            let controller = vc.popoverPresentationController
            
            if(controller != nil)
            {
                controller?.delegate = self
            }
            
        }
        classify.text = classisegue
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
    
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
        array_contents.append(TODO(contents: contest.text!))
        array_date.append(TODO(date : date.text!))
        
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
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
        //dateFormatter.dateStyle = DateFormatter.Style.long
        
        //dateFormatter.timeStyle = DateFormatter.Style.none
        
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
