//
//  AudioSegmentIndexViewController.swift
//  Shop
//
//  Created by Artem on 10.01.2023.
//

import Foundation
import UIKit
import SnapKit

class AudioSegmentIndexViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        
        let tapBook = UITapGestureRecognizer(target: self, action: #selector(nextBook))
        tapBook.numberOfTouchesRequired = 1
        tapBook.numberOfTapsRequired = 1
        view.addGestureRecognizer(tapBook)
    }
    
    @objc private func nextBook() {
        present(ChangeBooks(), animated: true)
    }

    //MARK: - Private constants
    private let items = ["change1", "change4", "change5", "change6", "change7", "change8", "change9", "change10"]
    private enum UIConstants {
        static let heightCollection: CGFloat = 165
        static let widthSize: CGFloat = 100
    
}
    
    //MARK: - Private Properties
    private let backView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        return view
    }()

    private let collectionView: UICollectionView = {
        let someLayout = UICollectionViewFlowLayout()
        someLayout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: someLayout)
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()
    
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.text = "Рекомендации на сегодня"
        return label
    }()
    
  
}


//MARK: - Private Init
private extension AudioSegmentIndexViewController {
    private func initialize() {
        view.addSubview(backView)
        backView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        backView.addSubview(collectionView)
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(AudioCollectionCell.self, forCellWithReuseIdentifier: String(describing: AudioCollectionCell.self))
        collectionView.snp.makeConstraints { make in
            make.bottom.equalTo(backView).inset(50)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(UIConstants.heightCollection)
        }
        backView.addSubview(mainLabel)
        mainLabel.snp.makeConstraints { make in
            make.topMargin.equalToSuperview().inset(50)
            make.centerX.equalToSuperview()
        }
        
    }
}

//MARK: - Collection Delegate / DataSource
extension AudioSegmentIndexViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: AudioCollectionCell.self), for: indexPath) as! AudioCollectionCell
        cell.configure(with: items[indexPath.row], index: indexPath.row)
        cell.delegate = self
        return cell
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIConstants.widthSize, height: UIConstants.heightCollection - 30)
    }
}

extension AudioSegmentIndexViewController: AudioCollectionCellDelegate {
    func didTap(with index: Int) {
        switch index {
        case 0: present(ChangeBooks(), animated: true)
        case 1: present(ChangeBooks(), animated: true)
        case 2: present(ChangeBooks(), animated: true)
        case 3: present(ChangeBooks(), animated: true)
        case 4: present(ChangeBooks(), animated: true)
        default:
            print("LOL")
        }
    }
    
    
}
