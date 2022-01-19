//
//  RegistrationTextField.swift
//  InstgramCloneFirebase
//
//  Created by 陳郁勳 on 2022/1/17.
//

import Foundation
import UIKit

extension UITextField {
    static func makeRegistrationTextField(with viewModel: RegistrationTextFieldViewModel) -> UITextField {
        let textField: UITextField = {
            let textField = UITextField()
            textField.backgroundColor = .registrationTextFieldColor
            textField.borderStyle = .roundedRect
            textField.isSecureTextEntry = viewModel.isSecure
            textField.textColor = .black
            textField.attributedPlaceholder = NSAttributedString(string:viewModel.placeHolder,
                                                            attributes:[NSAttributedString.Key.foregroundColor: UIColor.lightGray])
            textField.layer.cornerRadius = 5
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor.registrationTextFieldColor.cgColor
            return textField
        }()
        return textField
    }
}
