//
//  ProfieVC.swift
//  Tryat
//
//  Created by Sahariar Kabir on 14/11/17.
//  Copyright © 2017 Sahariar Kabir. All rights reserved.
//

import UIKit

class ProfieVC: UIViewController {
// outlet
	@IBOutlet weak var userName: UILabel!
	@IBOutlet weak var userEmail: UILabel!
	@IBOutlet weak var profileImg: UIImageView!
	@IBOutlet weak var bgView: UIView!
	
//action
	@IBAction func clMdPressed(_ sender: Any) {
	self.dismiss(animated: true, completion: nil)
	}
	
	@IBAction func logOutPressed(_ sender: Any) {
		UserDataService.instance.logoutUser()
		NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
		dismiss(animated: true, completion: nil)
		
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()
		setupView()
    }

	func setupView(){
		userName.text = UserDataService.instance.name
		userEmail.text = UserDataService.instance.email
		profileImg.image = UIImage(named: UserDataService.instance.avatarName)
		profileImg.backgroundColor = UserDataService.instance.returnUiColor(compenets: UserDataService.instance.avaterColor)
		
		let closeTouch = UITapGestureRecognizer(target: self, action: #selector(ProfieVC.closeTap(_:)))
		bgView.addGestureRecognizer(closeTouch)
	}
	
	@objc func closeTap(_ recogniger: UITapGestureRecognizer)  {
			dismiss(animated: true, completion: nil)
	}
	
}
