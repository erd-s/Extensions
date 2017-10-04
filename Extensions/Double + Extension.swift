//
//  Double + Extension.swift
//  Extensions
//
//  Created by Christopher Erdos on 10/4/17.
//  Copyright © 2017 Erdos. All rights reserved.
//

import Foundation

extension Double {
	///self as string
	var string: String {
		return "\(self)"
	}
	
	///Drops trailing zeros and returns a string. 10.0 --> "10"
	var stringNoTrailingZeros: String {
		let string = "\(self)"
		let beforeDecimal = string.components(separatedBy: ".").first
		var afterDecimal = string.components(separatedBy: ".").last
		
		for char in afterDecimal?.characters.reversed() ?? [] {
			if char == "0" {
				afterDecimal?.characters.removeLast()
			} else {
				break
			}
		}
		
		if let after = afterDecimal, !after.isEmpty {
			return (beforeDecimal ?? "0") + "." + after
		} else {
			return beforeDecimal ?? "0"
		}
	}
	
	///returns a string, rounding to the given number of decimals
	func roundedString(decimalPlaces: Int) -> String {
		let string = String(format: "%.\(decimalPlaces)lf", self)
		let beforeDecimal = string.components(separatedBy: ".").first
		let afterDecimal = string.components(separatedBy: ".").last
		
		if afterDecimal?.characters.count == 1, afterDecimal != "0" {
			return (beforeDecimal ?? "0").appending(afterDecimal ?? "0").appending("0")
		} else if afterDecimal == "00" || afterDecimal == "0" {
			return beforeDecimal ?? "0"
		}
		
		return string
	}
}
