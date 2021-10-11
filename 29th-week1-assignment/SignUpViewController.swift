//
//  SignUpViewController.swift
//  29th-week1-assignment
//
//  Created by 박예빈 on 2021/10/05.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var pwCheckBox: UIButton!
    
    var isChecked: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameTextField.delegate = self
        self.idTextField.delegate = self
        self.pwTextField.delegate = self
        
        self.pwCheckBox.titleLabel!.text = ""
        
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
        self.nextBtn.backgroundColor = UIColor.lightGray
        
        self.nameTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        self.idTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        self.pwTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @IBAction func touchUpCheckBox(_ sender: Any) {
        if self.isChecked == false {
            self.isChecked = true
            self.pwCheckBox.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            self.pwTextField.isSecureTextEntry = false
        } else {
            self.isChecked = false
            self.pwCheckBox.setImage(UIImage(systemName: "square"), for: .normal)
            self.pwTextField.isSecureTextEntry = true
        }
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
