//
//  MockSignupPresenter.swift
//  PhotoAppTests
//
//  Created by Macintosh on 21.03.2022.
//

import Foundation
@testable import PhotoApp
class MockSignupPresenter:SignupPresenterProtocol {
    required init(formModelValidatior: SignUpModelValidatorProtocol, webservice: SignUpWebServiceProtocol, delegate: SignUpViewDelegateProtocol) {
    }

    var processUserSignupCalled:Bool = false
    func processUserSignUp(formModel: SignupFormModel) {
        processUserSignupCalled = true
    }
}
