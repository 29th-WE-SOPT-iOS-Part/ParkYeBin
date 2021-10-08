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
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.nextBtn.isEnabled =
        self.nameTextField.hasText && self.idTextField.hasText && self.pwTextField.hasText
    }
    
}
