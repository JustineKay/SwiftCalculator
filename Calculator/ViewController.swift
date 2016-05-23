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
    
    var userIsInTheMiddleOfTypingANumber = false
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber {
            displayLabel.text = displayLabel.text! + digit
        } else {
            displayLabel.text! = digit
            userIsInTheMiddleOfTypingANumber = true
        }
    }
    
    var operandStack = Array<Double>()
    
    @IBAction func enter() {
        userIsInTheMiddleOfTypingANumber = false
        operandStack.append(displayValue)
        print(operandStack)
    }
    
    var displayValue: Double {
        
        get {
            // convert from opStr to double
            return NSNumberFormatter().numberFromString(displayLabel.text!)!.doubleValue
        }
        set{
            //set display text
            displayLabel.text = "\(newValue)"
            userIsInTheMiddleOfTypingANumber = false
        }
    }
}

