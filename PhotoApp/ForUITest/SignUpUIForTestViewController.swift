//
//  SignUpUIForTestViewController.swift
//  PhotoApp
//
//  Created by Macintosh on 30.03.2022.
//

import UIKit

class SignUpUIForTestViewController: UIViewController {

    @IBOutlet weak var nextVCButton: UIButton!
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

    @IBAction func nextVCButtonPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let secondVC = storyboard.instantiateViewController(withIdentifier: "TextFieldUnitTestViewController") as? TextFieldUnitTestViewController else{
            return
        }
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
}

extension SignUpUIForTestViewController:SignUpViewDelegateProtocol {
    func successfulSignup() {
        let alert = UIAlertController(title: "Success", message: "Log in SuccessFull", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        DispatchQueue.main.async {
            //Before show it in main uı we need to add accessibility identifier for uı tests to access this alert box.;
            alert.view.accessibilityIdentifier = "SuccessAlertDialog"
            self.present(alert, animated: true, completion: nil)
        }    }
    
    func errorHandler(error: SignupError) {
        let alert = UIAlertController(title: "Error", message: "Your request could not be processed at this time", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        DispatchQueue.main.async {
            //Before show it in main uı we need to add accessibility identifier for uı tests to access this alert box.;
            alert.view.accessibilityIdentifier = "errorAlertDialog"
            self.present(alert, animated: true, completion: nil)
        }
    }
}
