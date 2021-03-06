//
//  ViewController.swift
//  Calculator
//
//  Created by Justine Kay on 5/23/16.
//  Copyright © 2016 Justine Kay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var decimalPointButton: UIButton!
    @IBOutlet weak var stackLabel: UILabel!
    
    var userIsInTheMiddleOfTypingANumber = false
    var brain = CalculatorBrain()
    var opStack = [String]()
    
    @IBAction func appendDigit(sender: UIButton) {
        var digit = String()
        if sender.currentTitle! == "π" {
            digit = String(M_PI)
        } else {
            digit = sender.currentTitle!
        }
        if digit == "." {
            sender.enabled = false
        }
        if userIsInTheMiddleOfTypingANumber {
            displayLabel.text = displayLabel.text! + digit
        } else {
            displayLabel.text! = digit
            userIsInTheMiddleOfTypingANumber = true
        }
    }
    
    @IBAction func operate(sender: UIButton) {
        if userIsInTheMiddleOfTypingANumber {
            enter()
        }
        if let operation = sender.currentTitle {
            if let result = brain.performOperation(operation) {
                displayValue = result
            } else {
                //TODO - make displayValue an optional to adjust the response if nil
                displayValue = 0
            }
        }
        
    }
    
    @IBAction func enter() {
        decimalPointButton.enabled = true
        userIsInTheMiddleOfTypingANumber = false
        if let result = brain.pushOperand(displayValue) {
            displayValue = result
            opStack.append(String(result))
            stackLabel.text = "\(opStack)"
        } else {
            //TODO - make displayValue an optional to adjust the response if nil
            displayValue = 0
        }
    }
    
    var displayValue: Double {
        
        get {
            // convert from opStr to double
            return NSNumberFormatter().numberFromString(displayLabel.text!)!.doubleValue
        }
        set{
            //set display text with newValue
            displayLabel.text = "\(newValue)"
            userIsInTheMiddleOfTypingANumber = false
        }
    }
    
    var stackValue: String {
        
        get {
            return self.stackValue
        }
        set {
            
            
        }
        
    }

}

