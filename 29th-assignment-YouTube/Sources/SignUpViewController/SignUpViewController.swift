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
    
    @IBOutlet var textFieldCollection: [UITextField]!
    
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var pwCheckBox: UIButton!
    
    var isChecked: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        
        for i in textFieldCollection {
            i.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        }
    }
    
    func setUI() {
        self.pwCheckBox.titleLabel!.text = ""
        
        self.nextBtn.backgroundColor = UIColor.systemBlue
        self.nextBtn.layer.cornerRadius = 4
        self.nextBtn.backgroundColor = UIColor.lightGray
        
        setTextFieldUI()
    }
    
    func setTextFieldUI() {
        for i in textFieldCollection {
            i.delegate = self
            i.layer.borderWidth = 1
            i.layer.borderColor = UIColor.lightGray.cgColor
            i.layer.cornerRadius = 8
            i.addLeftPadding()
        }
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
        nextVC.isFromSignUp = true
        nextVC.rootView = self
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
