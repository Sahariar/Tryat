//
//  LoginVC.swift
//  Tryat
//
//  Created by Sahariar Kabir on 11/2/17.
//  Copyright © 2017 Sahariar Kabir. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

//	Outlets
	
	@IBOutlet weak var userName: UITextField!
	@IBOutlet weak var userPass: UITextField!
	@IBOutlet weak var spinner: UIActivityIndicatorView!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		setupViews()
    }

	@IBAction func closePressed(_ sender: Any) {
		dismiss(animated: true, completion: nil)
	}
	
	@IBAction func createAccontBtnPressed(_ sender: Any) {
		performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
	}
	
	@IBAction func loginBtnPressed(_ sender: Any) {
		spinner.isHidden = false
		spinner.startAnimating()
		guard let userEmailTxt = userName.text , userName.text != " " else {return}
		guard let userPassTxt = userPass.text , userPass.text != " " else {return}
		
		AuthService.instance.loginuser(email: userEmailTxt, password: userPassTxt) { (success) in
			if success {
				AuthService.instance.findUserByEmail(completion: { (success) in
					if success {
						NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
						self.spinner.isHidden = true
						self.spinner.stopAnimating()
						self.dismiss(animated: true, completion: nil)
					}
				})
			}
		}
		
	}
	
	func  setupViews(){
		spinner.isHidden = true
		userName.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedStringKey.foregroundColor : purplePlaceholder])
		userPass.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedStringKey.foregroundColor : purplePlaceholder])
	}
	

}
