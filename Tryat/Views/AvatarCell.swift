//
//  AvatarCell.swift
//  Tryat
//
//  Created by Sahariar Kabir on 11/7/17.
//  Copyright © 2017 Sahariar Kabir. All rights reserved.
//

import UIKit

class AvatarCell: UICollectionViewCell {
    
	@IBOutlet weak var avaterImg: UIImageView!

	override func awakeFromNib() {
		super.awakeFromNib()
		setUpView()
	}

	func setUpView() {
		self.layer.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
		self.layer.cornerRadius = 10
		self.clipsToBounds = true
	}








}
