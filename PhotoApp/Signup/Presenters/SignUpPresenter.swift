//
//  SignUpPresenter.swift
//  PhotoApp
//
//  Created by Macintosh on 16.03.2022.
//

import Foundation

class SignUpPresenter:SignupPresenterProtocol {
    private var  formModelValidatior:SignUpModelValidatorProtocol
    private var webservice:SignUpWebServiceProtocol
    private weak var delegate:SignUpViewDelegateProtocol?
    required init(formModelValidatior:SignUpModelValidatorProtocol,webservice:SignUpWebServiceProtocol,delegate:SignUpViewDelegateProtocol){
        self.formModelValidatior = formModelValidatior
        self.webservice = webservice
        self.delegate = delegate

    }
    func processUserSignUp(formModel:SignupFormModel) {
        if !formModelValidatior.isFirstNameValid(firstName: formModel.firstName) {
            delegate?.errorHandler(error: SignupError.invalidFirstName)
            return
        }
        if !formModelValidatior.isLastNameValid(lastName: formModel.lastName) {
            delegate?.errorHandler(error: SignupError.invalidLastName)
            return
        }
        if !formModelValidatior.isPasswordValid(password: formModel.password) {
            delegate?.errorHandler(error: SignupError.invalidPassword)
            return
        }
        if !formModelValidatior.doPasswordMatch(password: formModel.password, repeadPassword:formModel.repeatPassword) {
            delegate?.errorHandler(error: SignupError.invalidRepeatedPassword)
            return
        }
        let requestModel = SignupFormRequestModel(firstName: formModel.firstName, lastName: formModel.lastName, email: formModel.email, password: formModel.password)
        
        webservice.singup(withForm: requestModel) {[weak self] (responseModel, error) in
            if let  error = error {
                self?.delegate?.errorHandler(error: error)
                return
            }
            
            if let _ = responseModel {
                self?.delegate?.successfulSignup()
                return

            }
            
        }

    }
}
