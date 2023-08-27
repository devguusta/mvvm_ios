//
//  StoryCardViewModel.swift
//  backfront_mvvm
//
//  Created by Premiersoft on 15/08/23.
//

import UIKit

class StoryCardViewModel {
    private var listStory: [Stories]
    init(listStory: [Stories]) {
        self.listStory = listStory
    }

    public var numberOfItems: Int {
        listStory.count
    }
    
   public func loadCurrentStory(indexPath: IndexPath) -> Stories {
        listStory[indexPath.row]
    }
}
