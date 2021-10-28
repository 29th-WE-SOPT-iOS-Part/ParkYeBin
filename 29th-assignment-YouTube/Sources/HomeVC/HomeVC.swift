//
//  HomeVC.swift
//  29th-assignmnet-YouTube
//
//  Created by 박예빈 on 2021/10/19.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var storyCollectionView: UICollectionView!
    
    var storyContentList: [StoryDataModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initContentList()
        storyCollectionView.dataSource = self

    }
    
    func registerXib(){
        let xibName = UINib(nibName: StoryCollectionViewCell.identifier, bundle: nil)
        print(StoryCollectionViewCell.identifier)
        storyCollectionView.register(xibName, forCellWithReuseIdentifier: StoryCollectionViewCell.identifier)
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

extension HomeVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storyContentList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCollectionViewCell.identifier, for: indexPath) as? StoryCollectionViewCell else {return UICollectionViewCell()}
        
        cell.setData(storyName: storyContentList[indexPath.row].storyName, storyImage: storyContentList[indexPath.row].makeImage())
    
        return cell
    }
    
}

extension HomeVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 72, height: 104)
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
