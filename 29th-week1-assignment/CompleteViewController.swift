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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.welcomeLabel.text = self.name! + "님 환영합니다!"
        
        
        self.nextBtn.backgroundColor = UIColor.systemBlue
        self.nextBtn.layer.cornerRadius = 10
        self.nextBtn.backgroundColor = UIColor.systemBlue
    }
    

}
