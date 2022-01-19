//
//  RegistrationViewController.swift
//  InstgramCloneFirebase
//
//  Created by 陳郁勳 on 2022/1/17.
//

import UIKit
import Firebase

class RegistrationViewController: UIViewController {
    // MARK: - Properties
    let registrationView: RegistrationView = RegistrationView()
    let viewModel: RegistrationViewModel = RegistrationViewModel()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonAction()
        setTextFieldAction()
        setViewModel()
    }
    
    override func loadView() {
        self.view = registrationView
    }
    
    // MARK: - Function
    private func setButtonAction() {
        registrationView.signButtonAction = handleSignup
    }
    
    private func setTextFieldAction() {
        registrationView.textFieldAction = checkButtonAvailable
    }
    
    private func setViewModel() {
        self.viewModel.observer = self
    }
    
    private func checkButtonAvailable() {
        let isEnabled: Bool = registrationView.emailTextField.text?.count ?? 0 > 0 &&
                              registrationView.userNameTextField.text?.count ?? 0 > 0 &&
                              registrationView.passWordTextField.text?.count ?? 0 > 0
        
        registrationView.signButton.isEnabled = isEnabled
        changeSignUpButtonColor(isEnabled: isEnabled)
    }
    
    private func changeSignUpButtonColor(isEnabled: Bool) {
        let buttonColor: UIColor = isEnabled == true ? .availableRegisterColor : .unavailabelRegisterColor
        registrationView.signButton.backgroundColor = buttonColor
    }
    
    private func handleSignup() {
        guard let email: String = registrationView.emailTextField.text, !email.isEmpty else { return }
        guard let userName: String = registrationView.userNameTextField.text, !userName.isEmpty else { return }
        guard let password: String = registrationView.passWordTextField.text, !password.isEmpty else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            self.viewModel.checkSignupResult(result: result, error: error)
        }
    }
}

extension RegistrationViewController: RegistrationObserver {
    
}
