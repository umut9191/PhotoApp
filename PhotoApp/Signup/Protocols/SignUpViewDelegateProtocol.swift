//
//  SignUpViewDelegateProtocol.swift
//  PhotoApp
//
//  Created by Macintosh on 19.03.2022.
//

import Foundation

protocol SignUpViewDelegateProtocol:AnyObject{
    func successfulSignup()
    func errorHandler(error:SignupError)
}
