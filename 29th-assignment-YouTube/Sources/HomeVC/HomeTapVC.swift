//
//  HomeTapVC.swift
//  29th-assignmnet-YouTube
//
//  Created by 박예빈 on 2021/12/10.
//

import UIKit

class HomeTapVC: UIViewController {
    static let identifier = "HomeTapVC"

    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func touchUpToBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
