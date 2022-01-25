//
//  UserProfileViewModel.swift
//  InstgramCloneFirebase
//
//  Created by 陳郁勳 on 2022/1/25.
//

import Foundation

protocol UserProfileObserver: AnyObject {
    func setNavigationTitle(title: String)
}

class UserProfileViewModel {
    // MARK: - Observer
    weak var observer: UserProfileObserver?
    // MARK: - initial
    init() {}
    
    // MARK: - Properties
    private var userProfile: UserProfile? {
        didSet {
            guard let userProfile = userProfile else { return }
            observer?.setNavigationTitle(title: userProfile.userName)
        }
    }
    
    // MARK: - Get
    func getUserProfile() -> UserProfile? {
        guard let userProfile = userProfile else { return nil }
        return userProfile
    }
    
    func getUserProfileImageUrl() -> String {
        guard let userProfile = userProfile else { return "" }
        return userProfile.profileImageUrl
    }
    
    // MARK: - Set
    func setUserProfile(userProfile: UserProfile) {
        self.userProfile = userProfile
    }
}
