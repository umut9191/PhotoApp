//
//  SignUpFormModelValidator.swift
//  PhotoAppTests
//
//  Created by Macintosh on 5.03.2022.
//

import XCTest
@testable import PhotoApp
class SignUpFormModelValidatorTests: XCTestCase {

    override func setUp()  {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown()  {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_signFormModelValidator_whenValidFirstNameProvided_shouldReturnTrue(){
        //Arrange
        let suv = SignUpFormModelValidator()
        //Act
       let isFirstNameValid = suv.isFirstNameValid(firstName:"umut")
        //Assert
        XCTAssertTrue(isFirstNameValid,"firstname not valid, so isFirstNameValid is equel to false")//if first name not valid so this message will be shown
    }
    func test_signFormModelValidator_whenFirstNameIsTooShort_shouldReturnFalse(){
        //Arrange
        let suv = SignUpFormModelValidator()
        //Act
        let isFirstNameValid = suv.isFirstNameValid(firstName: "u")
        
        //Assert
        XCTAssertFalse(isFirstNameValid,"isFirstNameValid should be false because under two character firstname not valid")
    }

}
