//
//  RegistrationViewModel.swift
//  InstgramCloneFirebase
//
//  Created by 陳郁勳 on 2022/1/19.
//
import Firebase
import UIKit

protocol RegistrationObserver: AnyObject {

}

class RegistrationViewModel {
    //MARK: - Observer
    weak var observer: RegistrationObserver?
    
    //MARK: - initial
    init() {}
    
    //MARK: - Properties
    
    //MARK: - Function
    func checkSignupResult(result: AuthDataResult?, error: Error?) {
        
        if let error = error {
            // Sign Up Error
            print(error)
        } else {
            // Sign Up Successful
        }
    }
}
