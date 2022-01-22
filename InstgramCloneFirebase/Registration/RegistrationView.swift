//
//  RegistrationView.swift
//  InstgramCloneFirebase
//
//  Created by 陳郁勳 on 2022/1/17.
//

import UIKit
import SnapKit

class RegistrationView: UIView {
    // MARK: - Properties
    var signButtonAction: (() -> Void)?
    var textFieldAction: (() -> Void)?
    var updatePhotoButtonAction: (() -> Void)?
    
    // MARK: - IBOutLets
    let updatePhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "plus_photo"), for: .normal)
        button.addTarget(self, action: #selector(handleUpdatePhoto), for: .touchUpInside)
        return button
    }()
    
    let emailTextField: UITextField = .makeRegistrationTextField(with: RegistrationTextFieldViewModel(placeHolder: "Email", isSecure: false))
    let userNameTextField: UITextField = .makeRegistrationTextField(with: RegistrationTextFieldViewModel(placeHolder: "UserName", isSecure: false))
    let passWordTextField: UITextField = .makeRegistrationTextField(with: RegistrationTextFieldViewModel(placeHolder: "PassWord", isSecure: true))
    let signButton: UIButton = .makeRegistrationButton()
    
    lazy var registrationStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailTextField,
                                                       userNameTextField,
                                                       passWordTextField,
                                                       signButton])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setViews()
        setLayouts()
        setButtonAction()
        setTextFieldAction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Function
    @objc private func handleSignUp() {
        signButtonAction?()
    }
    
    @objc private func handleTextField() {
        textFieldAction?()
    }
    
    @objc private func handleUpdatePhoto() {
        updatePhotoButtonAction?()
    }
    
    // MARK: - setAction
    private func setButtonAction() {
        signButton.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        
    }
    
    private func setTextFieldAction() {
        emailTextField.addTarget(self, action: #selector(handleTextField), for: .editingChanged)
        userNameTextField.addTarget(self, action: #selector(handleTextField), for: .editingChanged)
        passWordTextField.addTarget(self, action: #selector(handleTextField), for: .editingChanged)
    }
    
    // MARK: - setViews
    private func setViews() {
        self.addSubview(updatePhotoButton)
        self.addSubview(registrationStackView)
    }
    
    // MARK: - setLayouts
    private func setLayouts() {
        updatePhotoButton.snp.makeConstraints { make in
            make.height.width.equalTo(UIView.height * 0.17) // 140
            make.top.equalTo(self.safeAreaLayoutGuide).offset(UIView.height * 0.035) // 30
            make.centerX.equalTo(self)
        }
        
        registrationStackView.snp.makeConstraints { make in
            make.top.equalTo(updatePhotoButton.snp.bottom).offset(UIView.height * 0.048) // 40
            make.leading.equalTo(self).offset(UIView.width * 0.09) // 40
            make.trailing.equalTo(self).offset(-UIView.width * 0.09) // -40
            make.height.equalTo(UIView.height * 0.24) // 200
        }
    }
}
