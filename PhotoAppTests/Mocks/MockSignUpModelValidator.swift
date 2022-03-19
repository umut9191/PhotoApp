//
//  MockSignUpModelValidator.swift
//  PhotoAppTests
//
//  Created by Macintosh on 16.03.2022.
//

import Foundation
@testable import PhotoApp
class MockSignUpModelValidator:SignUpModelValidatorProtocol{
    var isFirstNameValidated:Bool = false
    var isLastNameValidated:Bool = false
    var isPasswordValidated:Bool = false
    var isPasswordMatch:Bool = false
    func isFirstNameValid(firstName: String) -> Bool {
        isFirstNameValidated = true
        return isFirstNameValidated;
    }
    
    func isLastNameValid(lastName: String) -> Bool {
        isLastNameValidated = true
        return isLastNameValidated;
    }
    
    func isPasswordValid(password: String) -> Bool {
        isPasswordValidated = true
        return isPasswordValidated;
    }
    
    func doPasswordMatch(password: String, repeadPassword: String) -> Bool {
        isPasswordMatch = true
        return isPasswordMatch;
    }
    
}
