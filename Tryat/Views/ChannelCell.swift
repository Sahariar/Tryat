//
//  ChannelCell.swift
//  Tryat
//
//  Created by Sahariar Kabir on 15/11/17.
//  Copyright © 2017 Sahariar Kabir. All rights reserved.
//

import UIKit

class ChannelCell: UITableViewCell {

//	outlets
	@IBOutlet weak var channelName: UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
	
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
		if selected {
			self.layer.backgroundColor = UIColor(white: 1, alpha: 0).cgColor
		}else {
			self.layer.backgroundColor = UIColor.clear.cgColor
		}
		
    }
	
	func configureCell(channel: Channel) {
		let title = channel.ChannelTitle ?? " "
		channelName.text = "#\(title)"
	}
	

	
	
	
	
	
	
	
	
	

}
