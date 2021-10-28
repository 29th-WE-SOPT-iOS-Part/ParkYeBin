//
//  UINavigationController.swift
//  29th-assignmnet-YouTube
//
//  Created by 박예빈 on 2021/10/29.
//

import Foundation
import UIKit

extension UINavigationController {
    func popViewController(animated: Bool, completion:@escaping (()->())) -> UIViewController? {
        CATransaction.setCompletionBlock(completion)
        CATransaction.begin()
        let poppedViewController = self.popViewController(animated: animated)
        CATransaction.commit()
        return poppedViewController
    }
}

