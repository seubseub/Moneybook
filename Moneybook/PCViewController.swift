//
//  PCViewController.swift
//  Moneybook
//
//  Created by Macbook Pro retina on 2016. 11. 22..
//  Copyright © 2016년 com. All rights reserved.
//

import UIKit
import Charts

class PCViewController: UIViewController {

    @IBOutlet weak var charView: PieChartView!

    override func viewDidLoad() {
        super.viewDidLoad()
        charView.noDataText = "no data!!!!!!!!"
        charView.chartDescription?.text = "월별 데이터 차트 분석"
        charView.drawEntryLabelsEnabled = true
        var dataEntries: [PieChartDataEntry] = []
        
        for i in 1..<(array.count+1) {
            
            let dataEntry = PieChartDataEntry(value: Double(array[i-1].spend)!, label: array_date[i-1].date, data: "charr" as AnyObject)
            dataEntries.append(dataEntry)
        }
        

        let pieChartDataSet = PieChartDataSet(values: dataEntries, label: " ")
        
        var colors: [UIColor] = []
        let legends = charView.legend // legend는 Index Box
        legends.enabled = true
        legends.xEntrySpace = 0.0
        legends.yEntrySpace = 30.0
        legends.drawInside = true
        legends.formSize = 20.0
        
        for _ in 0..<(array.count) {
            let red = Double(arc4random_uniform(256))
            let green = Double(arc4random_uniform(256))
            let blue = Double(arc4random_uniform(256))
            
            let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
            colors.append(color)
            
            pieChartDataSet.colors = colors
            
        }
        
        let pieChartData = PieChartData(dataSets: [pieChartDataSet])
        
        charView.data = pieChartData

    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
