//
//  SocketService.swift
//  Tryat
//
//  Created by Sahariar Kabir on 16/11/17.
//  Copyright © 2017 Sahariar Kabir. All rights reserved.
//

import UIKit
import SocketIO

class SocketService: NSObject {

	static let instance = SocketService()
	
	override init() {
		super.init()
	}
	
	var socket: SocketIOClient = SocketIOClient(socketURL: URL(string: base_Url)!)
	func establishConnection() {
		socket.connect()
	}
	
	func closeConnection() {
		socket.disconnect()
	}
	func addChannel(channelName: String, channelDescription: String, Completion: @escaping CompletionHandler) {
		socket.emit("newChannel", channelName,channelDescription)
		Completion(true)
	}
	func getChannel(completion: @escaping CompletionHandler) {
		socket.on("channelCreated") { (dataArray, ack) in
			guard let  channelName = dataArray[0] as? String else { return}
			guard let  channelDesc = dataArray[1] as? String else { return}
			guard let  channelId = dataArray[2] as? String else { return}
			let newChannel = Channel(ChannelTitle: channelName, ChannelDescription: channelDesc, id: channelId)
			MessageService.instance.channels.append(newChannel)
			completion(true)
		}
	}
	
	func addMessage(messageBody: String, channelId: String, userId: String, completion: @escaping CompletionHandler) {
		let user = UserDataService.instance
		socket.emit("newMessage", messageBody,userId,channelId,user.name,user.avatarName,user.avaterColor)
		completion(true)
	}
	
	
}
