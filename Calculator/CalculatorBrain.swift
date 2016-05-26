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

    enum Op {
        case Operand(Double)
        case UrnaryOperation(String, Double -> Double)
        case BinaryOperation(String, (Double, Double) -> Double)
    }
    
    var opStack = [Op]()
    
    
    
}
