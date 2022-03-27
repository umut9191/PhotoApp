//
//  TestingUITestFieldPropertiesTest.swift
//  PhotoAppTests
//
//  Created by Macintosh on 27.03.2022.
//

import XCTest
@testable import PhotoApp
class TestingUITestFieldPropertiesTest: XCTestCase {
    var sut:TextFieldUnitTestViewController!
    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "TextFieldUnitTestViewController") as? TextFieldUnitTestViewController
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_emailTextField_whenCreated_hasEmailAddressContentTypeSet() throws {
        let emailTextField = try XCTUnwrap(sut.textFieldEmail,"Email Address textFieldEmail is not connected")
        XCTAssertEqual(emailTextField.textContentType, UITextContentType.emailAddress,"email address text field does not has content type as emailAddress")
    }
    func test_emailTextField_whenCreated_hasEmailAddressKeyboardTypeSet() throws {
        let emailTextField = try XCTUnwrap(sut.textFieldEmail,"Email Address textFieldEmail is not connected")
        XCTAssertEqual(emailTextField.keyboardType, UIKeyboardType.emailAddress,"email address text field does not has keyboard type as email Address")
    }
    func test_passwordTextField_whenCreated_isSecureTextEntyField() throws {
        let passwordTextField = try XCTUnwrap(sut.textFieldPassword,"password passwordFieldEmail is not connected")
        XCTAssertTrue(passwordTextField.isSecureTextEntry,"password text field is not secure text entry")
    }
}
