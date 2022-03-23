//
//  MockSignUpWebService.swift
//  PhotoAppTests
//
//  Created by Macintosh on 19.03.2022.
//

import Foundation
@testable import PhotoApp
class MockSignUpWebService:SignUpWebServiceProtocol{
    var isSignupMethodCalled:Bool = false
    var shouldReturnError: Bool = false

    func singup(withForm formModel: SignupFormRequestModel, completionHandler: @escaping (useCompletionHandlerWithThisName)) {
         isSignupMethodCalled = true
        if shouldReturnError {
            completionHandler(nil, SignupError.failedRequest(description: "Signup request was not successful"))
        }else{
            let responseModel = SignupResponseModel(status: "ok")
            completionHandler(responseModel,nil)
        }
    }
}
