//
//  SignupFormModelValidatorThrownErrorFunctionTest.swift
//  PhotoAppTests
//
//  Created by Macintosh on 27.03.2022.
//

import XCTest
@testable import PhotoApp

class SignupFormModelValidatorThrownErrorFunctionTest: XCTestCase {

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }

    func test_firtNameValidation_whenInvalidCharactersProvided_throwsAndError() {
        // arrange
        let sut = SignupFormModelValidator()
        //Act and Assert
        XCTAssertThrowsError(try sut.isFirstNameValid("umut$"), "The isFirstNameValid() method should have thrown an error is firstName contains illegal character") { (errorThrown) in
            XCTAssertEqual(errorThrown as? SignUpErrorEnum, SignUpErrorEnum.illagalCharacterFound)
        }
    }
    func test_firtNameValidation_whenInvalidCharactersProvided_notThrowsError() {
        // arrange
        let sut = SignupFormModelValidator()
        //Act and Assert
        XCTAssertNoThrow(try sut.isFirstNameValid("umut"),"The isFirstNameValid() method should not have thrown an error when firstName not contains illegal character")
    }
    //this is for another way for testing thrown error function with do-try
    func test_firtNameValidation_whenInvalidCharactersProvided_throwsAndErrorTwo() {
        // arrange
        let sut = SignupFormModelValidator()
        //Act and Assert
        do {
         let _ = try sut.isFirstNameValid("umut$")
            //if not thrown an error then make fail assert
            XCTFail("The isFirstNameValid() method  have thrown an error is firstName contains illegal character")
        } catch SignUpErrorEnum.illagalCharacterFound  {
           //if we are here then test succesfully passed
            return
        }
        catch{
            XCTFail("The isFirstNameValid() method  have thrown an error different from illagalCharacterFound error")
            return
        }
    }
    func test_firtNameValidation_whenInvalidCharactersProvided_notThrowsErrorTwo() {
        // arrange
        let sut = SignupFormModelValidator()
        //Act and Assert
        
        do {
           let _ = try sut.isFirstNameValid("umut")
        } catch {
            XCTFail("The isFirstNameValid() method should not have thrown error")
        }
    }
}
