//
//  ChatVC.swift
//  Tryat
//
//  Created by Sahariar Kabir on 11/2/17.
//  Copyright © 2017 Sahariar Kabir. All rights reserved.
//

import UIKit

class ChatVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
	
//	Outlets

	@IBOutlet weak var menuBtn: UIButton!
	@IBOutlet weak var messageTxtBox: UITextField!
	@IBOutlet weak var channelNameLbl: UILabel!
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var sendBtn: UIButton!
	
//	variables
	var isTyping = false
	
    override func viewDidLoad() {
        super.viewDidLoad()
		view.bindToKeyboard()
		tableView.delegate = self
		tableView.dataSource = self
		sendBtn.isHidden = true
		tableView.estimatedRowHeight = 80
		tableView.rowHeight = UITableViewAutomaticDimension
		let tap = UITapGestureRecognizer(target: self, action: #selector(ChatVC.handleTap))
		view.addGestureRecognizer(tap)
		menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
		self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
		self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
		
		NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.userDataDidChange(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
		
		NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.channelSelected(_:)), name: NOTIF_CHANNELS_SELECTED, object: nil)
		
		SocketService.instance.getChatMessage { (success) in
			if success {
				self.tableView.reloadData()
				if MessageService.instance.messages.count > 0 {
					let endIndex = IndexPath(row: MessageService.instance.messages.count - 1, section: 0)
					self.tableView.scrollToRow(at: endIndex, at: .bottom , animated: true)
				}
			}
		}
		
		if AuthService.instance.isLoggedIn {
			AuthService.instance.findUserByEmail(completion: { (success) in
				NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
			})
		}
		
    }
	
	@objc func channelSelected(_ notif: Notification ) {
		updateWithChannel()
	}
	@objc func handleTap() {
		view.endEditing(true)
	}
	@IBAction func sendBtnPressed(_ sender: Any) {
		if AuthService.instance.isLoggedIn {
			guard let channelId = MessageService.instance.selectedChannel?.id else { return }
			guard let message = messageTxtBox.text else { return }
		
			SocketService.instance.addMessage(messageBody: message, channelId: channelId, userId: UserDataService.instance.id, completion: { (sucess) in
				if sucess {
					self.messageTxtBox.text = " "
					self.messageTxtBox.resignFirstResponder()
				}
			})
		}
	}
	func updateWithChannel() {
		let channelName  = MessageService.instance.selectedChannel?.ChannelTitle ?? " "
		channelNameLbl.text = "#\(channelName)"
		getMessages()
	}
	
	@IBAction func messboxEdit(_ sender: Any) {
		if messageTxtBox.text == " " {
			isTyping  = false
			sendBtn.isHidden = true
		}else {
			if isTyping == false {
			sendBtn.isHidden = false
			}
			isTyping = true
		}
	}
	
	@objc func userDataDidChange (_ notif: Notification){
		if AuthService.instance.isLoggedIn{
				//get Channels
			onLoginGetMessage()
		}else {
			channelNameLbl.text = "Please Log In"
			tableView.reloadData()
		}
	}

	func onLoginGetMessage() {
		MessageService.instance.findAllChannel { (success) in
			if success {
//				Work on Channels
				if MessageService.instance.channels.count > 0 {
				MessageService.instance.selectedChannel = MessageService.instance.channels[0]
					self.updateWithChannel()
				}else {
					self.channelNameLbl.text = "No Channels Yet"
				}
			}
		}
	}
	
	func getMessages() {
		guard let channelId = MessageService.instance.selectedChannel?.id else { return }
		MessageService.instance.findAllMessagesForChannel(channelId: channelId) { (success) in
			if success {
				self.tableView.reloadData()
			}
		}
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as? MessageCell {
			
			let message = MessageService.instance.messages[indexPath.row]
			cell.configureCell(message: message)
			
			return cell
			
		} else {
			return UITableViewCell()
		}
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return MessageService.instance.messages.count
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
