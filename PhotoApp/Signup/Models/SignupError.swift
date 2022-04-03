//
//  SignupError.swift
//  PhotoApp
//
//  Created by Macintosh on 8.03.2022.
//

import Foundation
//conforming Error protocol
enum SignupError:LocalizedError, Equatable{
    case invalidresponseModel
    case invalidRequestUrlString
    case failedRequest(description: String)
    case invalidFirstName
    case invalidLastName
    case invalidPassword
    case invalidRepeatedPassword

    var errorDescription: String? {
        switch self {
        case .invalidresponseModel,.invalidRequestUrlString,.invalidFirstName,.invalidLastName,.invalidPassword,.invalidRepeatedPassword:
            return ""
        case .failedRequest(let description):
            return description
        }
    }
}
