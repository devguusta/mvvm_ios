//
//  HomeScreen.swift
//  backfront_mvvm
//
//  Created by Premiersoft on 14/08/23.
//

import UIKit

class HomeScreen: UIView {
    
    lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout( )
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        //TODO: REGISTER
        collectionView.register(StoryCardCollectionViewCell.self, forCellWithReuseIdentifier: StoryCardCollectionViewCell.identifier)
        collectionView.backgroundColor = .clear
        
        return collectionView;
    }()
    
    public func configProtocolsCollectionView(delegate: UICollectionViewDelegate, datasource: UICollectionViewDataSource) {
        collectionView.delegate = delegate
        collectionView.dataSource = datasource
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .appBackground
    
        addSubview(collectionView)
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints(){
        collectionView.pin(to: self)
    }
    
}
