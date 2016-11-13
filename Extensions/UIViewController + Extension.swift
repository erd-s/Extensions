//
//  UIViewController + Extension.swift
//  Extensions
//
//  Created by Christopher Erdos on 11/13/16.
//  Copyright © 2016 Erdos. All rights reserved.
//

import Foundation
import UIKit
import Social

extension UIViewController {
	/**
	Shows a UIAlertController with a single button titled 'Ok'.
	
	- parameter title: **optional** title for UIAlertController.
	- parameter message: **optional** message for UIAlertController.
	- parameter completionBlock: **optional** completion block to be called
	when the user presses the ok button.
	*/
	func showErrorAlert(title: String?, message: String?, completionBlock: (()->())?) {
		let errorAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
		let okAction = UIAlertAction(title: "OK", style: .default) { (UIAlertAction) in
			completionBlock?()
		}
		errorAlert.addAction(okAction)
		present(errorAlert, animated: true, completion: nil)
	}
	
	/**
	Shows alert controller with `opts` number of actions, `title` title, `message` message.
	
	- Parameter opts: The number of actions to add to the alert.
	- Parameter actionTitles: An array containing the titles of the actions.
	- Parameter completionBlocks: An Array of completion blocks. one for each item.
	
	**Required: Match the number of titles with the number of options.**
	*/
	func showAlertControllerWithActions(opts: Int, title tit: String?, message mes: String?, actionTitles: [String], completionBlocks: [(()->())]?) {
		let errorAlert = UIAlertController(title: tit, message: mes, preferredStyle: .alert)
		
		for num in 0..<opts {
			var style: UIAlertActionStyle!
			
			if actionTitles[num] == "Cancel" {
				style = .cancel
			} else {
				style = .default
			}
			
			let act = UIAlertAction(title: actionTitles[num], style: style, handler: { (UIAlertAction) in
				if completionBlocks != nil {
					completionBlocks?[num]()
				}
			})
			errorAlert.addAction(act)
		}
		defer { present(errorAlert, animated: true, completion: nil) }
	}
	
	//--------------------------------------
	// MARK: - Social
	//--------------------------------------
	/**
	Uses Apple's Social SDK to show a share dialogue to Facebook or present an
	error if Facebook is not available.
	
	- Parameters link: The link to be shared in the dialogue box.
	*/
	func shareToFacebook(link: URL, initialText: String) {
		if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook) {
			let fbVC = SLComposeViewController(forServiceType: SLServiceTypeFacebook)!
			fbVC.add(link)
			fbVC.setInitialText(initialText)
			
			present(fbVC, animated: true, completion: nil)
		} else {
			showErrorAlert(title: "Please install and login to the Facebook app first.", message: nil, completionBlock: nil)
		}
	}
	
	/**
	Uses Apple's Social SDK to show a share dialogue to Twitter or present an
	error if Facebook is not available.
	
	- Parameters link: The link to be shared in the dialogue box.
	*/
	func shareToTwitter(link: URL, initialText: String) {
		if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter) {
			let twitterVC = SLComposeViewController(forServiceType: SLServiceTypeTwitter)!
			twitterVC.add(link)
			twitterVC.setInitialText(initialText)
			
			present(twitterVC, animated: true, completion: nil)
		} else {
			showErrorAlert(title: "Please install and login to the Facebook app first.", message: nil, completionBlock: nil)
		}
	}
}
