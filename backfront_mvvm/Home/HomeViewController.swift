//
//  ViewController.swift
//  backfront_mvvm
//
//  Created by Premiersoft on 09/08/23.
//

import UIKit

class HomeViewController: UIViewController {
   private var homeScreen: HomeScreen?
    private  var viewModel: HomeViewModel = HomeViewModel()
    
    override func loadView() {
        homeScreen = HomeScreen()
        view = homeScreen
       
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        homeScreen?.configProtocolsCollectionView(delegate: self, datasource: self)
    }


}


extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         viewModel.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCardCollectionViewCell.identifier, for: indexPath) as? StoryCardCollectionViewCell
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         viewModel.sizeForItemAt(indexPath: indexPath, frame: collectionView.frame)
    }
    
    
}
