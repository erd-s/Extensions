//
//  Collection + Extension.swift
//  Extensions
//
//  Created by Christopher Erdos on 10/4/17.
//  Copyright © 2017 Erdos. All rights reserved.
//

import Foundation

extension Collection {
	///safe subscript return, courtesy of https://stackoverflow.com/a/30593673
	subscript(safe index: Index) -> Element? {
		if indices.contains(index) {
			return self[index]
		} else {
			return nil
		}
	}
}
