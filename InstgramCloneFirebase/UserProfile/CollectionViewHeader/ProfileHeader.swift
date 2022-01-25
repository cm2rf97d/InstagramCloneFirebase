//
//  ProfileHeader.swift
//  InstgramCloneFirebase
//
//  Created by 陳郁勳 on 2022/1/25.
//

import UIKit

class ProfileHeader: UICollectionReusableView {
    // MARK: - Properties
    static let identifier: String = "ProfileHeader"
    let profileImageViewWidth: Double = UIView.width * 0.2
    
    // MARK: - IBOutLets
    lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = profileImageViewWidth / 2
        imageView.backgroundColor = .red
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        setLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Function
    func setProfileImage(profileImageUrl: String) {
        guard let url = URL(string: profileImageUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Failed to fetch profile image:", error)
                return
            }
            
            guard let data = data else { return }
            let image = UIImage(data: data)
            DispatchQueue.main.async {
                self.profileImageView.image = image
            }
        }.resume()
    }
    
    // MARK: - setViews
    func setViews() {
        self.addSubview(profileImageView)
    }
    
    // MARK: - setLayouts
    func setLayouts() {
        self.profileImageView.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.leading.equalTo(self).offset(30)
            make.width.height.equalTo(profileImageViewWidth)
        }
    }
}
