//
//  UserProfileView.swift
//  InstgramCloneFirebase
//
//  Created by 陳郁勳 on 2022/1/22.
//

import UIKit

class UserProfileView: UIView {
    // MARK: - Properties
    // MARK: - IBOutLets
    let userProfileCollectionView: UICollectionView = {
        let collectionViewLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewLayout.headerReferenceSize = CGSize(width: 1, height: 100)
        let collectionView = UICollectionView(frame: CGRect(), collectionViewLayout: collectionViewLayout)
        collectionView.register(ProfileHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ProfileHeader.identifier)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setViews()
        setLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Function
    // MARK: - setViews
    func setViews() {
        self.addSubview(userProfileCollectionView)
    }
    // MARK: - setLayouts
    func setLayouts() {
        self.userProfileCollectionView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
}
