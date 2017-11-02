//
//  GradientView.swift
//  Tryat
//
//  Created by Sahariar Kabir on 11/2/17.
//  Copyright © 2017 Sahariar Kabir. All rights reserved.
//

import UIKit
@IBDesignable
class GradientView: UIView {
	@IBInspectable var topColor: UIColor = #colorLiteral(red: 0.05490196078, green: 0.6431372549, blue: 0.9176470588, alpha: 1) {
		didSet {
			self.setNeedsLayout()
		}
	}
		@IBInspectable var bottomColor: UIColor = #colorLiteral(red: 0.7411764706, green: 0.9647058824, blue: 0.9215686275, alpha: 1) {
		didSet {
		self.setNeedsLayout()
		}
			}
	override func layoutSubviews() {
		let gradientLayer = CAGradientLayer()
		gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
		gradientLayer.startPoint = CGPoint(x: 0, y: 0)
		gradientLayer.endPoint = CGPoint(x: 1, y:1 )
		gradientLayer.frame = self.bounds
		self.layer.insertSublayer(gradientLayer, at: 0)
	}
	
	
	}
