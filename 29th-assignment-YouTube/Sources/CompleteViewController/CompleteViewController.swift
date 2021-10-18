//
//  CompleteViewController.swift
//  29th-week1-assignment
//
//  Created by 박예빈 on 2021/10/05.
//

import UIKit

class CompleteViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var nextBtn: UIButton!
    var name: String?
    var isFromSignUp: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.welcomeLabel.text = self.name! + "님 환영합니다!"
        
        self.nextBtn.backgroundColor = UIColor.systemBlue
        self.nextBtn.layer.cornerRadius = 10
        self.nextBtn.backgroundColor = UIColor.systemBlue
    }
    
    @IBAction func touchUpToGoNext(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "CustomTabbarVC") else { return }
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: false)
    }
    
    @IBAction func touchUpToGoLogin(_ sender: Any) {
        if let isFromSignUp = isFromSignUp {
            let viewControllers : [UIViewController] = self.navigationController!.viewControllers as [UIViewController]

                self.navigationController?.popToViewController(viewControllers[viewControllers.count - 3 ], animated: false)
            return
        }
        
        self.dismiss(animated: false)
    }
}

extension UINavigationController {
    func popViewController(animated: Bool, completion:@escaping (()->())) -> UIViewController? {
        CATransaction.setCompletionBlock(completion)
        CATransaction.begin()
        let poppedViewController = self.popViewController(animated: animated)
        CATransaction.commit()
        return poppedViewController
    }
}
