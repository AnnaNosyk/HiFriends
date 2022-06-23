//
//  AuthErrors.swift
//  HiFriends
//
//  Created by Anna Nosyk on 23/06/2022.
//

import Foundation


enum AuthErrors {
    case notFilled
    case invalidEmail
    case passwordNotMatch
    case unknownError
    case serverError
}


extension AuthErrors: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .notFilled:
            return NSLocalizedString("Fill in all fields...", comment: "")
        case .invalidEmail:
            return NSLocalizedString("Invalid email form...", comment: "")
        case .passwordNotMatch:
            return NSLocalizedString("Fill in all fieldsPassword matches not found...", comment: "")
        case .unknownError:
            return NSLocalizedString("Unknown error...", comment: "")
        case .serverError:
            return NSLocalizedString("Server error:...", comment: "")
        }
    }
}
