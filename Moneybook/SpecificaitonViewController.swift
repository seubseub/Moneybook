//
//  SpecificaitonViewController.swift
//  Moneybook
//
//  Created by Macbook Pro retina on 2016. 11. 14..
//  Copyright © 2016년 com. All rights reserved.
//

import UIKit

class SpecificaitonViewController: UIViewController {

    
    @IBOutlet weak var contents: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var classified: UILabel!
    
    @IBOutlet weak var money: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        contents.text = tempcontents
        date.text = tempdate
        classified.text = tempclassified
        money.text = Stringtemp
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
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
