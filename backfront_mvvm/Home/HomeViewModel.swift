//
//  HomeViewModel.swift
//  backfront_mvvm
//
//  Created by Premiersoft on 14/08/23.
//

import UIKit

class HomeViewModel {
    
    private var posts = [
        Posts(profileImage: "img2", userName: "jack", postImage: "post1"),
        Posts(profileImage: "img4", userName: "samuel", postImage: "post2"),
        Posts(profileImage: "img3", userName: "carolina", postImage: "post3"),
        Posts(profileImage: "img6", userName: "gustavo", postImage: "post4"),
    ]
    
    public var getListPosts: [Posts] {
        posts
    }
    
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
        2
    }
    
    public func sizeForItemAt(indexPath: IndexPath, frame: CGRect) -> CGSize {
        if indexPath.row == 0 {
           return CGSize(width: 120, height: frame.height)
        } else {
            return CGSize(width: frame.width - 120, height: frame.height)
        }
    }

}
