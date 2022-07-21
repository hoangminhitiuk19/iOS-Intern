//
//  ViewController.swift
//  Calculator 2.0
//
//  Created by Dung on 7/8/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var calculatorWorking: UILabel!
    
    @IBOutlet weak var calculatorResult: UILabel!
    
    var workings: String = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
        // Do any additional setup after loading the view.
    }
    
    func clearAll() {
        workings = " "
        calculatorWorking.text = "Input"
        calculatorResult.text = "Result"
    }
    
    func addToWorkings(Value: String) {
        workings = workings + Value
        calculatorWorking.text = workings
    }
    
    @IBAction func allClearTap(_ sender: Any) {
        clearAll()
    }
    
    
    @IBAction func backTap(_ sender: Any) {
        if !workings.isEmpty{
            workings.removeLast()
            calculatorWorking.text = workings
        }else{
            calculatorWorking.text = "Input"
        }
    
    }
    
    
    @IBAction func divideTap(_ sender: Any) {
        addToWorkings(Value: "/")
    }
    
    
    @IBAction func multipleTap(_ sender: Any) {
        addToWorkings(Value: "*")
    }
    
    
    @IBAction func minusTap(_ sender: Any) {
        addToWorkings(Value: "-")
    }
    
    
    @IBAction func plusTap(_ sender: Any) {
        addToWorkings(Value: "+")
    }
    
    
    @IBAction func equalTap(_ sender: Any) {
        let expression =  NSExpression(format: workings)
        let result = expression.expressionValue(with: nil, context: nil) as! Double
        let resultString = formatResult(result: result)
        calculatorResult.text = resultString
    
    }
    
    func formatResult(result: Double) -> String {
        if (result.truncatingRemainder(dividingBy: 1) == 0 ){
            return String(format: "%.0f", result)
        } else {
            return String(format: "%.2f", result)
        }
    }
    
    
    @IBAction func number0Tap(_ sender: Any) {
        addToWorkings(Value: "0")
    }
    
    
    @IBAction func number1Tap(_ sender: Any) {
        addToWorkings(Value: "1")
    }
    
    
    @IBAction func number2Tap(_ sender: Any) {
        addToWorkings(Value: "2")
    }
    
    
    @IBAction func number3Tap(_ sender: Any) {
        addToWorkings(Value: "3")
    }
    
    
    @IBAction func number4Tap(_ sender: Any) {
        addToWorkings(Value: "4")
    }
    
    
    @IBAction func number5Tap(_ sender: Any) {
        addToWorkings(Value: "5")
    }
    
    
    @IBAction func number6Tap(_ sender: Any) {
        addToWorkings(Value: "6")
    }
    
    
    @IBAction func number7Tap(_ sender: Any) {
        addToWorkings(Value: "7")
    }
    
    
    @IBAction func number8Tap(_ sender: Any) {
        addToWorkings(Value: "8")
    }
    
    
    @IBAction func number9Tap(_ sender: Any) {
        addToWorkings(Value: "9")
    }
    
    
    
    
    
    
    
}

