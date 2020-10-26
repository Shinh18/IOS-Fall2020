//
//  Calculator_Brain.swift
//  Calculator
//
//  Created by Muskan Shinh on 2020-09-27.
//  Copyright © 2020 Muskan Shinh. All rights reserved.
//

import Foundation

class Calculator_Brain {
    
    
    var items = [Double]();
    var equation = String();
    //functions
    
    func pushItem(num: Double) {
        items.append(num);
    }
    
    func calculate(op: String) -> Double {
        
        var first: Double;
        var second: Double;
        var calculate: Double;
        second = items[items.endIndex - 1];
        first = popItem();
        calculate = 0;
        
        if(op == "+") {
            calculate = first + second;
        }
        else if(op == "-") {
            calculate = first - second;
        }
        else if(op == "*") {
            calculate = first * second;
        }
        else if(op == "/") {
            calculate = first / second;
        }
        else {
            print("Could not calculate");
        }
        equation = (String(first)
                    + " "
                    + op
                    + " "
                    + String(second)
                    + " "
                    + " = "
            + String(calculate))
        
        return calculate;
        
    }
    
    func getEquation() -> String {
        return equation
    }
    
    func popItem() -> Double {
        
        var ans: Double;
        if(items.popLast() != nil) {
            ans = items.popLast()!;
        }
        else {
            ans = 0;
            print("Unsuccessful popItem");
        }
        return ans;
    }
 
}
