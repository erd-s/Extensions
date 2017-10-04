//
//  UIButton + Extension.swift
//  Extensions
//
//  Created by Christopher Erdos on 10/4/17.
//  Copyright © 2017 Erdos. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
	///courtesy of https://github.com/lanceruss
	func underlineTitle(color: UIColor = UIColor.white) {
		guard let titleLabelText = titleLabel?.text else { return }
		
		let attr : [NSAttributedStringKey: Any] = [NSAttributedStringKey.foregroundColor : color,
		                                           NSAttributedStringKey.underlineStyle : NSUnderlineStyle.styleSingle.rawValue]
		let attrString = NSMutableAttributedString(string: titleLabelText,
		                                           attributes: attr)
		setAttributedTitle(attrString, for: .normal)
	}
}
