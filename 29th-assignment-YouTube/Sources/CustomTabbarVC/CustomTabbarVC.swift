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
        
        homeVC.tabBarItem = UITabBarItem(title: "홈", image: UIImage(named: "homeIcon"), selectedImage:  UIImage(named: "homeIconFill"))
        shortsVC.tabBarItem  = UITabBarItem(title: "Shorts", image: UIImage(named: "shortsIcon"), selectedImage: UIImage(named: "shortsIconFill"))
        addVC.tabBarItem  = UITabBarItem(title: "추가", image: UIImage(named: "plusCircleIcon"), selectedImage: UIImage(named: "plusCircleIconFill"))
        subscribeVC.tabBarItem  = UITabBarItem(title: "구독", image: UIImage(named: "subscribtionIcon"), selectedImage: UIImage(named: "subscriptionIconFill"))
        keepVC.tabBarItem  = UITabBarItem(title: "보관함", image: UIImage(named: "LibraryIcon"), selectedImage: UIImage(named: "LibraryIconFill"))
        
        
        setViewControllers([homeVC, shortsVC, addVC, subscribeVC, keepVC], animated: true)
    }

}
