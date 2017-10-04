//
//  Array + Extension.swift
//  Extensions
//
//  Created by Christopher Erdos on 10/4/17.
//  Copyright © 2017 Erdos. All rights reserved.
//

import Foundation

extension Array {
	///Returns combination of two arrays. Does not remove duplicates.
	static func + (lhs: [Element], rhs: [Element]) -> [Element] {
		var array: [Element] = [Element]()
		
		array.append(contentsOf: lhs)
		array.append(contentsOf: rhs)
		
		return array
	}
}

extension Array where Element:Equatable {
	///removes a given element from an array as many times as it exists
	mutating func removeItem(_ element: Element?) {
		guard let element = element else { return }
		
		for item in self {
			if item == element, let indexOfItem = index(of: item) {
				remove(at: indexOfItem)
			}
		}
	}
	
	mutating func removeDuplicates() {
		var testDuplicatesArray = [Element]()
		for element in self {
			if testDuplicatesArray.contains(where: {$0 == element}) {
				self.removeItem(element)
			} else {
				testDuplicatesArray.append(element)
			}
		}
	}
}
