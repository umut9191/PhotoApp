//
//  SignupWebService.swift
//  PhotoApp
//
//  Created by Macintosh on 8.03.2022.
//

import Foundation

class SignupWebService{
    private var _urlSession:URLSession
    private var _urlString:String
    //when ı do not want to use mock urlSession so we need to get instance of this class with real urlsession we will provide default value
    //urlSession:URLSession = .shared like this.
    init(urlString:String,urlSession:URLSession = .shared) {
        _urlString = urlString
        _urlSession = urlSession
    }
    func singup(withForm formModel:SignupFormRequestModel,completionHandler:@escaping(SignupResponseModel?,SignupErrors?)->Void ) {
        guard  let url = URL(string: _urlString) else{
            //TODO: create unit test  to test that a spesific error message is returned is url is nil
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        request.httpBody = try? JSONEncoder().encode(formModel)
        //if we send real Url session that would be the integration Test, we wil use mock version of urlSession for unit test
//       let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
//
//        }
        let dataTask = _urlSession.dataTask(with: request) { (data, response, error) in
             //TODO: Write a new unit test to handle and error here
            if let data = data, let signupResponseModel = try? JSONDecoder().decode(SignupResponseModel.self,from:data){
                completionHandler(signupResponseModel,nil)
            }else{
                //Done: Write a new unit test to handle and error here
                completionHandler(nil,SignupErrors.responseModelParsingError)
            }
         }
        dataTask.resume()
    }
}
