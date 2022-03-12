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
        let sut = SignupWebService(urlString:"http://appsdeveloperblog.com:8080/signup-mock-service/users")
        let signupFormRequestModel = SignupFormRequestModel(firstName:"Sergey",lastName:"Kargopolov",email:"test@test.com",password:"12345678")
        
        let expectation = self.expectation(description: "Signup Web Service Response Expectation")
        //Act
        sut.singup(withForm: signupFormRequestModel){ (signupResponseModel,error) in
            
            //Assert
            //"{\"Status\":\"ok\"}" --> this is what return from server side json when successed(this info cames from server side developer)
            XCTAssertEqual(signupResponseModel?.status, "ok")
            expectation.fulfill()//when expextation fulfilled thats means progress passed from here
        }
        self.wait(for: [expectation], timeout: 5)
        
    }
}
