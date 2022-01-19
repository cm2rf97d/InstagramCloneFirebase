//
//  RegistrationViewController.swift
//  InstgramCloneFirebase
//
//  Created by 陳郁勳 on 2022/1/17.
//

import UIKit

class RegistrationViewController: UIViewController {
    // MARK: - Properties
    let registrationView: RegistrationView = RegistrationView()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        self.view = registrationView
    }
    
    // MARK: - Function
}
