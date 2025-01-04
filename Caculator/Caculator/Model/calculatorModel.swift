//
//  calculatorModel.swift
//  Caculator
//
//  Created by Kunal 🥀 on 01/01/25.
//

import Foundation
import SwiftUI


enum Keys: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case clear = "AC"
    case equals = "="
    case add = "+"
    case subtract = "-"
    case multiply = "*"
    case divide = "/"
    case decimal = "."
    case percent = "%"
    case negative = "-/+"
    
    
    var buttonColor: Color{
        switch self{
        case .add, .subtract, .multiply, .divide, .equals:
            return Color("Voperator")
        case .clear, .negative, .percent:
            return Color("Hoperator")
        default:
            return Color("num")
        }
    }
}



enum Operation: String {
    case add
    case subtract
    case multiply
    case divide
    case none
}
