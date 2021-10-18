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
    var rootView: SignUpViewController?
    
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

        self.dismiss(animated: false) { [self] in
            if let isFromSignUp = self.isFromSignUp {
                self.rootView?.navigationController?.popViewController(animated: false)
            }
        }
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
