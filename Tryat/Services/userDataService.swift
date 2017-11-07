//
//  userDataService.swift
//  Tryat
//
//  Created by Sahariar Kabir on 11/7/17.
//  Copyright © 2017 Sahariar Kabir. All rights reserved.
//

import Foundation

class UserDataService {
	
	static let instance = UserDataService()
	
	public private(set) var id = " "
	public private(set) var avaterColor = " "
	public private(set) var avatarName = " "
	public private(set) var email = " "
	public private(set) var name = " "
	
	func setUserDataService(id:String, color:String, avatarName:String,email:String,name:String) {
		self.id = id
		self.avaterColor = color
		self.avatarName = avatarName
		self.email = email
		self.name = name
	}
	func setAvatarName(avatarName:String) {
		self.avatarName = avatarName
	}
}
