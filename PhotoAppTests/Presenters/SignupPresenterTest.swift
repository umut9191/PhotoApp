//
//  SignupPresenterTest.swift
//  PhotoAppTests
//
//  Created by Macintosh on 16.03.2022.
//

import XCTest
@testable import PhotoApp
class SignupPresenterTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_signupPresenter_validateInformationProvided_willValidateEachProperty() {
        //Arrange
        let signupFormModel = SignupFormModel(firstName:"umut",
                                              lastName:"surmeli",
                                              email:"umutsurmeli91@gmail.com",
                                              password:"1",repeatPassword:"1")
        let mockSignUpModelValidator = MockSignUpModelValidator()
        let sut = SignUpPresenter(formModelValidatior:mockSignUpModelValidator)
        //Act
        sut.processUserSignUp(formModel:signupFormModel)
        //Assert
        XCTAssertTrue(mockSignUpModelValidator.isFirstNameValidated,"First Name was not validated")
        XCTAssertTrue(mockSignUpModelValidator.isLastNameValidated,"Last Name was not validated")
        XCTAssertTrue(mockSignUpModelValidator.isPasswordValidated,"Password was not validated")
        XCTAssertTrue(mockSignUpModelValidator.isPasswordMatch,"Password was not match with repeated password")
        //XCTAssertTrue(mockSignUpModelValidator.) email i eklemedim kalsın şimdilik

    }

}
