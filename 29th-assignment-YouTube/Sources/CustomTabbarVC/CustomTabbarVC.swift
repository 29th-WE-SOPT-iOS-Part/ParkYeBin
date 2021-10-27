//
//  CustomTabbarVC.swift
//  29th-assignmnet-YouTube
//
//  Created by 박예빈 on 2021/10/19.
//

import UIKit

class CustomTabbarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
    }
    
    func setTabBar() {
        guard let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC"),
              let shortsVC = self.storyboard?.instantiateViewController(withIdentifier: "ShortsVC"),
              let addVC = self.storyboard?.instantiateViewController(withIdentifier: "AddVC"),
              let subscribeVC = self.storyboard?.instantiateViewController(withIdentifier: "SubscribeVC"),
              let keepVC = self.storyboard?.instantiateViewController(withIdentifier: "KeepVC") else { return }
        
        homeVC.tabBarItem.title = "홈"
        homeVC.tabBarItem.image = UIImage(named: "homeIcon")
        homeVC.tabBarItem.selectedImage = UIImage(named: "homeIconFill")
        shortsVC.tabBarItem.title = "Shorts"
        shortsVC.tabBarItem.image = UIImage(named: "shortsIcon")
        shortsVC.tabBarItem.selectedImage = UIImage(named: "shortsIconFill")
        addVC.tabBarItem.title = "추가"
        addVC.tabBarItem.image = UIImage(named: "plusCircleIcon")
        addVC.tabBarItem.selectedImage = UIImage(named: "plusCircleIconFill")
        subscribeVC.tabBarItem.title = "구독"
        subscribeVC.tabBarItem.image = UIImage(named: "subscribtionIcon")
        subscribeVC.tabBarItem.selectedImage = UIImage(named: "subscriptionIconFill")
        keepVC.tabBarItem.title = "보관함"
        keepVC.tabBarItem.image = UIImage(named: "LibraryIcon")
        keepVC.tabBarItem.selectedImage = UIImage(named: "LibraryIconFill")
        
        
        setViewControllers([homeVC, shortsVC, addVC, subscribeVC, keepVC], animated: true)
    }

}
