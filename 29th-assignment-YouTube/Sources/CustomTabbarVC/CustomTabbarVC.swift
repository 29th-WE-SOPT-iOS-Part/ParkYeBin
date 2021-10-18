//
//  CustomTabbarVC.swift
//  29th-assignmnet-YouTube
//
//  Created by 박예빈 on 2021/10/19.
//

import UIKit

class CustomTabbarVC: UITabBarController {

    override func viewDidLoad() {
        <#code#>
    }
    
    func setTabBar() {
        guard let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC"),
              let shortsVC = self.storyboard?.instantiateViewController(withIdentifier: "ShortsVC"),
              let addVC = self.storyboard?.instantiateViewController(withIdentifier: "AddVC"),
              let subscribeVC = self.storyboard?.instantiateViewController(withIdentifier: "SubscribeVC"),
              let keepVC = self.storyboard?.instantiateViewController(withIdentifier: "KeepVC") else { return }
        
        homeVC.tabBarItem.title = "홈"
        homeVC.tabBarItem.image = UIImage(systemName: "House")
        
    }

}
