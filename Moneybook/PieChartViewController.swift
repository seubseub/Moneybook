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
        
        let writePath = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("testy.txt")
        
        let testPath = NSURL(fileURLWithPath: NSHomeDirectory())
        //let path = tmpDir.stringByAppendingPathComponent(fileName)
        let contentsOfFile = "Sample Text"
        
        var error: NSError?
        let urlstring = "/Users/macbookproretina/Desktop/real.mp4"
        let url = NSURL(string: urlstring)
        
        let urlst : String = (writePath?.path)!
        
        // Write File
        
        print(writePath!)
        print("testpath for home directory : \(testPath)")
        var arr_spend: [String] = []
        do {
            if(array.count != 0) {
                for i in 0...(array.count-1) {
                    arr_spend.append(array[i].spend)
                    print("array success")
                }
                
                let result = arr_spend.joined(separator: ",")
                
                try result.write(toFile: urlst, atomically: true, encoding: String.Encoding.utf8)
                print("Yesssss!!!")
                
                //try contentsOfFile.write(toFile: urlstring, atomically: true, encoding: String.Encoding.utf8)
                if(NSTemporaryDirectory().isEmpty == true)
                {
                    print("Temporary direct no data")
                }
                else {
                    print("Goood done!!!!")
                }
                
            }
            
            
            else {
                try contentsOfFile.write(toFile: urlstring, atomically: true, encoding: String.Encoding.utf8)
                print("why file is not made?????")
            }
            
            
        }
        catch {
            print("err")
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
      override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
