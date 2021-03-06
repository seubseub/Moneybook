//
//  MoneyViewController.swift
//  Moneybook
//
//  Created by Macbook Pro retina on 2016. 11. 11..
//  Copyright © 2016년 com. All rights reserved.
//

import UIKit
import EventKit
import FSCalendar
import Charts
import Alamofire


class MoneyViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource {

    @IBOutlet weak var GroupFlag: UILabel!
    fileprivate let gregorian = Calendar(identifier: .gregorian)
    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var showSpendingTotal: UITextField!
    @IBOutlet weak var showDepositTotlal: UITextField!
    var datesWithEvent:[NSDate] = []
    
    var temptodo : TODO? = TODO()
    //var crawlers:Crawlers? = Crawlers()
    var tempmoney  = 0
    
    
    var responsestring:NSString?
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    
    
    func calendar(_ calendar: FSCalendar, titleFor date: Date) -> String? {
        if self.gregorian.isDateInToday(date) {
            return "오늘"
        }
        return nil
    }
    

    func calendar(_ calendar: FSCalendar, hasEventFor date: Date) -> Bool {
        if(array_date.count != 0) {
            for data in array_date{
                let dateFormatter = DateFormatter()
              //  November 23, 1937
                dateFormatter.dateFormat = "yyyy년 mm월 dd일"
                print(data)
                print("111111111111111111")
                print(data.date)
                let date2 = dateFormatter.date(from: data.date)
                let order = NSCalendar.current.compare(date2!, to: date, toGranularity: .day)//(data.eventDate!, toDate: date, toUnitGranularity: .Day)
                if order == ComparisonResult.orderedSame{
                    let unitFlags: NSCalendar.Unit = [ .day, .month, .year]
                    let calendar2: NSCalendar = NSCalendar.current as NSCalendar
                    let components: NSDateComponents = calendar2.components(unitFlags, from: date2!) as NSDateComponents
                    datesWithEvent.append(calendar2.date(from: components as DateComponents)! as NSDate)
                }
            }
            return datesWithEvent.contains(date as NSDate)
            
        }
        else {
            return false

        }
        
    }
    
    var arr_date : [Int] = []
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
       
        if(array_date.count != 0) {
        let day: Int! = self.gregorian.component(.day, from: date)
        
        for data in array_date{
            print("seleceted date \(date)")
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            
            let date2 = dateFormatter.date(from: data.date)

            //print(data.date)
            
            let calendar = Calendar.current
            
            let component = calendar.component(Calendar.Component.day, from: date2!)
            
            //print(component)
            
            //print(date2!)
            arr_date.append(component)
            
            }
            return arr_date.contains(day) ? 1 : 0
        }
        else {
            return 0
        }
        return 0
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date) {
        
        
        for i in 0...array_date.count {
            
            let data = arr_date[i]
            let calendar = Calendar.current
            
            let component = calendar.component(Calendar.Component.day, from: date)
            
            print(component)
            
            if (data == component)
            {
                SendingIndex = i
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "showdetaildate") as! showdetaildateViewController
                DispatchQueue.main.async {
                    self.present(vc, animated: true, completion: nil)
                }
                break
            }
        }
    }
    
    override func viewDidLoad() {
                super.viewDidLoad()
        
        
        if(requestGROUP == 0)
        {
            GroupFlag.text = "비회원 가계부"
        }
        else if (requestGROUP == 1) {
            GroupFlag.text = "개인가계부"
            
            
            Alamofire.request(IPAddr + "/users/get/moneybook", method: .post, parameters: ["user_name" : username!]).responseString(completionHandler: { (response) in
                switch response.result {
                case .success(let data):
                    print(data)
                    let tempdata : Data? = data.data(using: .utf8)
                    print(tempdata!)
                    
                    
                    
                        let js = try? JSONSerialization.jsonObject(with: tempdata!, options: .allowFragments) as! [String : AnyObject]
                    
                         if let Retriever = js?["object"] as? [AnyObject] {
                         
                            for website in Retriever {
                         
                                let c = ((website["fields"])! as? [String : AnyObject])!
                                print(c as Any)
                                print(c["name"]! as Any)
                                let sd = c["money"]!
                                if(personalflag == 0) {
                                    array_request.append(TODO(date: c["date"] as! String, spend: String(describing: sd), content: c["content"] as! String, classify: c["description"] as! String))
                                }
                                
                                self.tempmoney += c["money"] as! Int
                            
                            }
                            personalflag += 1
                         }
                
                        self.showSpendingTotal.text = String(self.tempmoney)
                case .failure:
                    self.displayAlertMassage("로그인 오류")
                    
                }
            })
            
                }
 
            else {
            GroupFlag.text = "그룹가계부"
            Alamofire.request(IPAddr + "/group/get/moneybook", method: .post, parameters: ["user_name" : username!, "group_name" : grouptext!]).responseString(completionHandler: { (response) in
                switch response.result {
                case .success(let data):
                    print(data)
                    let tempdata : Data? = data.data(using: .utf8)
                    print(tempdata!)
                    
                    
                    
                    let js = try? JSONSerialization.jsonObject(with: tempdata!, options: .allowFragments) as! [String : AnyObject]
                    
                    if let Retriever = js?["object"] as? [AnyObject] {
                        
                        for website in Retriever {
                            
                            let c = ((website["fields"])! as? [String : AnyObject])!
                            print(c as Any)
                            print(c["name"]! as Any)
                            let sd = c["money"]!
                            if (groupflag == 0) {
                            array_request.append(TODO(date: c["date"] as! String, spend: String(describing: sd), content: c["content"] as! String, classify: c["description"] as! String))
                            }
                            self.tempmoney += c["money"] as! Int
                            
                        }
                        groupflag += 1
                    }
                    
                    self.showSpendingTotal.text = String(self.tempmoney)
                case .failure:
                    self.displayAlertMassage("로그인 오류")
                    
                }
            })

        }
        
 
        
        calendar.cellShape = .rectangle //선택된 날짜의 형태가 네모로 표시되도록
        calendar.allowsMultipleSelection = true //여러날짜를 동시에 선택할 수 있도록
        calendar.clipsToBounds = true //달력 구분 선 제거
        
        calendar.delegate = self
        calendar.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if(requestGROUP == 1) {
            showSpendingTotal.text = String(tempmoney)
        }
        else if (requestGROUP == 0) {
            showSpendingTotal.text = String(SpendingSum)
            showDepositTotlal.text = String(DepositSum - SpendingSum)
        }
        
        
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
    
    func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
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
