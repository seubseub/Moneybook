//
//  showdetaildateViewController.swift
//  Moneybook
//
//  Created by Macbook Pro retina on 2016. 11. 26..
//  Copyright © 2016년 com. All rights reserved.
//

import UIKit

class showdetaildateViewController: UIViewController {

    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var money: UILabel!
    var tempIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tempIndex = SendingIndex
        
        date.text = array_date[tempIndex].date
        
        money.text = array[tempIndex].spend

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
