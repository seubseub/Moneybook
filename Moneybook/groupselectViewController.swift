//
//  groupselectViewController.swift
//  Moneybook
//
//  Created by Macbook Pro retina on 2016. 11. 29..
//  Copyright © 2016년 com. All rights reserved.
//

import UIKit
import Alamofire

class groupselectViewController: UIViewController {
    @IBAction func group(_ sender: Any) {
        Alamofire.request(IPAddr + "/users/add/group", method: .post, parameters: ["user_name" : username!,"group_name" : groupselect.text!]).responseString { (response) in
            print("response.result : \(response.result)")
            grouptext = self.groupselect.text!
            print("respsone :!!!!!!!! \(response)")
            
            
            switch response.result {
            case .success(let data):
                print(data)
                print("eeeee")
                
                requestGROUP = 2
                
                
                let vc2 = self.storyboard?.instantiateViewController(withIdentifier: "money") as! MoneyViewController
                DispatchQueue.main.async {
                    self.present(vc2, animated: true, completion: nil)
                }
                
                
            case .failure:
                self.displayAlertMassage("로그인 오류")
                
            }
        }
        
        
    }
    @IBAction func Personal(_ sender: Any) {
        requestGROUP = 1
        let vc2 = self.storyboard?.instantiateViewController(withIdentifier: "money") as! MoneyViewController
        DispatchQueue.main.async {
            self.present(vc2, animated: true, completion: nil)
        }
    }
    @IBOutlet weak var groupselect: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayAlertMassage(_ Massge : String)
    {
        let alert = UIAlertController(title: "오류", message: Massge, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(okAction)
        
        self.present(alert, animated:true, completion: nil)
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
