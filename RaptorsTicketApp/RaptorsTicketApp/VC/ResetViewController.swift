//
//  ResetViewController.swift
//  RaptorsTicketApp
//
//  Created by Muskan Shinh on 2020-10-19.
//  Copyright © 2020 Muskan Shinh. All rights reserved.
//

import UIKit

class ResetViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
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
   
    var myModel : DataModelManager?
    var currentIndex = 0
    
    @IBOutlet weak var ticketPicker: UIPickerView!
    @IBOutlet weak var quantityLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        ticketPicker.reloadAllComponents()
    }
    
    @IBAction func resetQuantity(_ sender: Any) {
        
        if(quantityLabel.text!.count > 0) {
            let intQuantity = Int(quantityLabel.text!)
            myModel?.ticketList[currentIndex].quantity += intQuantity!
            ticketPicker.reloadAllComponents()
        } else {
            quantityLabel.text = " "
        }
    }
    
    @IBAction func cancel(_ sender: Any) {
        
        quantityLabel.text = " "
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    
    currentIndex =  row
    }
}
