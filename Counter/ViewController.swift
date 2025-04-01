//
//  ViewController.swift
//  Counter
//
//  Created by Roman Yaschenkov on 01.04.2025.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textViewLog: UITextView!
    @IBOutlet weak var labelCounter: UILabel!
    @IBOutlet weak var buttonReset: UIButton!
    @IBOutlet weak var buttonDecrease: UIButton!
    @IBOutlet weak var buttonIncrease: UIButton!
    
    private let counterDescription: String = "Counter value: "
    private let dateFormatter: DateFormatter = DateFormatter()
    private let counterStep: Int = 1
    private var counterValue: Int = 0
        
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.locale = Locale(identifier: "ru_Ru")
        dateFormatter.dateFormat = "dd.MM.YYYY HH:mm:ss"
    }
    
    private func addLogMessage(message: String) {
        textViewLog.text += "\n" + dateFormatter.string(from: Date()) + " " + message
    }
    
    private func updateCounterDescription() {
        labelCounter.text = counterDescription + counterValue.description
        addLogMessage(message: "Value changed to: \(counterValue)")
    }

    @IBAction func buttonIncreaseDidTap(_ sender: Any) {
        if (counterValue == Int.max) {
            addLogMessage(message: "Max value has been reached")
        } else {
            counterValue += counterStep
            updateCounterDescription()
        }
    }
    
    @IBAction func buttonDecreaseDidTap(_ sender: Any) {
        if (counterValue - counterStep) >= 0 {
            counterValue -= counterStep
            updateCounterDescription()
        } else {
            addLogMessage(message: "Attempt to set below 0")
        }
    }
    
    @IBAction func buttonResetDidTap(_ sender: Any) {
        if (counterValue == 0) {
            addLogMessage(message: "Value already reset")
        } else {
            counterValue = 0
            updateCounterDescription()
            addLogMessage(message: "Value has been reset")
        }
    }
}

