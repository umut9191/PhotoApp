//
//  MockSignupViewDelegate.swift
//  PhotoAppTests
//
//  Created by Macintosh on 19.03.2022.
//

import Foundation
import XCTest
@testable import PhotoApp
class MockSignupViewDelegate:SignUpViewDelegateProtocol{
    var expectation : XCTestExpectation?
    var successfulSignupCounter:Int = 0
    var signupError: SignupError?
    var errorHandlerCounter = 0


    func successfulSignup() {
        successfulSignupCounter += 1
        expectation?.fulfill()
    }
    
    func errorHandler(error: SignupError) {
        signupError = error
        errorHandlerCounter += 1
        expectation?.fulfill()
    }
    
}
