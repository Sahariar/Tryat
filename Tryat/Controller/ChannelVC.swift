//
//  ChannelVC.swift
//  Tryat
//
//  Created by Sahariar Kabir on 11/2/17.
//  Copyright © 2017 Sahariar Kabir. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

	@IBOutlet weak var loginBtn: UIButton!
	
	@IBOutlet weak var userimg: CircleImage!
	@IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
		
	}
	override func viewDidLoad() {
        super.viewDidLoad()
self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
		NotificationCenter.default.addObserver(self, selector: #selector(ChannelVC.userDataDidChange(_: )), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
		
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
		if AuthService.instance.isLoggedIn {
			loginBtn.setTitle(UserDataService.instance.name, for: .normal)
			userimg.image = UIImage(named: UserDataService.instance.avatarName)
			userimg.backgroundColor = UserDataService.instance.returnUiColor(compenets: UserDataService.instance.avaterColor)
		}else{
			loginBtn.setTitle("Login", for: .normal)
			userimg.image = UIImage( named: "profileDefault")
				userimg.backgroundColor = UIColor.clear
		}
	}



}
