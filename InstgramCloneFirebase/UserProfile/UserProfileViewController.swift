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
    let viewModel: UserProfileViewModel = UserProfileViewModel()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewModelObserver()
        setNavigationTitle()
        setCollectionView()
    }
    
    override func loadView() {
        self.view = userProfileView
    }
    
    // MARK: - Function
    private func setViewModelObserver() {
        viewModel.observer = self
    }
    
    private func setNavigationTitle() {
        fetchUserName { userProfile in
            self.viewModel.setUserProfile(userProfile: userProfile)
            self.userProfileView.userProfileCollectionView.reloadData()
        }
    }
    
    private func setCollectionView() {
        userProfileView.userProfileCollectionView.delegate = self
        userProfileView.userProfileCollectionView.dataSource = self
    }
    
    private func fetchUserName(completion: @escaping (UserProfile) -> Void) {
        
        guard let uid = Auth.auth().currentUser?.uid else { return } // Query current user uid
        
        // Query data in Firebase realtime database
        Database.database().reference().child("users").child(uid).observeSingleEvent(of: .value) { snapshot in
            guard let dictionary = snapshot.value as? [String: Any],// Snapshot convert to dictionary
                  let userName: String = dictionary["userName"] as? String,
                  let profileImageUrl: String = dictionary["profileImage"] as? String else { return }// Get string from dictionary
            
            let userProfile: UserProfile = UserProfile(userName: userName, profileImageUrl: profileImageUrl)
            completion(userProfile)
        } withCancel: { queryError in
            print("Failed to query user infomation:", queryError)
        }
    }
}

extension UserProfileViewController: UserProfileObserver {
    func setNavigationTitle(title: String) {
        self.title = title
    }
}

extension UserProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard let headerView: ProfileHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ProfileHeader.identifier, for: indexPath) as? ProfileHeader else { return UICollectionReusableView()}
        
        let profileImageUrl: String = viewModel.getUserProfileImageUrl()
        headerView.setProfileImage(profileImageUrl: profileImageUrl)
        return headerView
    }
}
