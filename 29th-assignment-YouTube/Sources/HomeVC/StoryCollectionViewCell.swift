//
//  StoryCollectionViewCell.swift
//  29th-assignmnet-YouTube
//
//  Created by 박예빈 on 2021/10/29.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    static let identifier = "StoryCollectionViewCell"
    
    @IBOutlet weak var storyImageView: UIImageView!
    @IBOutlet weak var storyNameLabel: UILabel!
    
    func setData(storyName: String, storyImage: UIImage?) {
        storyImageView.image = storyImage
        storyNameLabel.text = storyName
    }
}
