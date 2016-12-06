//
//  PieChartViewController.swift
//  Moneybook
//
//  Created by Macbook Pro retina on 2016. 11. 17..
//  Copyright © 2016년 com. All rights reserved.
//

import UIKit
import Charts


class PieChartViewController: UIViewController {

    @IBAction func CreateFile(_ sender: Any) {
        
        displayAlertMassage("File Successfully Exported!")
        let tempdata = "hihihi"
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("test.csv")
        
        
        
        do {
            try tempdata.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
            
        } catch {
            print(error)
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
      override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayAlertMassage(_ Massge : String)
    {
        let alert = UIAlertController(title: "알림", message: Massge, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(okAction)
        
        self.present(alert, animated:true, completion: nil)
    }
}
