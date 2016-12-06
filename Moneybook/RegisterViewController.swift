//
//  RegisterViewController.swift
//  Moneybook
//
//  Created by Macbook Pro retina on 2016. 11. 29..
//  Copyright © 2016년 com. All rights reserved.
//

import UIKit
import Alamofire

class RegisterViewController: UIViewController {
    @IBAction func RegisterButton(_ sender: Any) {
        
        if (RegisterPWD.text != RegisterPWDAgain.text) {
            displayAlertMassage("비밀번호 불일치")
        }
        
        
        Alamofire.request(IPAddr + "/users/join", method: .post, parameters: ["username" : RegisterID.text!,"password" : RegisterPWD.text!, "email" : email.text!]).responseString { (response) in
            
            switch response.result {
            case .success(let data):
                print("eeeee")
                let vc2 = self.storyboard?.instantiateViewController(withIdentifier: "loginview") as! LoginViewController
                DispatchQueue.main.async {
                    self.present(vc2, animated: true, completion: nil)
                }
            case .failure:
                self.displayAlertMassage("등록 오류")
                
            }
            
        }
    }
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var RegisterID: UITextField!

    @IBOutlet weak var RegisterPWDAgain: UITextField!
    @IBOutlet weak var RegisterPWD: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        

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
