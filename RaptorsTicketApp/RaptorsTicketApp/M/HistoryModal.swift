//
//  HistoryModal.swift
//  RaptorsTicketApp
//
//  Created by Muskan Shinh on 2020-10-20.
//  Copyright © 2020 Muskan Shinh. All rights reserved.
//

import Foundation

class History {
    
    var item: String = ""
    var quantity: Int = 0
    var total: Int = 0
    var purchaseDate: String = ""
    
    init(i: String, q: Int, t: Int, p: String) {
        item = i
        quantity = q
        total = t
        purchaseDate = p
    }

}
