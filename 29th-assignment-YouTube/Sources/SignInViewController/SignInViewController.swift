//
//  SignInViewController.swift
//  29th-week1-assignment
//
//  Created by 박예빈 on 2021/10/05.
//

import UIKit

class SignInViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet var textFieldCollection: [UITextField]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()

        for i in textFieldCollection {
            i.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        }
    }
    
    func setUI() {
        self.nextBtn.isEnabled = false
        self.nextBtn.backgroundColor = UIColor.systemBlue
        self.nextBtn.layer.cornerRadius = 10
        self.nextBtn.backgroundColor = UIColor.lightGray
        
        setTextFieldUI()
    }
    
    func setTextFieldUI() {
        for i in textFieldCollection {
            i.delegate = self
            i.layer.borderWidth = 1
            i.layer.borderColor = UIColor.lightGray.cgColor
            i.layer.cornerRadius = 10
            i.addLeftPadding()
        }
    }
    
    @IBAction func touchUpToGoSignUp(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") else { return }
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction func touchUpToGoComplete(_ sender: Any) {
       
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "CompleteViewController") as? CompleteViewController else { return }
        
        nextVC.name = self.nameTextField.text
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: false, completion: nil)
    }
   
    @objc func textFieldDidChange(_ textField: UITextField) {
        self.nextBtn.isEnabled =
        self.nameTextField.hasText && self.idTextField.hasText && self.pwTextField.hasText
        
        if self.nextBtn.isEnabled {
            self.nextBtn.backgroundColor = UIColor.systemBlue
        }
    }
}

extension UITextField {
  func addLeftPadding() {
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: self.frame.height))
    self.leftView = paddingView
    self.leftViewMode = ViewMode.always
  }
}
