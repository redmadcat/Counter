//
//  ViewController.swift
//  Counter
//
//  Created by Roman Yaschenkov on 01.04.2025.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet weak private var textViewLog: UITextView!
    @IBOutlet weak private var labelCounter: UILabel!
    @IBOutlet weak private var buttonReset: UIButton!
    @IBOutlet weak private var buttonDecrease: UIButton!
    @IBOutlet weak private var buttonIncrease: UIButton!
    
    private let counterDescription: String = "Counter value: "
    private let counterStep: Int = 1
    private var counterValue: Int = 0
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_Ru")
        formatter.dateFormat = "dd.MM.YYYY HH:mm:ss"
        return formatter
    }()
      
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func addLogMessage(message: String) {
        textViewLog.text += "\n" + dateFormatter.string(from: Date()) + " " + message
    }
    
    private func updateCounterDescription() {
        labelCounter.text = counterDescription + counterValue.description
        addLogMessage(message: "Value changed to: \(counterValue)")
    }

    @IBAction private func buttonIncreaseDidTap(_ sender: Any) {
        if (counterValue == Int.max) {
            addLogMessage(message: "Max value has been reached")
        } else {
            counterValue += counterStep
            updateCounterDescription()
        }
    }
    
    @IBAction private func buttonDecreaseDidTap(_ sender: Any) {
        if (counterValue - counterStep) >= 0 {
            counterValue -= counterStep
            updateCounterDescription()
        } else {
            addLogMessage(message: "Attempt to set below 0")
        }
    }
    
    @IBAction private func buttonResetDidTap(_ sender: Any) {
        if (counterValue == 0) {
            addLogMessage(message: "Value already reset")
        } else {
            counterValue = 0
            updateCounterDescription()
            addLogMessage(message: "Value has been reset")
        }
    }
}

