//
//  SignInViewController.swift
//  29th-week1-assignment
//
//  Created by 박예빈 on 2021/10/05.
//

import UIKit

class SignInViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - @IBOutlet Properties
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet var textFieldCollection: [UITextField]!
    
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()

        for i in textFieldCollection {
            i.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        }
    }
    
    // MARK: - Custom Method
    
    func setUI() {
        self.nextBtn.isEnabled = false
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
    }
    
    // MARK: - @IBAction Properties
    
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
    
    // MARK: - @objc Function
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        self.nextBtn.isEnabled =
        self.nameTextField.hasText && self.idTextField.hasText && self.pwTextField.hasText
        
        if self.nextBtn.isEnabled {
            self.nextBtn.backgroundColor = UIColor.systemBlue
        }
    }
}

