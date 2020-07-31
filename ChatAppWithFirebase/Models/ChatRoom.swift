//
//  ChatRoom.swift
//  ChatAppWithFirebase
//
//  Created by 近藤宏輝 on 2020/07/27.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import Foundation
import FirebaseFirestore

class ChatRoom {
    let latestMessageId: String?
    let members: [String]
    let createdAt: Timestamp
    
    var latestMessage: Message?
    var documentId: String?
    var partnerUser: User?
    
    init(dic: [String: Any]) {
        self.latestMessageId = dic["latestMessageId"] as? String ?? ""
        self.members = dic["members"] as? [String] ?? [String]()
        self.createdAt = dic["createdAt"] as? Timestamp ?? Timestamp()
    }
    
}
