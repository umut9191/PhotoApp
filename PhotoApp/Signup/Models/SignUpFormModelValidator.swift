//
//  SignUpFormModelValidator.swift
//  PhotoApp
//
//  Created by Macintosh on 5.03.2022.
//

import Foundation

class SignUpFormModelValidator:SignUpModelValidatorProtocol{
    func isFirstNameValid(firstName:String) -> Bool {
        var returnValue = true
//        if firstName.isEmpty {
//            returnValue = false
//        }
        if firstName.count < SignUpConstants.firstNameMinLength || firstName.count > SignUpConstants.firtNameMaxLength{// this can check if it is empty or shorter then 2 character
            returnValue = false
        }
        return returnValue
    }
    func isLastNameValid(lastName:String) -> Bool {
        var returnValue = true
    if lastName.count < SignUpConstants.lastNameMinLength || lastName.count > SignUpConstants.lastNameMaxLength {
            returnValue = false
        }
        return returnValue
    }
    func isPasswordValid(password:String) -> Bool{
        var returnValue = true
        
        if password.count < SignUpConstants.passwordMinLength || password.count > SignUpConstants.passwordMaxLength {
                returnValue = false
            }
        return returnValue
    }
    func doPasswordMatch(password:String,repeadPassword:String) -> Bool {
        if password == repeadPassword {
            return true
        }
        return false
    }
}
