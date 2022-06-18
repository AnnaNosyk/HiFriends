//
//  HiChat.swift
//  HiFriends
//
//  Created by Anna Nosyk on 18/06/2022.
//

import UIKit

// struct for chats
struct HiChat: Hashable, Decodable {
    var username: String
    var userImageString: String
    var lastMessage: String
    var id: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: HiChat, rhs: HiChat) -> Bool {
        return lhs.id == rhs.id
    }
}

