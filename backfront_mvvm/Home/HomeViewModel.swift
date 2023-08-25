//
//  HomeViewModel.swift
//  backfront_mvvm
//
//  Created by Premiersoft on 14/08/23.
//

import UIKit

class HomeViewModel {
    
    private var story = [
    Stories(image: "img1", userName: "Add story"),
    Stories(image: "img2", userName: "jack"),
    Stories(image: "img3", userName: "carolina"),
    Stories(image: "img4", userName: "samuel"),
    Stories(image: "img5", userName: "maria"),
    Stories(image: "img6", userName: "gustavo"),
    Stories(image: "img7", userName: "neymar"),
    
    ]
     
    public var getListStory: [Stories] {
        story
    }
    public var numberOfItems: Int {
        1
    }
    
    public func sizeForItemAt(indexPath: IndexPath, frame: CGRect) -> CGSize {
        if indexPath.row == 0 {
           return CGSize(width: 120, height: frame.height)
        } else {
            return CGSize(width: frame.width - 120, height: frame.height)
        }
    }

}
