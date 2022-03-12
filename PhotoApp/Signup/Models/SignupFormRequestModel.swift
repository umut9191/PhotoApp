//
//  SignupFormRequestModel.swift
//  PhotoApp
//
//  Created by Macintosh on 8.03.2022.
//

import Foundation
//This information will encoded to json 
struct SignupFormRequestModel:Encodable{
let firstName:String
let lastName:String
let email:String
let password:String
}
