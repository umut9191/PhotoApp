//
//  SignUpModelValidatorProtocol.swift
//  PhotoApp
//
//  Created by Macintosh on 17.03.2022.
//

import Foundation
protocol SignUpModelValidatorProtocol{
    func isFirstNameValid(firstName:String) -> Bool
    func isLastNameValid(lastName:String) -> Bool
    func isPasswordValid(password:String) -> Bool
    //func isValidEmailFormat(email:String)-> Bool
    func doPasswordMatch(password:String,repeadPassword:String) -> Bool
}
