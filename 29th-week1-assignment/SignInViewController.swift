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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nextBtn.isEnabled = false
        self.nameTextField.delegate = self
        self.idTextField.delegate = self
        self.pwTextField.delegate = self
        
        self.nameTextField.layer.borderWidth = 1
        self.nameTextField.layer.borderColor = UIColor.lightGray.cgColor
        self.nameTextField.layer.cornerRadius = 10
        self.nameTextField.addLeftPadding()
        
        self.idTextField.layer.borderWidth = 1
        self.idTextField.layer.borderColor = UIColor.lightGray.cgColor
        self.idTextField.layer.cornerRadius = 10
        self.idTextField.addLeftPadding()
        
        self.pwTextField.layer.borderWidth = 1
        self.pwTextField.layer.borderColor = UIColor.lightGray.cgColor
        self.pwTextField.layer.cornerRadius = 10
        self.pwTextField.addLeftPadding()
        
        self.nextBtn.backgroundColor = UIColor.systemBlue
        self.nextBtn.layer.cornerRadius = 10
        
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
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.nextBtn.isEnabled =
        self.nameTextField.hasText && self.idTextField.hasText && self.pwTextField.hasText
    }
}

extension UITextField {
  func addLeftPadding() {
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: self.frame.height))
    self.leftView = paddingView
    self.leftViewMode = ViewMode.always
  }
}
