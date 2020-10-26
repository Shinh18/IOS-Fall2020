//
//  ViewController.swift
//  RaptorsTicketApp
//
//  Created by Muskan Shinh on 2020-10-19.
//  Copyright © 2020 Muskan Shinh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        var str = ""
        str.append(myModel!.ticketList[row].type + " ")
        str.append(String(myModel!.ticketList[row].quantity) + " ")
        str.append("price: ")
        str.append(String(myModel!.ticketList[row].price) + "$")
        return str
    }
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var ticketPicker: UIPickerView!
    
    var l_price = 0
    var l_quantity = ""
    var currentIndex  = 0
    var myModel : DataModelManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(myModel!.ticketList.count < 1) {
            
            let b = Ticket(t: "Balcony Level", q: 12, p: 1170)
            myModel?.addTicket(ticket: b)
            
            let l = Ticket(t: "Lower Level", q: 20, p: 10434)
            myModel?.addTicket(ticket: l)
            
            let c = Ticket(t: "Courtside", q: 15, p: 27777)
            myModel?.addTicket(ticket: c)
            
            priceLabel.text = "\(l_price)"
            quantityLabel.text = ""
            typeLabel.text = ""
        
        }
        ticketPicker.reloadAllComponents()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        ticketPicker.reloadAllComponents()
    }
    
    @IBAction func digitClick(_ sender: UIButton) {
        
        if(l_quantity.count < 2) {
            l_quantity += sender.currentTitle ?? " "
            quantityLabel.text = l_quantity
        }
        priceLabel.text = String(Int(l_quantity)!*l_price)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        typeLabel.text = myModel!.ticketList[row].type
        l_price = myModel!.ticketList[row].price
        currentIndex =  row
        if(l_quantity.count > 0) {
            priceLabel.text = String(Int(l_quantity)!*l_price)
        }
    }
    
    @IBAction func buyTicket(_ sender: Any) {
    
        if(quantityLabel.text!.count > 0 && typeLabel.text!.count > 0) {
        
            let intQuantity = Int(quantityLabel.text!)
            if(myModel!.ticketList[currentIndex].quantity >= intQuantity!) {
                
                myModel!.ticketList[currentIndex].quantity -= intQuantity!
                ticketPicker.reloadAllComponents()
                let total = intQuantity!*l_price
                
                //Current date stored as string
                let now = Date()
                let formatter = DateFormatter()
                formatter.dateStyle = .full
                formatter.timeStyle = .full
                let datetime = formatter.string(from: now)
                let transaction = History(i: typeLabel.text!, q: intQuantity!, t: total, p: datetime)
                myModel?.addTransaction(history: transaction)
                quantityLabel.text = ""
                priceLabel.text = ""
                l_quantity = ""
            } else {
                quantityLabel.text = ""
                priceLabel.text = ""
                l_quantity = ""
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "manager") {
            
        let manager : ManagerViewController = segue.destination as! ManagerViewController
        (segue.destination as! ManagerViewController).myModel = myModel
            manager.myModel = myModel
        }
    }
}
