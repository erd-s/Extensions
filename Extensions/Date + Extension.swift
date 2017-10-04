//
//  Date + Extension.swift
//  Extensions
//
//  Created by Christopher Erdos on 10/4/17.
//  Copyright © 2017 Erdos. All rights reserved.
//

import Foundation

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
	
	/**
	returns time from `self` (always positive)
	````
	let f = Date().addingTimeInterval(2340124)
	
	f.timeFromSelf(.long) //"27 days 2 hours 2 minutes"
	f.timeFromSelf(.short) //"27d 2h 2m"
	````
	- parameter format: `.long` or `.short`
	*/
	func timeFromSelf(_ format: Date.UnitFormat) -> String {
		let timeIntervalSince = self.timeIntervalSinceNow
		let seconds = Int(timeIntervalSince)
		let days = Int(seconds / 86400)
		let hours = Int((seconds - (days * 86400)) / 3600)
		let minutes = Int((seconds - (days * 86400) - (hours * 3600)) / 60)
		var timePassed = ""
		
		if days != 0 {
			if format == .long {
				timePassed.append("\(days) days ")
			} else {
				timePassed.append("\(days)d ")
			}
		}
		
		if hours != 0 {
			if format == .long {
				timePassed.append("\(hours) hours ")
			} else {
				timePassed.append("\(hours)h ")
			}
		}
		
		if minutes != 0 {
			if format == .long {
				timePassed.append("\(minutes) minutes")
			} else {
				timePassed.append("\(minutes)m")
			}
		}
		
		if timePassed.last == " " {
			timePassed.removeLast()
		}
		
		return timePassed.replacingOccurrences(of: "-", with: "")
	}
	
	enum UnitFormat {
		case long
		case short
	}
}
