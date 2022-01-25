//
//  UserProfile.swift
//  InstgramCloneFirebase
//
//  Created by 陳郁勳 on 2022/1/25.
//

import Foundation

struct UserProfile {
    let userName: String
    let profileImageUrl: String
    
    init(userName: String,
         profileImageUrl: String) {
        self.userName = userName
        self.profileImageUrl = profileImageUrl
    }
}
