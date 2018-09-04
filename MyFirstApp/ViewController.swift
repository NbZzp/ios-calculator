//
//  ViewController.swift
//  MyFirstApp
//
//  Created by Vicky on 2018/8/31.
//  Copyright © 2018年 Vicky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    override func viewDidLoad() {
        display.text = "0"
    }
    var userIsInTheMiddleOfTypingAnumber = false
    
    var brain = CalculatorBrain()
    
    @IBAction func appendDight(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTypingAnumber {
            display.text = display.text! + digit
        } else {
            display.text! = digit
            userIsInTheMiddleOfTypingAnumber = true
        }
    }
    
    @IBAction func operate(_ sender: UIButton) {
        if userIsInTheMiddleOfTypingAnumber {
            enter()
        }
        if let operation = sender.currentTitle{
            if let result = brain.performOperation (symbol: operation) {
                displayValue = result
            } else {
                displayValue = 0
            }
        }
    }
    var operandStack = Array<Double>()
    @IBAction func enter() {
        userIsInTheMiddleOfTypingAnumber = false
//        operandStack.append(displayValue)
//        print("displayValue = \(displayValue)")
        if let result =  brain.pushOperand (operand: displayValue) {
            displayValue = result
        }else {
            displayValue = 0
        }
    }
    var displayValue: Double {
        get{
            return NumberFormatter().number(from: display.text!)!.doubleValue
            //return NSNumberFormatter().numberFormString(display.text!)!.doubleValue
        }
        set{
            display.text = "\(newValue)"
            userIsInTheMiddleOfTypingAnumber = false
        }
    }
}

