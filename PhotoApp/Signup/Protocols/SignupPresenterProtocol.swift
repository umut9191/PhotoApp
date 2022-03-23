//
//  SignupPresenterProtocol.swift
//  PhotoApp
//
//  Created by Macintosh on 21.03.2022.
//

import Foundation

protocol SignupPresenterProtocol:AnyObject{
    init(formModelValidatior:SignUpModelValidatorProtocol,webservice:SignUpWebServiceProtocol,delegate:SignUpViewDelegateProtocol)
    func processUserSignUp(formModel:SignupFormModel)
}
