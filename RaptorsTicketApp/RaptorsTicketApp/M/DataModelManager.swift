//
//  DataModelManager.swift
//  RaptorsTicketApp
//
//  Created by Muskan Shinh on 2020-10-20.
//  Copyright © 2020 Muskan Shinh. All rights reserved.
//

import Foundation

class DataModelManager {
    
    var ticketList = [Ticket]()
    var historyList = [History]()
    
    func addTicket(ticket: Ticket) {
        ticketList.append(ticket)
    }
    
    func addTransaction(history: History) {
        historyList.append(history)
    }
}
