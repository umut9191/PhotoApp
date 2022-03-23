//
//  SignupPresenterTest.swift
//  PhotoAppTests
//
//  Created by Macintosh on 16.03.2022.
//

import XCTest
@testable import PhotoApp
class SignupPresenterTest: XCTestCase {
    var signupFormModel:SignupFormModel!
    var mockSignUpModelValidator:MockSignUpModelValidator!
    var mockSignupWebService:MockSignUpWebService!
    var mockSignupViewDelegate:MockSignupViewDelegate!
    var sut:SignUpPresenter!
    override func setUp()  {
        // Put setup code here. This method is called before the invocation of each test method in the class.
         signupFormModel = SignupFormModel(firstName:"umut",
                                              lastName:"surmeli",
                                              email:"umutsurmeli91@gmail.com",
                                              password:"1",repeatPassword:"1")
         mockSignUpModelValidator = MockSignUpModelValidator()
         mockSignupWebService = MockSignUpWebService()
         mockSignupViewDelegate = MockSignupViewDelegate()
         sut = SignUpPresenter(formModelValidatior:mockSignUpModelValidator,webservice: mockSignupWebService,delegate:mockSignupViewDelegate)
    }

    override func tearDown()  {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
         signupFormModel = nil
         mockSignUpModelValidator = nil
         mockSignupWebService = nil
         mockSignupViewDelegate = nil
         sut = nil
    }
    
    func test_signupPresenter_validateInformationProvided_willValidateEachProperty() {
        //Arrange
   //moved to singUp method
        //Act
        sut.processUserSignUp(formModel:signupFormModel)
        //Assert
        XCTAssertTrue(mockSignUpModelValidator.isFirstNameValidated,"First Name was not validated")
        XCTAssertTrue(mockSignUpModelValidator.isLastNameValidated,"Last Name was not validated")
        XCTAssertTrue(mockSignUpModelValidator.isPasswordValidated,"Password was not validated")
        XCTAssertTrue(mockSignUpModelValidator.isPasswordMatch,"Password was not match with repeated password")
        //XCTAssertTrue(mockSignUpModelValidator.) email i eklemedim kalsın şimdilik

    }
    
    func test_signupPresenter_whenGivenValidFormModel_shouldCallSignupMethod(){
        //Arrange
        //moved to singUp method
        //Act
        sut.processUserSignUp(formModel:signupFormModel)
        
        //Assert
        XCTAssertTrue(mockSignupWebService.isSignupMethodCalled,"signup method was not called in the singupWebService class")
    }
    func test_signupPresenter_whenSignupOperationSuccessful_CallsSuccessOnViewDelegate(){
        //Arrange
        let myExpectation = self.expectation(description: "Expected the successfulSignup() method to be called")
        mockSignupViewDelegate.expectation = myExpectation
        //Act
        sut.processUserSignUp(formModel: signupFormModel)
        self.wait(for: [myExpectation], timeout: 5)
        //Assert
        XCTAssertEqual(mockSignupViewDelegate.successfulSignupCounter, 1,"successfulSignup() method was called more than one time")
    }
    func testSignupPresenter_WhenSignupOperationFails_ShouldCallErrorOnDelegate() {
           // Arrange
           let errorHandlerExpectation = expectation(description: "Expected the errorHandler() method to be called")
           mockSignupViewDelegate.expectation = errorHandlerExpectation
           mockSignupWebService.shouldReturnError = true
           
           // Act
           sut.processUserSignUp(formModel: signupFormModel)
           self.wait(for: [errorHandlerExpectation], timeout: 5)

           // Assert
           XCTAssertEqual(mockSignupViewDelegate.successfulSignupCounter, 0)
           XCTAssertEqual(mockSignupViewDelegate.errorHandlerCounter, 1)
           XCTAssertNotNil(mockSignupViewDelegate.signupError)
       }

}
