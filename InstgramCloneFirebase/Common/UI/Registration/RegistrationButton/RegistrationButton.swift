//
//  RegistrationButton.swift
//  InstgramCloneFirebase
//
//  Created by 陳郁勳 on 2022/1/17.
//

import Foundation
import UIKit

class RegistrationButton: UIButton {
    init() {
        super.init(frame: .zero)
        self.setTitle("Sign up", for: .normal)
        self.backgroundColor = .registrationButtonColor
        self.layer.cornerRadius = 5
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
