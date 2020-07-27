//
//  User.swift
//  ChatAppWithFirebase
//
//  Created by 近藤宏輝 on 2020/07/25.
//  Copyright © 2020 Hiroki. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore


class User {
    
    let email: String
    let username: String
    let createdAt: Timestamp
    let profileImageUrl: String
    
    var uid: String?
    
    init(dic: [String: Any]) {
        self.email = dic["email"] as? String ?? ""
        self.username = dic["username"] as? String ?? ""
        self.createdAt = dic["cratedAt"] as? Timestamp ?? Timestamp()
        self.profileImageUrl = dic["profileImageUrl"] as? String ?? ""
    }
}
