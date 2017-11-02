//
//  LoginVC.swift
//  Tryat
//
//  Created by Sahariar Kabir on 11/2/17.
//  Copyright © 2017 Sahariar Kabir. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

	@IBAction func closePressed(_ sender: Any) {
		dismiss(animated: true, completion: nil)
	}
	
	@IBAction func createAccontBtnPressed(_ sender: Any) {
		performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
	}
	
	

}
