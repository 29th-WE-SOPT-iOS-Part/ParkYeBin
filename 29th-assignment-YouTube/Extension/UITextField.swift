//
//  UITextField.swift
//  29th-assignmnet-YouTube
//
//  Created by 박예빈 on 2021/10/29.
//

import Foundation
import UIKit

extension UITextField {
  func addLeftPadding() {
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: self.frame.height))
    self.leftView = paddingView
    self.leftViewMode = ViewMode.always
  }
}

