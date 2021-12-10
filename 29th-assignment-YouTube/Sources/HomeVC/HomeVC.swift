//
//  HomeVC.swift
//  29th-assignmnet-YouTube
//
//  Created by 박예빈 on 2021/10/19.
//

import UIKit

class HomeVC: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var storyCollectionView: UICollectionView!
    @IBOutlet weak var filterCollectionView: UICollectionView!
    @IBOutlet weak var mainTableView: UITableView!
    
    var storyContentList: [StoryDataModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initContentList()
        registerXib()
        setDataSourceWithDelegate()
    }
    
    @IBAction func touchUpToGoLogin(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginNavigationController") else { return }
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: false)
        
    }
    
    func setDataSourceWithDelegate() {
        storyCollectionView.dataSource = self
        filterCollectionView.dataSource = self
        storyCollectionView.delegate = self
        filterCollectionView.delegate = self
        mainTableView.delegate = self
        mainTableView.dataSource = self
    }
    
    func registerXib(){
        let xibName = UINib(nibName: HomeTableViewCell.identifier, bundle: nil)
        mainTableView.register(xibName, forCellReuseIdentifier: HomeTableViewCell.identifier)
    }
    
    func initContentList() {
        storyContentList.append(contentsOf:[ StoryDataModel(storyName: "iOSPart", storyImageName: "ggamju1"),
             StoryDataModel(storyName: "AndroidPart", storyImageName: "ggamju2"),
             StoryDataModel(storyName: "ServerPart", storyImageName: "ggamju3"),
             StoryDataModel(storyName: "WebPart", storyImageName: "ggamju4"),
             StoryDataModel(storyName: "DesignPart", storyImageName: "ggamju5"),
            StoryDataModel(storyName: "PlanPart", storyImageName: "ggamju6")
         
        ])
    }
}

// MARK: TableView
extension HomeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 306
    }
}

extension HomeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier) as? HomeTableViewCell else {return UITableViewCell()}
        
        let tapRecorgnizer = UITapGestureRecognizer(target: self, action: #selector(tapView(gestureRecognizer:)))
        cell.mainImageView.addGestureRecognizer(tapRecorgnizer)
        tapRecorgnizer.delegate = self
        
        return cell
    }
    
    @objc func tapView(gestureRecognizer: UIGestureRecognizer) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: HomeTapVC.identifier) as? HomeTapVC else { return }
        
        nextVC.modalPresentationStyle = .fullScreen
        
        present(nextVC, animated: true) {
            nextVC.imgView.image = UIImage(named: "soptIOS")
            nextVC.titleLabel.text = "1차 세미나 : iOS 컴포넌트 이해, XCode 기본 사용법, View 화면 전환"
            nextVC.subtitleLabel.text = "WE SOPT ・조회수 100만회 ・ 3주 전"
            
        }
    }
   
}

// MARK: CollectionView
extension HomeVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == storyCollectionView {
            return storyContentList.count
        } else {
            return 6
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == storyCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCollectionViewCell.identifier, for: indexPath) as? StoryCollectionViewCell else {return UICollectionViewCell()}
            
            cell.setData(storyName: storyContentList[indexPath.row].storyName, storyImage: storyContentList[indexPath.row].makeImage())
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterCollectionViewCell.identifier, for: indexPath) as? FilterCollectionViewCell else {return UICollectionViewCell()}
            cell.filterButton.setImage(UIImage(named: "filter-" + String(indexPath.row + 1)), for: .normal)
            
            return cell
        }
    }
    
}

extension HomeVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == storyCollectionView {
            return CGSize(width: 72, height: 104)
        } else {
//            print(UIImage(named: "filter-" + String(indexPath.row + 1))?.size.width)
            return CGSize(width:((UIImage(named: "filter-" + String(indexPath.row + 1)))?.size.width)!, height: 32)
        }
          
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

}




