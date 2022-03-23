//
//  ViewController.swift
//  PhotoApp
//
//  Created by Macintosh on 5.03.2022.
//

import UIKit

class SignupViewController: UIViewController {
 
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    var signUpPresenter:SignupPresenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if signUpPresenter == nil {
            let signUpModelValidator = SignUpFormModelValidator()
            let webService = SignupWebService(urlString: SignUpConstants.signupUrl)
            let delegate = self
            signUpPresenter = SignUpPresenter(formModelValidatior: signUpModelValidator, webservice: webService, delegate: delegate)
        }
    }


    @IBAction func signupButtonPrssed(_ sender: Any) {
        let signUpFormModel = SignupFormModel(firstName: firstNameTextField.text ?? "", lastName: lastNameTextField.text ?? "", email: emailTextField.text ?? "", password: passwordTextField.text ?? "", repeatPassword: repeatTextField.text ?? "")
        signUpPresenter?.processUserSignUp(formModel: signUpFormModel)
    }

}

extension SignupViewController:SignUpViewDelegateProtocol {
    func successfulSignup() {
        //TODO
    }
    
    func errorHandler(error: SignupError) {
        //TODO
    }
}
