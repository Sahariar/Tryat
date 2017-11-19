//
//  MessageCell.swift
//  Tryat
//
//  Created by Sahariar Kabir on 19/11/17.
//  Copyright © 2017 Sahariar Kabir. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
//	Outlets
	@IBOutlet weak var userImg: CircleImage!
	@IBOutlet weak var timeStamp: UILabel!
	@IBOutlet weak var messageBody: UILabel!
	@IBOutlet weak var userName: UILabel!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

	func configureCell(message: Message){
		messageBody.text = message.message
		userName.text  = message.userName
//		timeStamp.text = message.timeStamp
		userImg.image = UIImage(named: message.userAvatar)
		userImg.backgroundColor = UserDataService.instance.returnUiColor(compenets: message.userAvatarColor)
	}
	
	

}
