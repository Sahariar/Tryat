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
	
	func returnUiColor(compenets: String) -> UIColor {
		let scanner = Scanner(string: compenets)
		let skipped = CharacterSet(charactersIn: "[], ")
		let comma = CharacterSet(charactersIn: ",")
		scanner.charactersToBeSkipped = skipped
		
		var r, g, b, a : NSString?
		scanner.scanUpToCharacters(from: comma, into: &r)
		scanner.scanUpToCharacters(from: comma, into: &g)
		scanner.scanUpToCharacters(from: comma, into: &b)
		scanner.scanUpToCharacters(from: comma, into: &a)
		
		let defaultColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
		
		guard let rUnwrapped = r else {return defaultColor}
		guard let gUnwrapped = g else {return defaultColor}
		guard let bUnwrapped = b else {return defaultColor}
		guard let aUnwrapped = a else {return defaultColor}
		
		let rfloat = CGFloat(rUnwrapped.doubleValue)
		let gfloat = CGFloat(gUnwrapped.doubleValue)
		let bfloat = CGFloat(bUnwrapped.doubleValue)
		let afloat = CGFloat(aUnwrapped.doubleValue)
		
		let newUIColor = UIColor(red: rfloat, green: gfloat, blue: bfloat, alpha: afloat)
		
		return newUIColor
	}
	
	func logoutUser() {
		id = " "
		avatarName = " "
		avaterColor = " "
		email = " "
		name = " "
		
		AuthService.instance.isLoggedIn = false
		AuthService.instance.userEmail = " "
		AuthService.instance.authToken = " "
		MessageService.instance.clearChannel()
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
