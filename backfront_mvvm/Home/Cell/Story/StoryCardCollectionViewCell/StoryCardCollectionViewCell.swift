//
//  StoryCardCollectionViewCell.swift
//  backfront_mvvm
//
//  Created by Premiersoft on 15/08/23.
//

import UIKit

class StoryCardCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "StoryCardCollectionViewCell"
    private var screen: StoryCardCollectionViewCellScren = StoryCardCollectionViewCellScren()
    private var viewModel: StoryCardViewModel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configScreen()
        screen.configProtocolsCollectionView(delegate: self, datasource: self)
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configScreen(){
        screen.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(screen)
        screen.pin(to: contentView)
    }
    
    public func setupCell(listStory: [Stories]){
        viewModel = StoryCardViewModel(listStory: listStory)
        
    }
}


extension StoryCardCollectionViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.numberOfItems ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        guard let viewModel = viewModel else {return UICollectionViewCell()}
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCollectionViewCell.identifier, for: indexPath) as? StoryCollectionViewCell
        cell?.setupCell(data: viewModel.loadCurrentStory(indexPath: indexPath), indexPath: indexPath)
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 120)
    }
    
    
    
}
