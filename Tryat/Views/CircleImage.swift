//
//  CircleImage.swift
//  Tryat
//
//  Created by Sahariar Kabir on 14/11/17.
//  Copyright © 2017 Sahariar Kabir. All rights reserved.
//

import UIKit

@IBDesignable

class CircleImage: UIImageView {
	override func awakeFromNib() {
	setupView()
	}
	
	func setupView () {
		self.layer.cornerRadius = self.frame.width / 2
		self.clipsToBounds = true
	}
	override func prepareForInterfaceBuilder() {
		super.prepareForInterfaceBuilder()
		setupView()
	}
}
