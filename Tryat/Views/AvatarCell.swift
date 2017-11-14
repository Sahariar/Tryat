//
//  AvatarCell.swift
//  Tryat
//
//  Created by Sahariar Kabir on 11/7/17.
//  Copyright © 2017 Sahariar Kabir. All rights reserved.
//

import UIKit

enum AvatarType {
	case dark
	case light
}

class AvatarCell: UICollectionViewCell {
    
	@IBOutlet weak var avaterImg: UIImageView!

	override func awakeFromNib() {
		super.awakeFromNib()
		setUpView()
	}
	func configureCell(index: Int, type : AvatarType) {
		if type == AvatarType.dark {
			avaterImg.image = UIImage(named: "dark\(index)")
			self.layer.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
		} else{
			avaterImg.image = UIImage(named: "light\(index)")
			self.layer.backgroundColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
		}
	}
	func setUpView() {
		self.layer.backgroundColor = #colorLiteral(red: 0.9233459287, green: 0.9607986992, blue: 0.8397691406, alpha: 1)
		self.layer.cornerRadius = 10
		self.clipsToBounds = true
	}








}
