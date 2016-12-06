//
//  SecondViewController.swift
//  Moneybook
//
//  Created by Macbook Pro retina on 2016. 11. 14..
//  Copyright © 2016년 com. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var Money: UILabel!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(requestGROUP == 0 ) {
            return array.count
        } else if(requestGROUP == 1 || requestGROUP == 2) {
            return array_request.count
        }else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        
        if(requestGROUP == 0 ) {
            let todolist = array[indexPath.row]
            cell.textLabel?.text = todolist.spend
        } else if(requestGROUP == 1 || requestGROUP == 2) {
            let todolist = array_request[indexPath.row]
            cell.textLabel?.text = todolist.spend
        }
        
        //let todolist = array[indexPath.row]
        
        
        //cell.textLabel?.text = todolist.spend
       // cell.textLabel?.center
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(requestGROUP == 1 || requestGROUP == 2) {
        let ff = array_request[indexPath.row]
        tempcontents = ff.contents_spend
        tempdate = ff.date
        tempclassified = ff.classify
        Stringtemp = ff.spend
        } else {
            let todo = array[indexPath.row]
            tempcontents = todo.contents_spend
            tempdate = todo.date
            tempclassified = todo.classify
            Stringtemp = todo.spend
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            array.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.left)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource  = self
        
        //array.append(TODO(spend: "hiii"))
        //array.append(TODO(spend: "nooop"))
        //array.append(TODO(spend: "ggggg"))
        // Do any additional setup after loading the view.
    }
    
    /* 뷰가 다시 생겼을 시!
    */
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
        tableView.delegate = self
        tableView.dataSource = self
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
