//
//  SignUpFormModelValidator.swift
//  PhotoAppTests
//
//  Created by Macintosh on 5.03.2022.
//

import XCTest
@testable import PhotoApp
class SignUpFormModelValidatorTests: XCTestCase {
    var suv: SignUpFormModelValidator!
    override func setUp()  {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        suv = SignUpFormModelValidator()
    }

    override func tearDown()  {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        suv = nil
    }
//FirstName test methods;
    func test_signFormModelValidator_whenValidFirstNameProvided_shouldReturnTrue(){
        //Arrange
        //let suv = SignUpFormModelValidator()
        //Act
       let isFirstNameValid = suv.isFirstNameValid(firstName:"umut")
        //Assert
        XCTAssertTrue(isFirstNameValid,"firstname not valid, so isFirstNameValid is equel to false")//if first name not valid so this message will be shown
    }
    func test_signFormModelValidator_whenFirstNameIsTooShort_shouldReturnFalse(){
        //Arrange
        //let suv = SignUpFormModelValidator()
        //Act
        let isFirstNameValid = suv.isFirstNameValid(firstName: "u")
        //Assert
        XCTAssertFalse(isFirstNameValid,"isFirstNameValid should be false because shorter then \(SignUpConstants.firstNameMinLength) character firstname not valid")
    }
    
    func test_signFormModelValidator_whenFirstNameIsTooLong_shouldReturnFalse(){
        //Arrange
        //here is already written for this test method
        //Act
        let isFirstNameValid = suv.isFirstNameValid(firstName: "aaaaaaaaaaaaaaa")
        //Assert
        XCTAssertFalse(isFirstNameValid,"isFirstNameValid should be false because longer then \(SignUpConstants.firstNameMinLength) character firstname not valid")
        
    }
    //lastName test Methods;
    
    func test_signFormModelValidator_whenLastNameProvided_shouldReturnTrue(){
        //Arrange
        
        //Act
        let isLastNameValid = suv.isLastNameValid(lastName:"surmeli")
        //Assert
        XCTAssertTrue(isLastNameValid,"lastName not provided!")
    }
    
    func test_signFormModelValidator_whenLastNameIsTooShort_shouldReturnFalse(){
        //Arrange
        //Act
        let isLastNameValid = suv.isLastNameValid(lastName: "su")
        //Assert
        XCTAssertFalse(isLastNameValid,"isLastNameValid should be false because shorter then \(SignUpConstants.lastNameMinLength) character lastName not valid")
    }
    func test_signFormModelValidator_whenLastNameIsTooLong_shouldReturnFalse(){
        //Arrange
        //Act
        let isLastNameValid = suv.isLastNameValid(lastName:  "umutumutumutumut")
        //Assert
        XCTAssertFalse(isLastNameValid,"isLastNameValid should be false because longer then \(SignUpConstants.lastNameMaxLength) character lastName not valid")
    }
    func test_signFormModelValidator_whenPasswordProvided_shouldReturnTrue(){
        //Arrange
        
        //Act
        let isPasswordValid = suv.isPasswordValid(password:"aaaaaa")
        //Assert
        XCTAssertTrue(isPasswordValid,"isPasswordValid() function return false but expected true. Because password cant be empty")
    }
    func test_signFormModelValidator_whenPasswordIsTooShort_shouldReturnFalse(){
        //Arrange
        //Act
        let isPasswordValid = suv.isPasswordValid(password:"ss")
        //Assert
        XCTAssertFalse(isPasswordValid,"isPasswordValid() should be false because shorter then \(SignUpConstants.passwordMinLength) character lastName not valid")
    }
    func test_signFormModelValidator_whenPasswordIsTooLong_shouldReturnFalse(){
        //Arrange
        //Act
        let isPasswordValid = suv.isPasswordValid(password:  "umutumutumutumut")
        //Assert
        XCTAssertFalse(isPasswordValid,"isPasswordValid() should be false because longer then \(SignUpConstants.passwordMaxLength) character lastName not valid")
    }
    func test_signFormModelValidator_whenEqualPasswordProvided_shouldReturnTrue(){
        //Arrange
        
        //Act
        let doPasswordMatch = suv.doPasswordMatch(password:"12345678",repeadPassword:"12345678")
        //Assert
        XCTAssertTrue(doPasswordMatch,"doPasswordMatch() should return true for matching password,but it is returning false")
    }
    func test_signFormModelValidator_whenNotEqualPasswordProvided_shouldReturnFalse(){
        //Arrange
        
        //Act
        let doPasswordMatch = suv.doPasswordMatch(password:"12345678",repeadPassword:"1234567")
        //Assert
        XCTAssertFalse(doPasswordMatch,"doPasswordMatch() should return false for not matching password,but it is returning true")
    }
}

