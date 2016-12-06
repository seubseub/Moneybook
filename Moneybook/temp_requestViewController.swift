//
//  temp_requestViewController.swift
//  Moneybook
//
//  Created by Macbook Pro retina on 2016. 11. 20..
//  Copyright © 2016년 com. All rights reserved.
//

import UIKit
import Alamofire

class temp_requestViewController: UIViewController{


    override func viewDidLoad() {
        super.viewDidLoad()
            Alamofire.request(IPAddr).responseJSON { response in
            //print(response.request!)  // original URL request
            //print(response.response!) // HTTP URL response
            //print(response.data!)     // server data
            //print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
