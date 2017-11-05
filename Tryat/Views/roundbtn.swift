//
//  roundbtn.swift
//  Tryat
//
//  Created by Sahariar Kabir on 11/5/17.
//  Copyright © 2017 Sahariar Kabir. All rights reserved.
//

import UIKit
@IBDesignable
class roundbtn: UIButton {
	@IBInspectable var  cornerRadius: CGFloat = 3.0	{
	didSet	{
		self.layer.cornerRadius = cornerRadius
		}
	}
	override func awakeFromNib() {
		self.setupView()
	}
	func setupView() {
		self.layer.cornerRadius = cornerRadius
	}
	override func prepareForInterfaceBuilder() {
		super.prepareForInterfaceBuilder()
		self.setupView()
	}
	
}
