//
//  ViewController.swift
//  CalculatorHW
//
//  Created by Nurdaulet on 22.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    var firstDigit: Double = 0.0
    var typing = false
    var operation = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayLabel.text = String(Int(firstDigit))
    }

    @IBAction func digitPressed(_ sender: UIButton) {
        let digit = sender.titleLabel?.text!
        
        if displayLabel.text != "0" {
            let d = Double(displayLabel.text! + digit!)!
           displayDigit(digit: d)
        } else {
            displayDigit(digit: Double(digit!)!)
        }
    }
    
    @IBAction func operationPressed(_ sender: UIButton) {
        let operationType = sender.titleLabel?.text!
        
        if !typing {
            
            switch operationType {
            case "AC":
                clearButtonPressed()
            case "<x":
                backSpacePressed()
            case "=":
                break
            default:
                    operation = operationType!
                    typing = true
                    firstDigit = Double(displayLabel.text!)!
                    displayDigit(digit: 0)
            }
    
        } else {
            
            let secondDigit = Double(displayLabel.text!)!
            
            firstDigit = getOutput(operation: operation, firstDigit: firstDigit, secondDigit: secondDigit)
            print(firstDigit)
            displayDigit(digit: firstDigit)
            typing = false
            
        }
        
    }
        
    func displayDigit(digit: Double) {
        
        if String(digit).contains(".0") {
            displayLabel.text = String(Int(digit))
        } else {
            displayLabel.text = String(digit)
        }
    }
    
    func getOutput(operation: String, firstDigit: Double, secondDigit: Double) -> Double{
        var digit = 0.0
        
        switch operation {
        case "+":
            digit = firstDigit + secondDigit
        case "-":
            digit = firstDigit - secondDigit
        case "*":
            digit = firstDigit * secondDigit
        case "÷":
            digit = firstDigit / secondDigit
        case "^":
            digit = pow(firstDigit, secondDigit)
        case "=":
            digit = firstDigit
        default: break
        }
        
        return digit
    }


    func clearButtonPressed() {
        displayLabel.text = "0"
        typing = false
    }
    
    func backSpacePressed() {
        var digit = (displayLabel.text!)
        if digit.count > 1 {
            digit.removeLast()
        } else {
            digit = "0"
            typing = false
            
        }
    
        displayLabel.text = digit
    }
    
}

