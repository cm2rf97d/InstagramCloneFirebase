//
//  UserProfileViewController.swift
//  InstgramCloneFirebase
//
//  Created by 陳郁勳 on 2022/1/22.
//

import UIKit
import Firebase

class UserProfileViewController: UIViewController {
    // MARK: - Properties
    let userProfileView: UserProfileView = UserProfileView()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationTitle()
    }
    
    override func loadView() {
        self.view = userProfileView
    }
    
    // MARK: - Function
    private func setNavigationTitle() {
        fetchUserName { userName in self.title = userName }
    }
    
    private func fetchUserName(completion: @escaping (String) -> Void) {
        
        guard let uid = Auth.auth().currentUser?.uid else { return } // Query current user uid
        
        // Query data in Firebase realtime database
        Database.database().reference().child("users").child(uid).observeSingleEvent(of: .value) { snapshot in
            guard let dictionary = snapshot.value as? [String: Any],// Snapshot convert to dictionary
                  let userName: String = dictionary["userName"] as? String else { return }// Get string from dictionary
            
            completion(userName)
        } withCancel: { queryError in
            print("Failed to query user infomation")
        }
    }
}
