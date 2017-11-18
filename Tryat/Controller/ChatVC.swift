//
//  ChatVC.swift
//  Tryat
//
//  Created by Sahariar Kabir on 11/2/17.
//  Copyright © 2017 Sahariar Kabir. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {
	
//	Outlets

	@IBOutlet weak var menuBtn: UIButton!
	
	@IBOutlet weak var channelNameLbl: UILabel!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
		self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
		self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
		
		NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.userDataDidChange(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
		
		NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.channelSelected(_:)), name: NOTIF_CHANNELS_SELECTED, object: nil)
		
		if AuthService.instance.isLoggedIn {
			AuthService.instance.findUserByEmail(completion: { (success) in
				NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
			})
		}
		
    }
	
	@objc func channelSelected(_ notif: Notification ) {
		updateWithChannel()
	}
	
	func updateWithChannel() {
		let channelName  = MessageService.instance.selectedChannel?.ChannelTitle ?? " "
		channelNameLbl.text = "#\(channelName)"
	}
	
	
	@objc func userDataDidChange (_ notif: Notification){
		if AuthService.instance.isLoggedIn{
				//get Channels
			onLoginGetMessage()
		}else {
			channelNameLbl.text = "Please Log In"
		}
	}

	func onLoginGetMessage() {
		MessageService.instance.findAllChannel { (success) in
			if success {
//				Work on Channels
			}
		}
	}
}
