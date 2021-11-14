//
//  StoryDataModel.swift
//  29th-assignmnet-YouTube
//
//  Created by 박예빈 on 2021/10/29.
//

import Foundation
import UIKit

struct StoryDataModel {
    let storyName: String
    let storyImageName: String
    
    func makeImage() -> UIImage? {
        return UIImage(named: storyImageName)
    }
}
