//
//  YellowViewController.swift
//  Shop
//
//  Created by Artem on 10.01.2023.
//

import Foundation
import UIKit
import SnapKit

class BooksSegmentIndexViewController: UIViewController {
    
    static let id = "YellowVC"
    
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
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 19, weight: .bold)
        label.text = "Выберите книги, которые нравятся"
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.text = "Получите рекомендации"
        return label
    }()
    
    private let selectButton: UIButton = {
        let button = UIButton()
        button.setTitle("Выбрать книги", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.4062315641, blue: 0, alpha: 1)
        button.layer.cornerRadius = 10
        button.titleLabel?.tintColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        return button
    }()
    
    

    
    private enum UIConstants {
        static let heightCollection: CGFloat = 165
        static let widthSize: CGFloat = 100
    }
    
    private let items = ["yellow1", "yellow2", "yellow3", "yellow4", "yellow5"]
}

//MARK: - Private Init
private extension BooksSegmentIndexViewController {
    private func initialize() {
        view.addSubview(backView)
        backView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        backView.addSubview(collectionView)
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CollectionCellBack.self, forCellWithReuseIdentifier: BooksSegmentIndexViewController.id)
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(UIConstants.heightCollection)
        }
        
        backView.addSubview(mainLabel)
        mainLabel.snp.makeConstraints { make in
            make.bottom.equalTo(collectionView).inset(-20)
            make.centerX.equalToSuperview()
        }
        
        backView.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(mainLabel).inset(40)
            make.centerX.equalTo(backView)
        }
        
        
        backView.addSubview(selectButton)
        let tapBook = UITapGestureRecognizer(target: self, action: #selector(nextBooks))
        tapBook.numberOfTouchesRequired = 1
        tapBook.numberOfTapsRequired = 1
        selectButton.addGestureRecognizer(tapBook)
        
        selectButton.snp.makeConstraints { make in
            make.centerX.equalTo(backView)
            make.bottomMargin.equalTo(backView).inset(30)
            make.height.equalTo(50)
            make.width.equalTo(220)
        }
      
    }
    
    @objc private func nextBooks() {
        present(ChangeBooks(), animated: true)
    }
}

//MARK: - Collection Delegate / DataSource
extension BooksSegmentIndexViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BooksSegmentIndexViewController.id, for: indexPath) as! CollectionCellBack
        cell.configure(with: items[indexPath.row], info: indexPath.row)
            cell.delegateBack = self
            return cell
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: UIConstants.widthSize, height: UIConstants.heightCollection - 30)
    }
}

//MARK: - CollectionCellBackDelegate
extension BooksSegmentIndexViewController: CollectionCellBackDelegate {
    func didTapped(with: Int) {
        switch with {
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
