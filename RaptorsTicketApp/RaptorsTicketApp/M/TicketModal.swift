//
//  TicketModal.swift
//  RaptorsTicketApp
//
//  Created by Muskan Shinh on 2020-10-20.
//  Copyright © 2020 Muskan Shinh. All rights reserved.
//

import Foundation

class Ticket {
    
    var type :String = ""
    var quantity: Int = 0
    var price: Int = 0
    
    init(t: String, q: Int, p: Int) {
        type = t
        quantity = q
        price = p
    }
    
    func updateQuantity(q: Int) {
        quantity = q
    }
    
}
