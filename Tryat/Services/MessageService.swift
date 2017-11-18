//
//  MessageService.swift
//  Tryat
//
//  Created by Sahariar Kabir on 15/11/17.
//  Copyright © 2017 Sahariar Kabir. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MessageService {
	
	static let instance = MessageService()
	
	var channels = [Channel]()
	var selectedChannel: Channel?
	
	func findAllChannel(completion: @escaping CompletionHandler){
		Alamofire.request(URL_GET_CHANNELS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: Bearer_header).responseJSON { (response) in
			if response.result.error == nil {
				guard let data = response.data else { return }
				if let json = JSON(data: data).array {
					for item in json {
					let name = item["name"].stringValue
					let channelDescription = item["description"].stringValue
					let id = item["_id"].stringValue
					let channel = Channel(ChannelTitle: name, ChannelDescription: channelDescription , id: id)
						self.channels.append(channel)
					}
					NotificationCenter.default.post(name: NOTIF_CHANNELS_LOAEDED, object: nil)
							completion(true)
				}
	
			}else{
				completion(false)
				debugPrint(response.result.error as Any)
			}
		}
	}
	
	func clearChannel() {
		channels.removeAll()
	}
}

