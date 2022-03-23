//
//  SignUpWebServiceProtocol.swift
//  PhotoApp
//
//  Created by Macintosh on 19.03.2022.
//

import Foundation

protocol SignUpWebServiceProtocol{
    
    func singup(withForm formModel:SignupFormRequestModel,completionHandler:@escaping(useCompletionHandlerWithThisName))

}
