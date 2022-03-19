//
//  SignUpPresenter.swift
//  PhotoApp
//
//  Created by Macintosh on 16.03.2022.
//

import Foundation

class SignUpPresenter {
    private var  formModelValidatior:SignUpModelValidatorProtocol
    init(formModelValidatior:SignUpModelValidatorProtocol){
        self.formModelValidatior = formModelValidatior

    }
    func processUserSignUp(formModel:SignupFormModel) {
        if !formModelValidatior.isFirstNameValid(firstName: formModel.firstName) {
            return
        }
        if !formModelValidatior.isLastNameValid(lastName: formModel.lastName) {
            return
        }
        if !formModelValidatior.isPasswordValid(password: formModel.password) {
            return
        }
        if !formModelValidatior.doPasswordMatch(password: formModel.password, repeadPassword:formModel.repeatPassword) {
            return
        }
    }
}
