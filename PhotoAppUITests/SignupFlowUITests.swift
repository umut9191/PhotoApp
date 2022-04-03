//
//  PhotoAppUITests.swift
//  PhotoAppUITests
//
//  Created by Macintosh on 29.03.2022.
//

import XCTest

class SignupFlowUITests: XCTestCase {
    private var app: XCUIApplication!
    var firstName: XCUIElement!
    var lastName: XCUIElement!
    var eMail: XCUIElement!
    var password: XCUIElement!
    var repeatPassword: XCUIElement!
    var signUpButton: XCUIElement!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        app = XCUIApplication()
        app.launch()
        
         firstName =  app.textFields["textFieldFirstName"]
         lastName =  app.textFields["textFieldLastName"]
         eMail = app.textFields["textFieldEmail"]
         password = app.secureTextFields["textFieldPassword"]
         repeatPassword =  app.secureTextFields["textFieldRepeatPassword"]
         signUpButton =  app.buttons["buttonSignup"]
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        app = nil
        firstName = nil
        lastName =  nil
        eMail = nil
        password = nil
        repeatPassword = nil
        signUpButton = nil
        try super.tearDownWithError()
    }

    func test_signUpUIForTestViewController_whenViewLoaded_requiredUIElementsAreEnabled() throws {
        // UI tests must launch the application that they test.
      
        //recording automation without iboutlet tools selected.
//        let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
//        element.children(matching: .textField).element(boundBy: 2).tap()
//        element.children(matching: .textField).element(boundBy: 3).tap()
//        element.children(matching: .textField).element(boundBy: 4).tap()
//        app/*@START_MENU_TOKEN@*/.staticTexts["Sign Up"]/*[[".buttons[\"Sign Up\"].staticTexts[\"Sign Up\"]",".staticTexts[\"Sign Up\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        //
        
        // here are recording after giving place holders to text fields;
//        app.textFields["First Name"].tap()
//        app.textFields["Last Name"].tap()
//        app.textFields["E - Mail"].tap()
//        app.textFields["Password"].tap()
//        app.textFields["Repeat Password"].tap()
//        app/*@START_MENU_TOKEN@*/.staticTexts["Sign Up"]/*[[".buttons[\"Sign Up\"].staticTexts[\"Sign Up\"]",".staticTexts[\"Sign Up\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
                
//            let firstName =  app.textFields["First Name"]
//            let lastName =  app.textFields["Last Name"]
//            let eMail = app.textFields["E - Mail"]
//            let password = app.secureTextFields["Password"]
//            let repeatPassword =  app.secureTextFields["Repeat Password"]
//            let signUpButton =  app/*@START_MENU_TOKEN@*/.staticTexts["Sign Up"]/*[[".buttons[\"Sign Up\"].staticTexts[\"Sign Up\"]",".staticTexts[\"Sign Up\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
//        //now we will check if tools enables for user interaction;
//        XCTAssertTrue(firstName.isEnabled,"firstName textField is not enable for user interaction")
//        XCTAssertTrue(lastName.isEnabled,"lastName textField is not enable for user interaction")
//        XCTAssertTrue(eMail.isEnabled,"email textField is not enable for user interaction")
//        XCTAssertTrue(password.isEnabled,"password textField is not enable for user interaction")
//        XCTAssertTrue(repeatPassword.isEnabled,"repeat password textField is not enable for user interaction")
//        XCTAssertTrue(signUpButton.isEnabled,"signup button textField is not enable for user interaction")
     
        
        
        //After adding accessiblity identifier how to reach to uı elemenets ;
        
//        let firstName =  app.textFields["textFieldFirstName"]
//        let lastName =  app.textFields["textFieldLastName"]
//        let eMail = app.textFields["textFieldEmail"]
//        let password = app.secureTextFields["textFieldPassword"]
//        let repeatPassword =  app.secureTextFields["textFieldRepeatPassword"]
//        let signUpButton =  app.buttons["buttonSignup"]
    //now we will check if tools enables for user interaction;
    XCTAssertTrue(firstName.isEnabled,"firstName textField is not enable for user interaction")
    XCTAssertTrue(lastName.isEnabled,"lastName textField is not enable for user interaction")
    XCTAssertTrue(eMail.isEnabled,"email textField is not enable for user interaction")
    XCTAssertTrue(password.isEnabled,"password textField is not enable for user interaction")
    XCTAssertTrue(repeatPassword.isEnabled,"repeat password textField is not enable for user interaction")
    XCTAssertTrue(signUpButton.isEnabled,"signup button textField is not enable for user interaction")
        
        //Another way to access uı element is on console writtin 'po app' print out when debug mod break point trigered on test method
    }
    
    func test_viewController_whenInvalidFormSubmitted_presentErrorAlertDialog(){
        //Arrange
     
        //let firstName =  app.textFields["textFieldFirstName"]
        firstName.tap()
        firstName.typeText("U")
        // let lastName =  app.textFields["textFieldLastName"]
        lastName.tap()
        lastName.typeText("S")
        // let eMail = app.textFields["textFieldEmail"]
        eMail.tap()
        eMail.typeText("@")
        // let password = app.secureTextFields["textFieldPassword"]
        password.tap()
        password.typeText("123456")
        // let repeatPassword =  app.secureTextFields["textFieldRepeatPassword"]
        repeatPassword.tap()
        repeatPassword.typeText("123")
        //let signUpButton =  app.buttons["buttonSignup"]
        //Act
        signUpButton.tap()
        
        //Assert
        
        //check if alert dialog is exist;
        XCTAssertTrue(app.alerts["errorAlertDialog"].waitForExistence(timeout: 1),"an error alert dialog was not presented when invalid sign up form was submitted")
    }
    func test_viewController_whenValidFormSubmitted_presentSuccesAlertDialog(){
        //Arrange
     
        //let firstName =  app.textFields["textFieldFirstName"]
        firstName.tap()
        firstName.typeText("umut")
        // let lastName =  app.textFields["textFieldLastName"]
        lastName.tap()
        lastName.typeText("sürmeli")
        // let eMail = app.textFields["textFieldEmail"]
        eMail.tap()
        eMail.typeText("test@test.com")
        // let password = app.secureTextFields["textFieldPassword"]
        password.tap()
        password.typeText("123456")
        // let repeatPassword =  app.secureTextFields["textFieldRepeatPassword"]
        repeatPassword.tap()
        repeatPassword.typeText("123456")
        //let signUpButton =  app.buttons["buttonSignup"]
        //Act
        signUpButton.tap()
        
        
    
        
        //Taking screen Shot example(a part of screen a text field);
        //first ve closed auto screen shot taker from Edit Sheme > test > options panel to see taked custom screen shot then;
        var emailTextFieldScreenShot = eMail.screenshot()
        // attach screen shot on reports;
        let emailTextFieldAttachment = XCTAttachment(screenshot: emailTextFieldScreenShot)
        //give name to screen shot to find it easily;
        emailTextFieldAttachment.name = "Screen Shot of Email UITextField"
        emailTextFieldAttachment.lifetime = .keepAlways
        add(emailTextFieldAttachment)
        
        
        //Screen Shot of entire screen;
        
        //let currentAppWindowScreenShot = app.screenshot() //similar this code is;
        let currentAppWindowScreenShot = XCUIScreen.main.screenshot()
        let currentAppWindowAttachment = XCTAttachment(screenshot: currentAppWindowScreenShot)
        currentAppWindowAttachment.name = "Sign Up Page Screenshot xx"
        currentAppWindowAttachment.lifetime = .keepAlways
        add(currentAppWindowAttachment)
        
        
        
        
        
        
        //Assert
        
        
        //check if alert dialog is exist;
        XCTAssertTrue(app.alerts["successAlertDialog"].waitForExistence(timeout: 3),"an success alert dialog was not presented when valid sign up form was submitted")
    }
    func test_justShowOtherViewConroller(){
        //Check if other views after click a button is shown or not;
        app.buttons["buttonNext"].tap()
        XCTAssertTrue(app.otherElements["nextView"].waitForExistence(timeout: 1),"when next button tapped, nextView does not shown")
    }
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
