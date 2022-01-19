//
//  RegistrationTextField.swift
//  InstgramCloneFirebase
//
//  Created by 陳郁勳 on 2022/1/17.
//

import Foundation
import UIKit

class RegistrationTextField: UITextField {
    init(with viewModel: RegistrationTextFieldViewModel) {
        super.init(frame: .zero)
        self.backgroundColor = .registrationTextFieldColor
        self.borderStyle = .roundedRect
        self.isSecureTextEntry = viewModel.isSecure
        self.textColor = .black
        self.attributedPlaceholder = NSAttributedString(string:viewModel.placeHolder,
                                                        attributes:[NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.registrationTextFieldColor.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
