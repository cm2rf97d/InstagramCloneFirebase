//
//  MainTabbarController.swift
//  InstgramCloneFirebase
//
//  Created by 陳郁勳 on 2022/1/22.
//

import UIKit

class MainTabbarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray
        setNavigationBarAppearance()
        setTabBarAppearance()
        setControllers()
    }
    
    private func setNavigationBarAppearance() {
        let barAppearance: UINavigationBarAppearance = UINavigationBarAppearance()
        barAppearance.configureWithDefaultBackground()
        UINavigationBar.appearance().scrollEdgeAppearance = barAppearance
    }
    
    private func setTabBarAppearance() {
        let barAppearance = UITabBarAppearance()
        barAppearance.configureWithDefaultBackground()
        UITabBar.appearance().scrollEdgeAppearance = barAppearance
    }
    
    private func setControllers() {
        let userProfileViewController: UserProfileViewController = UserProfileViewController()
        let nvUserProfileViewController: UINavigationController = UINavigationController(rootViewController: userProfileViewController)
        nvUserProfileViewController.tabBarItem.image = UIImage(systemName: "person.crop.circle")
        nvUserProfileViewController.tabBarItem.selectedImage = UIImage(systemName: "person.crop.circle.fill")
        
        viewControllers = [nvUserProfileViewController]
    }
}
