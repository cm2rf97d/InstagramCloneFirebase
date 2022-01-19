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
    // MARK: - IBOutLets
    let changePhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "plus_photo"), for: .normal)
        return button
    }()
    
    let emailTextField = RegistrationTextField(with: RegistrationTextFieldViewModel(placeHolder: "Email", isSecure: false))
    let userNameTextField = RegistrationTextField(with: RegistrationTextFieldViewModel(placeHolder: "UserName", isSecure: false))
    let passwordTextField = RegistrationTextField(with: RegistrationTextFieldViewModel(placeHolder: "PassWord", isSecure: true))
    let signButton = RegistrationButton()
    
    lazy var registrationStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailTextField,
                                                       userNameTextField,
                                                       passwordTextField,
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Function
    // MARK: - setViews
    func setViews() {
        self.addSubview(changePhotoButton)
        self.addSubview(registrationStackView)
    }
    // MARK: - setLayouts
    func setLayouts() {
        changePhotoButton.snp.makeConstraints { make in
            make.height.width.equalTo(UIView.height * 0.17) // 140
            make.top.equalTo(self.safeAreaLayoutGuide).offset(UIView.height * 0.035) // 30
            make.centerX.equalTo(self)
        }
        
        registrationStackView.snp.makeConstraints { make in
            make.top.equalTo(changePhotoButton.snp.bottom).offset(UIView.height * 0.048) // 40
            make.leading.equalTo(self).offset(UIView.width * 0.09) // 40
            make.trailing.equalTo(self).offset(-UIView.width * 0.09) // -40
            make.height.equalTo(UIView.height * 0.24) // 200
        }
    }
}
