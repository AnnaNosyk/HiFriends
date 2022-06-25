//
//  UserError.swift
//  HiFriends
//
//  Created by Anna Nosyk on 24/06/2022.
//

import Foundation

enum UserError {
    case notFilled
    case photoNotExist
    case cannotUnwrapToMUser
    case cannotGetUserInfo
}


extension UserError: LocalizedError {
    var errorDescription: String? {
    switch self {
        
    case .notFilled:
        return NSLocalizedString("Fill in all fields...", comment: "")
    case .photoNotExist:
        return NSLocalizedString("No user photo...", comment: "")
    case .cannotUnwrapToMUser:
        return NSLocalizedString("Cant to download info about User from Firebase", comment: "")
    case .cannotGetUserInfo:
        return NSLocalizedString("Cant to convert Users from User", comment: "")
    }
}
}
