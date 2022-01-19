//
//  RegistrationButton.swift
//  InstgramCloneFirebase
//
//  Created by 陳郁勳 on 2022/1/17.
//

import Foundation
import UIKit

extension UIButton {
    static func makeRegistrationButton() -> UIButton {
        let registrationButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("Sign up", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .unavailabelRegisterColor
            button.isEnabled = false
            button.layer.cornerRadius = 5
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
            return button
        }()
        return registrationButton
    }
}
