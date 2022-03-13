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
    
    var errorDescription: String? {
        switch self {
        case .invalidresponseModel,.invalidRequestUrlString:
            return ""
        case .failedRequest(let description):
            return description
        }
    }
}
