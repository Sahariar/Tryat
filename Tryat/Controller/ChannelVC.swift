//
//  ChannelVC.swift
//  Tryat
//
//  Created by Sahariar Kabir on 11/2/17.
//  Copyright © 2017 Sahariar Kabir. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

	@IBOutlet weak var loginBtn: UIButton!
	
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var userimg: CircleImage!
	@IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
		
	}
	override func viewDidLoad() {
        super.viewDidLoad()
		tableView.delegate = self
		tableView.dataSource = self
		self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
		NotificationCenter.default.addObserver(self, selector: #selector(ChannelVC.userDataDidChange(_: )), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
		
		NotificationCenter.default.addObserver(self, selector: #selector(ChannelVC.channelsLoaded(_:)), name: NOTIF_CHANNELS_LOAEDED, object: nil)
		
		
		SocketService.instance.getChannel { (success) in
			if success {
				self.tableView.reloadData()
			}
		}
		
    }
	override func viewDidAppear(_ animated:Bool ) {
		setUpUserInfo()
	}
	
	
	@IBAction func loginBtnPressed(_ sender: Any) {
		if AuthService.instance.isLoggedIn {
			let profile = ProfieVC()
			profile.modalPresentationStyle = .custom
			present(profile, animated: true, completion: nil)
		}else{
			performSegue(withIdentifier: TO_LOGIN, sender: nil)
		}
	}
	
	@objc func userDataDidChange (_ notif: Notification){
	setUpUserInfo()
	}
	@objc func channelsLoaded (_ notif : Notification) {
		tableView.reloadData();
	}
	
	func setUpUserInfo(){
		if AuthService.instance.isLoggedIn {
			loginBtn.setTitle(UserDataService.instance.name, for: .normal)
			userimg.image = UIImage(named: UserDataService.instance.avatarName)
			userimg.backgroundColor = UserDataService.instance.returnUiColor(compenets: UserDataService.instance.avaterColor)
		}else{
			loginBtn.setTitle("Login", for: .normal)
			userimg.image = UIImage( named: "profileDefault")
			userimg.backgroundColor = UIColor.clear
			tableView.reloadData()
		}
	}
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if	let cell = tableView.dequeueReusableCell(withIdentifier: "channelCell", for: indexPath) as? ChannelCell {
			let channel  = MessageService.instance.channels[indexPath.row]
			cell.configureCell(channel: channel)
			return cell
		}else {
			return UITableViewCell()
		}
	}

	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return MessageService.instance.channels.count
	}
	
	@IBAction func addChaBtnPress(_ sender: Any) {
		if AuthService.instance.isLoggedIn{
		let addChannel = AddChannelVCViewController()
		addChannel.modalPresentationStyle = .custom
		present(addChannel, animated: true, completion: nil)
		}
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let channel = MessageService.instance.channels[indexPath.row]
		MessageService.instance.selectedChannel = channel
		NotificationCenter.default.post(name: NOTIF_CHANNELS_SELECTED, object: nil)
		self.revealViewController().revealToggle(animated: true)
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
