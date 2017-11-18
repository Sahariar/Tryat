//
//  Constants.swift
//  Tryat
//
//  Created by Sahariar Kabir on 11/2/17.
//  Copyright © 2017 Sahariar Kabir. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()
//url constent
let base_Url = "https://tryatchaty.herokuapp.com/v1"
let register_Url = "\(base_Url)/account/register"
let login_Url = "\(base_Url)/account/login"
let addUser_Url = "\(base_Url)/user/add"
let User_BY_Email_Url = "\(base_Url)/user/byEmail/"
let URL_GET_CHANNELS = "\(base_Url)/channel/"
let URL_GET_MESSAGES = "\(base_Url)/message/byChannel/"

//color
let purplePlaceholder = #colorLiteral(red: 0.3254901961, green: 0.4196078431, blue: 0.9686274529, alpha: 0.5)
// Notification Center

let NOTIF_USER_DATA_DID_CHANGE = Notification.Name("notifUserDataChanged")
let NOTIF_CHANNELS_LOAEDED = Notification.Name("channelsLoaded")
let NOTIF_CHANNELS_SELECTED = Notification.Name("channelsSelected")



//segue
let TO_LOGIN =  "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindtoChannel"
let TO_AVATAR_PICKER = "toAvatarPicker"
//USER defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

//header
let HEADER = ["Content-Type" : "application/json; charset=utf-8"]
let  Bearer_header = [
	"Authorization" : "Bearer \(AuthService.instance.authToken)",
	"Content-Type" : "application/json; charset=utf-8"
]




