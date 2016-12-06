//
//  PC_contensViewController.swift
//  Moneybook
//
//  Created by Macbook Pro retina on 2016. 11. 27..
//  Copyright © 2016년 com. All rights reserved.
//

import UIKit
import Charts

class PC_contensViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var PC_con: PieChartView!
    @IBOutlet weak var SelectMonth: UITextField!
    @IBOutlet weak var MonthPickerView: UIPickerView!
    
    var temp_num = 12
    
    var Array = ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
    
    var dataEntries: [PieChartDataEntry] = []

    @IBAction func BeginSelect(_ sender: UITextField) {
        self.view.endEditing(true)
        self.MonthPickerView.isHidden = false
    }
    @IBAction func EndingSelect(_ sender: UITextField) {
        self.MonthPickerView.isHidden = true
        let temp = SelectMonth.text?.components(separatedBy: "월")
        dataEntries = []
        temp_num = Int((temp?[0])!)!
        updatemonth()
        self.PC_con.setNeedsDisplay()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PC_con.noDataText = "no data!!!!!!!!"
        PC_con.chartDescription?.text = "PieChart Contents"
        PC_con.drawEntryLabelsEnabled = true
        
        self.MonthPickerView.delegate = self
        self.MonthPickerView.dataSource = self
        self.MonthPickerView.isHidden = true
        self.view.addSubview(MonthPickerView)
        
        
        //["외식", "교통", "식품", "유흥", "통신비"]
        if(requestGROUP == 0 ) {
            for i in 1...5 {
                
                switch i {
                case 1: // 외식
                    
                    if(arr_dinner_spend[temp_num-1] == 0) {
                        break
                    }
                    let dataEntry = PieChartDataEntry(value: Double(arr_dinner_spend[temp_num-1]), label: "외식", data: "charr" as AnyObject)
                    dataEntries.append(dataEntry)
                    break
                case 2: // 교통
                    
                    if(arr_trans_spend[temp_num-1] == 0) {
                        break
                    }
                    let dataEntry = PieChartDataEntry(value: Double(arr_trans_spend[temp_num-1]), label: "교통", data: "charr" as AnyObject)
                    dataEntries.append(dataEntry)
                    break
                case 3: // 식품
                    if(arr_food_spend[temp_num-1] == 0) {
                        break
                    }
                    let dataEntry = PieChartDataEntry(value: Double(arr_food_spend[temp_num-1]), label: "식품", data: "charr" as AnyObject)
                    dataEntries.append(dataEntry)
                    break
                case 4: // 유흥
                    if(arr_play_spend[temp_num-1] == 0) {
                        break
                    }
                    let dataEntry = PieChartDataEntry(value: Double(arr_play_spend[temp_num-1]), label: "유흥", data: "charr" as AnyObject)
                    dataEntries.append(dataEntry)
                    break
                case 5: // 통신
                    if(arr_phone_spend[temp_num-1] == 0) {
                        break
                    }
                    let dataEntry = PieChartDataEntry(value: Double(arr_phone_spend[temp_num-1]), label: "통신", data: "charr" as AnyObject)
                    dataEntries.append(dataEntry)
                    break
                default:
                    break
                }
                
                
            }
        }
        else if (requestGROUP == 1 || requestGROUP == 2) {
            for j in 0...(array_request.count - 1) {
                let tempstring = array_request[j].date
                
                let asdf = tempstring?.components(separatedBy: "-")
                
                let reqnum = Int((asdf?[1])!)
                print(temp_num)
                print(reqnum!)
                for i in 1...5 {
                switch i {
                case 1: // 외식
                    print(array_request[j].classify)
                    if(array_request[j].classify == "dinner" && temp_num == reqnum!){
                        
                        let dataEntry = PieChartDataEntry(value: Double(array_request[j].spend)!, label: "외식", data: "charr" as AnyObject)
                        dataEntries.append(dataEntry)
                        break
                    } else {
                        break
                    }

                case 2: // 교통
                    
                    if(array_request[j].classify == "car" && (temp_num ) == reqnum!) {
                        let dataEntry = PieChartDataEntry(value: Double(array_request[j].spend)!, label: "교통", data: "charr" as AnyObject)
                        dataEntries.append(dataEntry)
                        break
                    } else {
                        break
                    }

                case 3: // 식품
                    if(array_request[j].classify == "food" && (temp_num ) == reqnum!) {
                        let dataEntry = PieChartDataEntry(value: Double(array_request[j].spend)!, label: "식품", data: "charr" as AnyObject)
                        dataEntries.append(dataEntry)
                        break
                    } else {
                        break
                    }
                    
                case 4: // 유흥
                    if(array_request[j].classify == "play" && (temp_num ) == reqnum!) {
                        let dataEntry = PieChartDataEntry(value: Double(array_request[j].spend)!, label: "유흥", data: "charr" as AnyObject)
                        dataEntries.append(dataEntry)
                        break
                    } else {
                        break
                    }
                    
                case 5: // 통신
                    if(array_request[j].classify == "phone" && (temp_num ) == reqnum!) {
                        let dataEntry = PieChartDataEntry(value: Double(array_request[j].spend)!, label: "통신", data: "charr" as AnyObject)
                        dataEntries.append(dataEntry)
                        break
                    } else {
                        break
                    }
                    
                default:
                    break
                }
                }
            }
        }
        
        
        let pieChartDataSet = PieChartDataSet(values: dataEntries, label: " ")
        
        var colors: [UIColor] = []
        let legends = PC_con.legend // legend는 Index Box
        legends.enabled = true
        legends.xEntrySpace = 0.0
        legends.yEntrySpace = 30.0
        legends.drawInside = true
        legends.formSize = 20.0
        
        for _ in 0...2 {
            let red = Double(arc4random_uniform(256))
            let green = Double(arc4random_uniform(256))
            let blue = Double(arc4random_uniform(256))
            
            let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
            colors.append(color)
            
            pieChartDataSet.colors = colors
            
        }
        
        let pieChartData = PieChartData(dataSets: [pieChartDataSet])
        
        PC_con.data = pieChartData
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func updatemonth() {
        if(requestGROUP == 0 ) {
            for i in 1...5 {
                
                switch i {
                case 1: // 외식
                    
                    if(arr_dinner_spend[temp_num-1] == 0) {
                        break
                    }
                    let dataEntry = PieChartDataEntry(value: Double(arr_dinner_spend[temp_num-1]), label: "외식", data: "charr" as AnyObject)
                    dataEntries.append(dataEntry)
                    break
                case 2: // 교통
                    
                    if(arr_trans_spend[temp_num-1] == 0) {
                        break
                    }
                    let dataEntry = PieChartDataEntry(value: Double(arr_trans_spend[temp_num-1]), label: "교통", data: "charr" as AnyObject)
                    dataEntries.append(dataEntry)
                    break
                case 3: // 식품
                    if(arr_food_spend[temp_num-1] == 0) {
                        break
                    }
                    let dataEntry = PieChartDataEntry(value: Double(arr_food_spend[temp_num-1]), label: "식품", data: "charr" as AnyObject)
                    dataEntries.append(dataEntry)
                    break
                case 4: // 유흥
                    if(arr_play_spend[temp_num-1] == 0) {
                        break
                    }
                    let dataEntry = PieChartDataEntry(value: Double(arr_play_spend[temp_num-1]), label: "유흥", data: "charr" as AnyObject)
                    dataEntries.append(dataEntry)
                    break
                case 5: // 통신
                    if(arr_phone_spend[temp_num-1] == 0) {
                        break
                    }
                    let dataEntry = PieChartDataEntry(value: Double(arr_phone_spend[temp_num-1]), label: "통신", data: "charr" as AnyObject)
                    dataEntries.append(dataEntry)
                    break
                default:
                    break
                }

            
            }
        }
        else if (requestGROUP == 1 || requestGROUP == 2) {
            for j in 0...(array_request.count - 1) {
                let tempstring = array_request[j].date
                
                let asdf = tempstring?.components(separatedBy: "-")
                
                let reqnum = Int((asdf?[1])!)
                //print(temp_num)
                //print(reqnum!)
                for i in 1...5 {
                    switch i {
                    case 1: // 외식
                        print(array_request[j].classify)
                        if(array_request[j].classify == "dinner" && temp_num == reqnum!){
                            
                            let dataEntry = PieChartDataEntry(value: Double(array_request[j].spend)!, label: "외식", data: "charr" as AnyObject)
                            dataEntries.append(dataEntry)
                            break
                        } else {
                            break
                        }
                        
                    case 2: // 교통
                        
                        if(array_request[j].classify == "car" && (temp_num ) == reqnum!) {
                            let dataEntry = PieChartDataEntry(value: Double(array_request[j].spend)!, label: "교통", data: "charr" as AnyObject)
                            dataEntries.append(dataEntry)
                            break
                        } else {
                            break
                        }
                        
                    case 3: // 식품
                        if(array_request[j].classify == "food" && (temp_num ) == reqnum!) {
                            let dataEntry = PieChartDataEntry(value: Double(array_request[j].spend)!, label: "식품", data: "charr" as AnyObject)
                            dataEntries.append(dataEntry)
                            break
                        } else {
                            break
                        }
                        
                    case 4: // 유흥
                        if(array_request[j].classify == "play" && (temp_num ) == reqnum!) {
                            let dataEntry = PieChartDataEntry(value: Double(array_request[j].spend)!, label: "유흥", data: "charr" as AnyObject)
                            dataEntries.append(dataEntry)
                            break
                        } else {
                            break
                        }
                        
                    case 5: // 통신
                        if(array_request[j].classify == "phone" && (temp_num ) == reqnum!) {
                            let dataEntry = PieChartDataEntry(value: Double(array_request[j].spend)!, label: "통신", data: "charr" as AnyObject)
                            dataEntries.append(dataEntry)
                            break
                        } else {
                            break
                        }
                        
                    default:
                        break
                    }
                }
            }
            
        }
        
        
        let pieChartDataSet = PieChartDataSet(values: dataEntries, label: " ")
        
        var colors: [UIColor] = []
        let legends = PC_con.legend // legend는 Index Box
        legends.enabled = true
        legends.xEntrySpace = 0.0
        legends.yEntrySpace = 30.0
        legends.drawInside = true
        legends.formSize = 20.0
        
        for _ in 0...3 {
            let red = Double(arc4random_uniform(256))
            let green = Double(arc4random_uniform(256))
            let blue = Double(arc4random_uniform(256))
            
            let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
            colors.append(color)
            
            pieChartDataSet.colors = colors
            
        }
        
        let pieChartData = PieChartData(dataSets: [pieChartDataSet])
        
        PC_con.data = pieChartData
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        //print("\(row)'s String : \(Array[row])")
        return Array[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        print(Array.count)
        return Array.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        SelectMonth.text = Array[row]
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
