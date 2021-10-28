//
//  HomeVC.swift
//  29th-assignmnet-YouTube
//
//  Created by 박예빈 on 2021/10/19.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var storyCollectionView: UICollectionView!
    @IBOutlet weak var filterCollectionView: UICollectionView!
    @IBOutlet weak var mainTableView: UITableView!
    
    var storyContentList: [StoryDataModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initContentList()
        registerXib()
        storyCollectionView.dataSource = self
        filterCollectionView.dataSource = self
        storyCollectionView.register(UICollectionView.self, forCellWithReuseIdentifier: "filterCell")
        filterCollectionView.register(UICollectionView.self, forCellWithReuseIdentifier: "filterCell")
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
        if tableView == mainTableView {
            return 306
        } else {
            return 48
        }
    }
}

extension HomeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == mainTableView {
            return 10
        } else {
            return 6
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier) as? HomeTableViewCell else {return UITableViewCell()}
        
        return cell
    }
}

// MARK: CollectionView
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
