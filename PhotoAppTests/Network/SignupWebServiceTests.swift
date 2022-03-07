//
//  SignupWebServiceTests.swift
//  PhotoAppTests
//
//  Created by Macintosh on 8.03.2022.
//

import XCTest
@testable import PhotoApp
class SignupWebServiceTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_signupWebService_whenGivenSuccessfullResponse_ReturnSuccess() {
        //Arrange
        let sut = SignupWebService()
        let signupFormRequestModel = SignupFormRequestModel(firstName:"umut",lastName:"sürmeli",email:"umut@surmeli.com",password:"1234")
        //Act
        sut.singup(withForm: signupFormRequestModel){ (signupResponseModel,error) in
            
            //Assert
        }
        
    }
}
