//
//  AddChannelVCViewController.swift
//  Tryat
//
//  Created by Sahariar Kabir on 15/11/17.
//  Copyright © 2017 Sahariar Kabir. All rights reserved.
//

import UIKit

class AddChannelVCViewController: UIViewController {
//	outlets
	@IBOutlet weak var chNameTxt: UITextField!
	@IBOutlet weak var chDesTxt: UITextField!
	@IBOutlet weak var bgView: UIView!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		setUpView()
    }
	@IBAction func clMoBtnPress(_ sender: Any) {
		dismiss(animated: true, completion: nil)
	}
	
	@IBAction func CreChaBtnPress(_ sender: Any) {
	}
	func setUpView() {
		let colseTouch = UITapGestureRecognizer(target: self, action: #selector(AddChannelVCViewController.closeTap(_:)))
	bgView.addGestureRecognizer(colseTouch)
		
		chNameTxt.attributedPlaceholder = NSAttributedString(string: "Name", attributes: [NSAttributedStringKey.foregroundColor : purplePlaceholder])
		chDesTxt.attributedPlaceholder = NSAttributedString(string: "Description", attributes: [NSAttributedStringKey.foregroundColor : purplePlaceholder])
	}

	@objc func closeTap(_ recognizer: UITapGestureRecognizer) {
		dismiss(animated: true, completion: nil)
	}
	
	
}
