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


class MoneyViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource {

    fileprivate let gregorian = Calendar(identifier: .gregorian)
    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var showSpendingTotal: UITextField!
    @IBOutlet weak var showDepositTotlal: UITextField!
    var datesWithEvent:[NSDate] = []
    
    
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
                var date2 = dateFormatter.date(from: data.date)
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
    /*
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        let day: Int! = self.gregorian.component(.day, from: date)
        return day % 5 == 0 ? day/5 : 0;
    }
    */
    
    var arr_date : [Int] = []
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        /*
        if(array_date.count != 0) {
            for data in array_date{
                
                
                
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy년 mm월 dd일"
                var date2 = dateFormatter.date(from: data.date)
                let order = NSCalendar.current.compare(date2!, to: date, toGranularity: .day)//(data.eventDate!, toDate: date, toUnitGranularity: .Day)
                if order == ComparisonResult.orderedSame {
                
                    let day: Int! = self.gregorian.component(.day, from: date)
                    print("day : \(day)")
                    return day
                }
            }
            
        }
        else {
            return 0
        }
 */
        if(array_date.count != 0) {
        let day: Int! = self.gregorian.component(.day, from: date)
        
        for data in array_date{
            print("seleceted date \(date)")
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            
            var date2 = dateFormatter.date(from: data.date)

            //let real = Calendar.current.date(byAdding: .day, value: 1, to: date2!)
            print(data.date)
            
            let calendar = Calendar.current
            
            let component = calendar.component(Calendar.Component.day, from: date2!)
            
            print(component)
            
            print(date2!)
            arr_date.append(component)
            
            }
            return arr_date.contains(day) ? 1 : 0
        }
        else {
            return 0
        }
        
        return 0
        //[13,24].contains(day) ? UIImage(named: "icon_cat") : nil
        //return [13,25].contains(day) ? day : 0
    }
    
    override func viewDidLoad() {
                super.viewDidLoad()
        
        calendar.cellShape = .rectangle //선택된 날짜의 형태가 네모로 표시되도록
        calendar.allowsMultipleSelection = true //여러날짜를 동시에 선택할 수 있도록
        calendar.clipsToBounds = true //달력 구분 선 제거
        
        calendar.delegate = self
        calendar.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        showSpendingTotal.text = String(SpendingSum)
        showDepositTotlal.text = String(DepositSum - SpendingSum)
        
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
