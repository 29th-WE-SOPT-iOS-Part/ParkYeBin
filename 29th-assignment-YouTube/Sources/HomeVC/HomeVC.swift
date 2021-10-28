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

    }
    
    func initContentList() {
        storyContentList.append(contentsOf: StoryDataModel(storyName: "iOSPart", storyImage: "ggamju1"))
        storyContentList.append(contentsOf: StoryDataModel(storyName: "Androidart", storyImage: "ggamju2"))
        storyContentList.append(contentsOf: StoryDataModel(storyName: "ServerPart", storyImage: "ggamju3"))
        storyContentList.append(contentsOf: StoryDataModel(storyName: "WebPart", storyImage: "ggamju4"))
        storyContentList.append(contentsOf: StoryDataModel(storyName: "DesignPart", storyImage: "ggamju5"))
        storyContentList.append(contentsOf: StoryDataModel(storyName: "PlanPart", storyImage: "ggamju6"))
    }
    

}

extension HomeVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storyLabels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCollectionViewCell.identifier, for: indexPath) as? StoryCollectionViewCell else {return UICollectionViewCell()}
        
        cell.setData(storyName: <#T##String#>, storyImage: <#T##UIImage?#>)
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
