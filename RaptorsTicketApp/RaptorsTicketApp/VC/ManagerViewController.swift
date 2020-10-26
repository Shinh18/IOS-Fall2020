//
//  ManagerViewController.swift
//  RaptorsTicketApp
//
//  Created by Muskan Shinh on 2020-10-19.
//  Copyright © 2020 Muskan Shinh. All rights reserved.
//

import UIKit

class ManagerViewController: UIViewController {
    
    var myModel : DataModelManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
        
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "history") {
            
            let history : HistoryViewController = segue.destination as! HistoryViewController
            (segue.destination as! HistoryViewController).myModel = myModel
            history.myModel = myModel
        }
        else if(segue.identifier == "reset") {
            
            let reset : ResetViewController = segue.destination as! ResetViewController
            (segue.destination as! ResetViewController).myModel = myModel
            reset.myModel = myModel
        }
    }
}
