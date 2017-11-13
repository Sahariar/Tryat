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
	
	var avatarName = "profileDefault"
	var avatarColor = "[0.5,0.5,0.5,1]"
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
	}
	
	@IBAction func CreateAccountPressed(_ sender: Any) {
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
								self.performSegue(withIdentifier: UNWIND, sender: nil)
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
		
	}
	@IBAction func closePressed(_ sender: Any) {
		performSegue(withIdentifier: UNWIND, sender: nil)
	}
	
	
}
