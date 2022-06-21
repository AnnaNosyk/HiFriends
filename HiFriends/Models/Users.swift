//
//  Users.swift
//  HiFriends
//
//  Created by Anna Nosyk on 20/06/2022.
//

import UIKit


struct Users: Hashable, Decodable {
    var username: String
    var avatarStringURL: String
    var id: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Users, rhs: Users) -> Bool {
        return lhs.id == rhs.id
    }
    
    // for filtering array of users
    
    func contains(filter: String?)-> Bool {
        guard let filter = filter else {return true}
        if filter.isEmpty {return true}
        let lowercasedFilter = filter.lowercased()
        return username.lowercased().contains(lowercasedFilter)
    }
}
