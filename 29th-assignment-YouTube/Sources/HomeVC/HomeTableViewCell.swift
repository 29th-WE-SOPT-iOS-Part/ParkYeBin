//
//  HomeTableViewCell.swift
//  29th-assignmnet-YouTube
//
//  Created by 박예빈 on 2021/10/29.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    static let identifier = "HomeTableViewCell"

  
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        logoImageView.image = UIImage(named: "soptLogoCircle")
        mainImageView.image = UIImage(named: "soptIOS")
        titleLabel.text = "1차 세미나 : iOS 컴포넌트 이해, XCode 기본 사용법, View 화면 전환"
        subtitleLabel.text = "WE SOPT ・조회수 100만회 ・ 3주 전"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func tapView(gestureRecognizer: UIGestureRecognizer) {
//        guard let nextVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: HomeTapVC.identifier) as? HomeTapVC else { return }
//
//        nextVC.imgView = self.mainImageView
//        nextVC.titleLabel = self.titleLabel
//        nextVC.subtitleLabel = self.subtitleLabel
        print("##")
    }
    
}
