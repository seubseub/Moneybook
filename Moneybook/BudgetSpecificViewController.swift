//
//  BudgetSpecificViewController.swift
//  Moneybook
//
//  Created by Macbook Pro retina on 2016. 11. 15..
//  Copyright © 2016년 com. All rights reserved.
//

import UIKit

class BudgetSpecificViewController: UIViewController {

    @IBOutlet weak var BudgetDate: UITextField!
    @IBOutlet weak var Budget: UITextField!
    @IBOutlet weak var BudgetContent: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        BudgetContent.text = tempbudgetcontents
        Budget.text = tempbudgetMoney
        BudgetDate.text = tempbudgetDate
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
