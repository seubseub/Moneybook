//
//  TODO.swift
//  Moneybook
//
//  Created by Macbook Pro retina on 2016. 11. 14..
//  Copyright © 2016년 com. All rights reserved.
//

import UIKit

class TODO {

    var spend : String!
    var contents_spend : String!
    var deposit : String!
    var date : String!
    init() {
        
    }
    init(spend : String ) {
        self.spend = spend
    }
    init(contents : String) {
        self.contents_spend = contents
    }
    
    init(deposit : String) {
        self.deposit = deposit
    }
    
    init(date : String) {
        self.date = date
    }
}
