//
//  SignupFormModelValidator.swift
//  PhotoApp
//
//  Created by Macintosh on 27.03.2022.
//

import Foundation
//this independent class for demostrations just testing throws error function
class SignupFormModelValidator{
    private let invalidCharacters = CharacterSet(charactersIn: "${}..,\'<>")
    
    func isFirstNameValid(_ fistName: String) throws -> Bool{
        var returnValue = true
        //check for illegal character;
        if fistName.rangeOfCharacter(from: invalidCharacters) != nil {
            throw SignUpErrorEnum.illagalCharacterFound
        }
        //check firstName;
        
        if fistName.count < 2 || fistName.count > 10  {
            returnValue = false
        }
     return returnValue
    }
}
