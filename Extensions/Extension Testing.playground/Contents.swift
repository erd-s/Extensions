
import Foundation

extension Double {
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
}

extension Date {
	/**
	Returns a rounded value of how much time has passed.
	ex. time between Jul 27, 1943 and Oct 4, 2017 --> 27098d
	ex. time between Oct 4, 2017 7:28am and Oct 4, 2017 1:59pm --> 7h
	*/
	func timePassed() -> String {
		let timeIntervalSince = Date().timeIntervalSince(self)
		let hours = timeIntervalSince / 3600
		
		if hours < 1 {
			let minutes = hours * 60
			return round(minutes).stringNoTrailingZeros + "m"
		} else if hours > 24 {
			let days = hours / 24
			return round(days).stringNoTrailingZeros + "d"
		} else {
			return round(hours).stringNoTrailingZeros + "h"
		}
	}
}

