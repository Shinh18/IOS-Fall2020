//
//  DetailViewController.swift
//  RaptorsTicketApp
//
//  Created by Muskan Shinh on 2020-10-20.
//  Copyright © 2020 Muskan Shinh. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var myModel : History?
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        itemLabel.text = myModel?.item
        quantityLabel.text = "\(myModel?.quantity ?? 0)"
        totalLabel.text = "\(myModel?.total ?? 0)"
        dateLabel.text = myModel?.purchaseDate
    }
    

    @IBAction func closeVC(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
