//
//  LoginViewController.swift
//  Moneybook
//
//  Created by Macbook Pro retina on 2016. 11. 29..
//  Copyright © 2016년 com. All rights reserved.
//

import UIKit
import Alamofire
import Firebase

class LoginViewController: UIViewController {
    @IBAction func LoginButton(_ sender: Any) {
        username = LoginID.text!
        
        var result = 0
        
        Alamofire.request(IPAddr + "/users/login", method: .post, parameters: ["username" : LoginID.text!,"password" : LoginPWD.text!]).responseString { (response) in
            print("response.result : \(response.result)")
            
            print("respsone :!!!!!!!! \(response)")
            
            
            switch response.result {
            case .success(let data):
                print(data)
                print("eeeee")
                
                
                result += 1
                
                if (result != 0) {
                    //self.displayAlertMassage("로그인 성공")
                    let vc2 = self.storyboard?.instantiateViewController(withIdentifier: "group") as! groupselectViewController
                    DispatchQueue.main.async {
                        
                        self.present(vc2, animated: true, completion: nil)
                        
                    }
                    
                    
                }
 
            case .failure:
                self.displayAlertMassage("로그인 오류")
                
            }
        }
        
        
    }

    @IBOutlet weak var LoginID: UITextField!
    @IBOutlet weak var LoginPWD: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        let refreshedToken = FIRInstanceID.instanceID().token()!
        print("refreshed token : \(refreshedToken)")

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
    
    func displayAlertMassage(_ Massge : String)
    {
        let alert = UIAlertController(title: "알림", message: Massge, preferredStyle: UIAlertControllerStyle.alert)
        
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
