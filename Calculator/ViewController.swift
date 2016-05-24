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
    
    var userIsInTheMiddleOfTypingANumber = false
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
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
        let operation = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber {
            enter()
        }
        switch operation {
        case "×": performOperation { $0 * $1 }
        case "÷": performOperation { $1 / $0 }
        case "+": performOperation { $0 + $1 }
        case "−": performOperation { $1 - $0 }
        //TODO - Add pi, cos and sin operations
//        case "π": 
//        case "cos":
//        case "sin":
        case "√": performSingleArgumentOperation { sqrt($0) }
        default: break
        }
    }
    
    func performOperation(operation: (Double, Double) -> Double) {
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
            enter()
        }
    }
    
    func performSingleArgumentOperation(operation: Double -> Double) {
        if operandStack.count >= 1 {
            displayValue = operation(operandStack.removeLast())
            enter()
        }
    }
    
    var operandStack = Array<Double>()
    
    @IBAction func enter() {
        decimalPointButton.enabled = true
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
            //set display text with newValue
            displayLabel.text = "\(newValue)"
            userIsInTheMiddleOfTypingANumber = false
        }
    }
}

