//
//  ViewController.swift
//  Calculator
//
//  Created by Kyle Maher on 12/22/16.
//  Copyright © 2016 Kyle Maher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	private var brain = CalculatorBrain()
	
	private var userIsInMiddleOfTyping = false
	
	private var displayValue: Double {
		get {
			return Double(display.text!)!
		}
		set {
			display.text = String(newValue)
		}
	}
	
	@IBOutlet private weak var display: UILabel!
	
	@IBAction private func touchDigit(_ sender: UIButton) {
		let digit = sender.currentTitle!
		print("Digit \(digit) pressed.")
		
		if userIsInMiddleOfTyping {
			let textCurrentlyOnDisplay = display.text!
			display.text = textCurrentlyOnDisplay + digit
		} else {
			display.text = digit;
		}
		
		userIsInMiddleOfTyping = true;
	}
	
	@IBAction private func performOperation(_ sender: UIButton) {
		if (userIsInMiddleOfTyping) {
			brain.setOperand(operand: displayValue)
			userIsInMiddleOfTyping = false;
		}
		
		if let mathematicalSymbol = sender.currentTitle {
			brain.performOperation(mathematicalSymbol)
		}
		
		displayValue = brain.result;
	}
}
