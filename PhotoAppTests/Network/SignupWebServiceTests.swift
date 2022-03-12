//
//  SignupWebServiceTests.swift
//  PhotoAppTests
//
//  Created by Macintosh on 8.03.2022.
//

import XCTest
@testable import PhotoApp
class SignupWebServiceTests: XCTestCase {

    var sut:SignupWebService?
    var signupFormRequestModel:SignupFormRequestModel?
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
         sut = SignupWebService(urlString:SignUpConstants.signupUrl,urlSession: urlSession)
        signupFormRequestModel = SignupFormRequestModel(firstName:"umut",lastName:"sürmeli",email:"umut@gmail.com",password:"1")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        signupFormRequestModel = nil
        MockURLProtocol.stubResponseData = nil
    }
//We will send http request with pre defined response data for not using integration test.
    //we will create mock version of url protocol
    func test_signupWebService_whenGivenSuccessfullResponse_ReturnSuccess() {
        //Arrange
        //for mock version;
        //ephemeral is not persistance, it is short life
//        let config = URLSessionConfiguration.ephemeral
//        config.protocolClasses = [MockURLProtocol.self]
//        let urlSession = URLSession(configuration: config)
        //setting test data to url protocol. This is the test data would be return back as a response to http request
        let jsonString = "{\"status\":\"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        //and lastly we gave SignupWebService init method urlSession. So thats it.
        //for mock version end here.
        //,urlSession: urlSession
        
//        let sut = SignupWebService(urlString:SignUpConstants.signupUrl,urlSession: urlSession)
//        let signupFormRequestModel = SignupFormRequestModel(firstName:"umut",lastName:"sürmeli",email:"umut@gmail.com",password:"1")
        
        let expectation = self.expectation(description: "Signup Web Service Response Expectation")
        //Act
        sut?.singup(withForm: signupFormRequestModel!){ (signupResponseModel,error) in
            
            //Assert
            //"{\"Status\":\"ok\"}" --> this is what return from server side json when successed(this info cames from server side developer)
            XCTAssertEqual(signupResponseModel?.status, "ok")
            expectation.fulfill()//when expectation fulfilled thats means progress passed from here
        }
        self.wait(for: [expectation], timeout: 5)
        
    }
    //For error
    func test_signupWebService_whenReceivedDifferentJSONResponse_errorTookPlace() {
        //Arrange
        //for mock version;
        //ephemeral is not persistance, it is short life
//        let config = URLSessionConfiguration.ephemeral
//        config.protocolClasses = [MockURLProtocol.self]
//        let urlSession = URLSession(configuration: config)
        //setting test data to url protocol. This is the test data would be return back as a response to http request
        let jsonString = "{\"xstatus\":\"ok\"}"//"{\"path\":\"/users\",\"error\":\"Internal Server Error\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        //and lastly we gave SignupWebService init method urlSession. So thats it.
        //for mock version end here.
        //,urlSession: urlSession
        
//        let sut = SignupWebService(urlString:SignUpConstants.signupUrl,urlSession: urlSession)
//        let signupFormRequestModel = SignupFormRequestModel(firstName:"umut",lastName:"sürmeli",email:"umut@gmail.com",password:"1")
        
        let expectation = self.expectation(description: "signup() method expectation for a response that contain a different json structure")
        //Act
        sut?.singup(withForm: signupFormRequestModel!){ (signupResponseModel,error) in
            
            //Assert
            //"{\"Status\":\"ok\"}" --> this is what return from server side json when successed(this info cames from server side developer)
            XCTAssertNil(signupResponseModel,"the response model for a request containing unknowing JSON response, should have been nil")
            XCTAssertEqual(error, SignupError.invalidresponseModel,"The signup() method didnot returned expected error")
            expectation.fulfill()//when expectation fulfilled thats means progress passed from here
        }
        self.wait(for: [expectation], timeout: 5)
    }
    func test_SignupWebService_whenEmptyURLStringProvided() {
        //Arrange
        sut = SignupWebService(urlString: "")
        let expectation = self.expectation(description: "An empty request url string expectation ")
        //Act
        sut?.singup(withForm: signupFormRequestModel!, completionHandler: { (signupResponseModel, erorr) in
            
            //Assert
            XCTAssertEqual(erorr, SignupError.invalidRequestUrlString,"signup() method returned different error from invalidRequestUrlStringError that expected")
            XCTAssertNil(signupResponseModel,"signup() method returned not nil response but expected is being nil")
            expectation.fulfill()
        })
        self.wait(for: [expectation], timeout: 5)
        
    }
}
