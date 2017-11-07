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

//segue
let TO_LOGIN =  "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindtoChannel"
//USER defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

//header
let HEADER = ["Content-Type" : "application/json; charset=utf-8"]




