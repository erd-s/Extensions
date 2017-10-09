//
//  UIViewController + Extension.swift
//  Extensions
//
//  Created by Christopher Erdos on 10/4/17.
//  Copyright © 2017 Erdos. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
	func showErrorAlertWith(title: String? = nil, message: String? = nil, completion: (()->())? = nil) {
		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
		let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
			completion?()
		}
		
		alert.addAction(okAction)
		present(alert, animated: true, completion: nil)
	}
}
