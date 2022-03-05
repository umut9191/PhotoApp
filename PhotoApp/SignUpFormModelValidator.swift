//
//  SignUpFormModelValidator.swift
//  PhotoApp
//
//  Created by Macintosh on 5.03.2022.
//

import Foundation

class SignUpFormModelValidator{
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
}
