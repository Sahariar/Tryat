//
//  CreateAccountVC.swift
//  Tryat
//
//  Created by Sahariar Kabir on 11/2/17.
//  Copyright © 2017 Sahariar Kabir. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		
    }
	
	@IBAction func closePressed(_ sender: Any) {
		performSegue(withIdentifier: UNWIND, sender: nil)
	}
	
	
}
