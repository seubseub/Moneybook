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

class MoneyViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource {

    fileprivate let gregorian = Calendar(identifier: .gregorian)
    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var showSpendingTotal: UITextField!
    @IBOutlet weak var showDepositTotlal: UITextField!
    
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date) {
    }
    
    func calendar(_ calendar: FSCalendar, titleFor date: Date) -> String? {
        if self.gregorian.isDateInToday(date) {
            return "오늘"
        }
        return nil
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
