//
//  SignupViewControllerTest.swift
//  PhotoAppTests
//
//  Created by Macintosh on 19.03.2022.
//

import XCTest
@testable import PhotoApp
class SignupViewControllerTests: XCTestCase {

    var storyboard:UIStoryboard!
    var sut:SignupViewController!
  
    override func setUp() {
        
        //for accessing to ViewController we should first access to storyboard that connected that ViewContoller
         storyboard = UIStoryboard(name: "Main", bundle: nil)
         sut = storyboard.instantiateViewController(identifier: "identifierSignupVC") as? SignupViewController
        
        //Act
        sut?.loadViewIfNeeded()
    }

    override func tearDown() {
        storyboard = nil
        sut = nil
    }

    func test_signupViewController_whenCreated_hasRequiredTextFieldsEmpty() throws {
        //Arrange
        //for accessing to ViewController we should first access to storyboard that connected that ViewContoller
      
        //Act
    
        //Assert
        //if storyboard outlet connection disconnected then here we could not get very clear message so we can make that message clear wiht XCTUnwrap assert function like this;
        
        let firstNameTextField = try XCTUnwrap(sut?.firstNameTextField,"First Name Text field is not connected to IBOUTLET")
        let lastNameTextField = try XCTUnwrap(sut?.lastNameTextField,"Last Name Text field is not connected to IBOUTLET")
        let emailTextField = try XCTUnwrap(sut?.emailTextField,"Email Text field is not connected to IBOUTLET")
        let passwordTextField = try XCTUnwrap(sut?.passwordTextField,"Password Text field is not connected to IBOUTLET")
        let repeatTextField = try XCTUnwrap(sut?.repeatTextField,"Repeat Password Text field is not connected to IBOUTLET")

        
        XCTAssertEqual(firstNameTextField.text, "","First Name text field was not empty when the viewController initially loaded")
        XCTAssertEqual(lastNameTextField.text,"", "Last Name text field was not empty when the viewController initially loaded")
        XCTAssertEqual(emailTextField.text, "","Email text field was not empty when the viewController initially loaded")
        XCTAssertEqual(passwordTextField.text,"", "Password text field was not empty when the viewController initially loaded")
        XCTAssertEqual(repeatTextField.text,"", "Repeated password text field was not empty when the viewController initially loaded")//repeat password

    }
    
    func testViewController_whenCreated_hasSignupButtonAndAction() throws{
        //Arrange
        let singupButton:UIButton = try XCTUnwrap(sut.signupButton,"signup button does not has referance IBOutlet")
        // Act
        let signupButtonActions = try XCTUnwrap(singupButton.actions(forTarget: sut, forControlEvent: .touchUpInside),"sign up button does not have any actions assigned to it")
        // Assert
        XCTAssertEqual(signupButtonActions.count, 1)
        XCTAssertEqual(signupButtonActions.first,"signupButtonPrssed:","There is no action with a name signupButtonPrssed assigned to Sign Up Button")
    }
    func test_signupViewController_whenSignupButtonPressed_invokesSignupProcess(){
        //Arrange
        let mockSignUpModelValidator = MockSignUpModelValidator()
        let webService = MockSignUpWebService()
        let delegate = MockSignupViewDelegate()
        let mockSignupPresenter = MockSignupPresenter(formModelValidatior: mockSignUpModelValidator, webservice: webService, delegate: delegate)

        sut.signUpPresenter = mockSignupPresenter
        //Act
        sut.signupButton.sendActions(for: .touchUpInside) //button tapped
        //Assert
        XCTAssertTrue(mockSignupPresenter.processUserSignupCalled,"when the button taped in signupViewController class, on SignUpPresenter processUserSignUp method not called")
    }

}
