//
//  AudionChange.swift
//  Shop
//
//  Created by Artem on 10.01.2023.
//

import Foundation
import UIKit

class AudioChange: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        
    }
    
    //MARK: - Private Properties
    private let collectionView: UICollectionView = {
        let someLayout = UICollectionViewFlowLayout()
        someLayout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: someLayout)
        collection.showsVerticalScrollIndicator = false
        return collection
    }()
    
    //MARK: - Private constants
    private let items = ["change10", "change9", "change3", "change4", "change6", "change1", "change2", "change7", "change5", "change8"]
    private enum UIConstants {
        static let heightCollection: CGFloat = 320
        static let widthCollection: CGFloat = 100
    }
}

//MARK: - Private Init
private extension AudioChange {
    private func initialize() {
        view.backgroundColor = .init(white: 0.9, alpha: 0.3)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(exit))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        view.addGestureRecognizer(tapGesture)
        
        view.addSubview(collectionView)
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(AudioCell.self, forCellWithReuseIdentifier: String(describing: AudioCell.self))
        collectionView.snp.makeConstraints { make in
            make.topMargin.equalTo(self.view)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    @objc private func exit() {
        dismiss(animated: true)
    }
    
}

//MARK: - CollectionView Delegate / DataSource
extension AudioChange: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: AudioCell.self), for: indexPath) as! AudioCell
        cell.configure(with: items[indexPath.row])
        return  cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.size.width / 1.8, height: UIConstants.heightCollection)
    }
    
    
    }

