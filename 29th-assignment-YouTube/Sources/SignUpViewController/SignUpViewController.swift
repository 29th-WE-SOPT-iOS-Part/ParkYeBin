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
    }
    
    func setUI() {
        self.pwCheckBox.titleLabel!.text = ""
        
        self.nextBtn.backgroundColor = UIColor.buttonBlue
        self.nextBtn.layer.cornerRadius = 4
        self.nextBtn.backgroundColor = UIColor.lightGray
        
        setTextFieldUI()
    }
    
    func setTextFieldUI() {
        for textField in textFieldCollection {
            textField.delegate = self
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor.lightGray.cgColor
            textField.layer.cornerRadius = 8
            textField.addLeftPadding()
        }
        
        for i in textFieldCollection {
            i.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        }
    }
    
    func requestSignUp() {
        UserSignService.shared.signUp(name: nameTextField.text ?? "",
                                              email: idTextField.text ?? "",
                                              password: pwTextField.text ?? "") { responseData in
            switch responseData {
            case .success(let loginResponse):
                guard let response = loginResponse as? LoginResponseData else { return }
                if let userData = response.data {
                    let alert = UIAlertController(title: "회원가입",
                                                  message: response.message,
                                                  preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "확인", style: .default) { _ in
                        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "CompleteViewController") as? CompleteViewController else { return }
                        
                        nextVC.isFromSignUp = true
                        nextVC.rootView = self
                        nextVC.modalPresentationStyle = .fullScreen
                        self.present(nextVC, animated: false)
                    }
                    alert.addAction(okAction)
                    
                    self.present(alert, animated: true)
                }
            case .requestERR(let msg):
                print("requestErr")
            case .pathErr:
                print("pathErr")
            case .Err400(let loginResponse):
                guard let response = loginResponse as? LoginResponseData else { return }
                self.simpleAlert(title: "회원가입", message: response.message)

            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
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
        requestSignUp()
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        self.nextBtn.isEnabled =
        self.nameTextField.hasText && self.idTextField.hasText && self.pwTextField.hasText
        
        if self.nextBtn.isEnabled {
            self.nextBtn.backgroundColor = UIColor.systemBlue
        }
    }
    
}
