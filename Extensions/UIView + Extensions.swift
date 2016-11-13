//
//  UIView + Extensions.swift
//  Extensions
//
//  Created by Christopher Erdos on 11/13/16.
//  Copyright © 2016 Erdos. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
	/**
	Changes the height constraint to a new value.
	*/
	func increaseHeightConstraintBy(_ height: CGFloat) {
		for constraint in constraints {
			if constraint.firstAttribute == .height {
				constraint.constant += height
			}
		}
	}
	
	/**
	Changes the height constraint to a new value.
	*/
	func decreaseHeightConstraintBy(_ height: CGFloat) {
		for constraint in constraints {
			if constraint.firstAttribute == .height {
				constraint.constant -= height
			}
		}
	}
	
	/**
	Rounds the corners of `self`.
	
	- parameter corners: Corners to round. ex. [.bottomLeft, .bottomRight]
	- parameter radius: Radius of the corners to round.
	*/
	func roundCorners(corners: UIRectCorner, radius: CGFloat) {
		layoutIfNeeded()
		let path = UIBezierPath(roundedRect: bounds,
		                        byRoundingCorners: corners,
		                        cornerRadii: CGSize(width: radius, height: radius))
		
		let maskLayer = CAShapeLayer()
		
		maskLayer.path = path.cgPath
		layer.mask = maskLayer
	}
}
