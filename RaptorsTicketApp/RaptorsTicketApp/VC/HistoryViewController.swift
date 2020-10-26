//
//  HistoryViewController.swift
//  RaptorsTicketApp
//
//  Created by Muskan Shinh on 2020-10-20.
//  Copyright © 2020 Muskan Shinh. All rights reserved.
//

import UIKit

class HistoryViewController: UITableViewController {

    var myModel : DataModelManager?
    @IBOutlet var historyTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        historyTable.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (myModel?.historyList.count)!
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if((myModel?.historyList.count)! > 0) {
            cell?.textLabel?.text = myModel?.historyList[indexPath.row].item
            let intQuantity = myModel?.historyList[indexPath.row].quantity
            cell?.detailTextLabel?.text = "\(intQuantity ?? 0)"
        } else {
            cell?.textLabel?.text = ""
        }
        return cell!
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "detail") {
                   let detail : DetailViewController = segue.destination as! DetailViewController
            detail.myModel = myModel!.historyList[historyTable.indexPathForSelectedRow!.row]
        }
    }
}
