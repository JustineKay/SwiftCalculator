//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Justine Kay on 5/26/16.
//  Copyright © 2016 Justine Kay. All rights reserved.
//

import Foundation

class CalculatorBrain
{

    private enum Op {
        case Operand(Double)
        case UnaryOperation(String, Double -> Double)
        case BinaryOperation(String, (Double, Double) -> Double)
    }
    
    private var opStack = [Op]()
    
    private var knownOps = [String:Op]()
    
    init(){
        knownOps["×"] = Op.BinaryOperation("×", *)
        knownOps["÷"] = Op.BinaryOperation("÷"){ $1 / $0 }
        knownOps["+"] = Op.BinaryOperation("+", +)
        knownOps["−"] = Op.BinaryOperation("−"){ $1 - $0 }
        knownOps["√"] = Op.UnaryOperation("√", sqrt)
    }
    
    func pushOperand(operand:Double) {
        opStack.append(Op.Operand(operand))
    }
    
    func performOperation(symbol: String) {
        if let operation = knownOps[symbol] {
            opStack.append(operation)
        }
    }
    
}
