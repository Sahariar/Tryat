//
//  CreateAccountVC.swift
//  Tryat
//
//  Created by Sahariar Kabir on 11/2/17.
//  Copyright © 2017 Sahariar Kabir. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

	@IBOutlet weak var usernameTxt: UITextField!
	@IBOutlet weak var emailTxt: UITextField!
	@IBOutlet weak var paswordTxt: UITextField!
	@IBOutlet weak var profileImage: UIImageView!
//	variables
	var avatarName = "profileDefault"
	var avatarColor = "[0.5,0.5,0.5,1]"
	var bgColor: UIColor?
	
	@IBOutlet weak var loading: UIActivityIndicatorView!
	override func viewDidLoad() {
		super.viewDidLoad()
		setupView()
	}
	override func viewDidAppear(_ animated: Bool) {
		if UserDataService.instance.avatarName != " " {
			profileImage.image = UIImage(named:UserDataService.instance.avatarName)
			avatarName = UserDataService.instance.avatarName
			if avatarName.contains("light") && bgColor == nil {
				profileImage.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
				
			}
		}
	}
	@IBAction func CreateAccountPressed(_ sender: Any) {
		loading.isHidden = false
		loading.startAnimating()
		guard let email = emailTxt.text , emailTxt.text != " " else {
			return
		}
		guard let name = usernameTxt.text , usernameTxt.text != " " else {
			return
		}
		guard let pass = paswordTxt.text , paswordTxt.text != " " else {
			return
		}
		AuthService.instance.resgisterUser(email: email, password: pass) { (success) in
			if success {
				AuthService.instance.loginuser(email: email, password: pass, completion: { (success) in
					if success{
						AuthService.instance.CreateUser(avatarColor: self.avatarColor, avatarName: self.avatarName, email: email, name: name, completion: { (success) in
							if success {
								print(UserDataService.instance.name, UserDataService.instance.avatarName)
								self.loading.isHidden = true
								self.loading.startAnimating()
								self.performSegue(withIdentifier: UNWIND, sender: nil)
								NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
							}
						})
					}
				})
			}
		}
	}
	@IBAction func ChAvatarPressed(_ sender: Any) {
		performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
	}
	@IBAction func bgCoChPressed(_ sender: Any) {
		let r = CGFloat(arc4random_uniform(255)) / 255
		let g = CGFloat(arc4random_uniform(255)) / 255
		let b = CGFloat(arc4random_uniform(255)) / 255
		bgColor = UIColor(red: r, green: g, blue: b, alpha: 1)
		avatarColor = "[\(r), \(g), \(b), 1]"
		UIView.animate(withDuration:0.2){
		self.profileImage.backgroundColor = self.bgColor
	}
	}
	@IBAction func closePressed(_ sender: Any) {
		performSegue(withIdentifier: UNWIND, sender: nil)
	}
	
	func setupView() {
		loading.isHidden = true
		usernameTxt.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedStringKey.foregroundColor : purplePlaceholder])
		
		emailTxt.attributedPlaceholder = NSAttributedString(string: "email", attributes: [NSAttributedStringKey.foregroundColor : purplePlaceholder])
		
		paswordTxt.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedStringKey.foregroundColor : purplePlaceholder])
		
		let tap = UITapGestureRecognizer(target: self, action: #selector(CreateAccountVC.handleTap) )
		view.addGestureRecognizer(tap)
	}
	@objc func handleTap() {
		view.endEditing(true)
	}
}
