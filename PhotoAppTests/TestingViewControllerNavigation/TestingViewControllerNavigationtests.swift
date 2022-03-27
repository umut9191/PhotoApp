//
//  TestingViewControllerNavigationtests.swift
//  PhotoAppTests
//
//  Created by Macintosh on 27.03.2022.
//

import XCTest
@testable import PhotoApp

class TestingViewControllerNavigationtests: XCTestCase {

    var sut: SignupViewController!
    var navigationController: UINavigationController!
    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "identifierSignupVC") as? SignupViewController
        sut.loadViewIfNeeded()
        
        navigationController = UINavigationController(rootViewController: sut)
    }

    override func tearDownWithError() throws {
         sut = nil
        navigationController = nil
    }
    func test_nextViewButton_whenTapped_secondViewControllerIsPushed() {
        //expectation;
        let predicate = NSPredicate { input, _ in
            return (input as? UINavigationController)?.topViewController is TextFieldUnitTestViewController
        }
        expectation(for: predicate, evaluatedWith: navigationController)
        //expectation ends here. this is for giving time fornavigation happening
        sut.nextVCButton.sendActions(for: .touchUpInside)
        waitForExpectations(timeout: 3)
        //this below codes not needed anymore because codes before those codes is doing same work.
//        guard let _ = navigationController.topViewController as? TextFieldUnitTestViewController else {
//            XCTFail()
//            return
//        }
        
    }
    func test_nextViewButton_whenTapped_secondViewControllerIsPushed_v2() {
        sut.nextVCButton.sendActions(for: .touchUpInside)
        
        //waiting for navigation between views can happen
        RunLoop.current.run(until: Date())
        guard let _ = navigationController.topViewController as? TextFieldUnitTestViewController else {
            XCTFail()
            return
        }
    }
    func test_nextViewButton_whenTapped_secondViewControllerIsPushed_v3() {
       let spyNavigationController = SpyNavigationController(rootViewController: sut)
       
        sut.nextVCButton.sendActions(for: .touchUpInside)
        guard let _ = spyNavigationController.pushedViewController as? TextFieldUnitTestViewController else {
            XCTFail()
            return
        }
    }
}
