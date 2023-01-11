//
//  ViewController.swift
//  Shop
//
//  Created by Artem on 09.01.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    static let id = "Cell"

    override func viewDidLoad() {
        super.viewDidLoad()

        initialize()
    }

    

    
    //MARK: - Private properties
    private let collectionView: UICollectionView = {
        let someLayout = UICollectionViewFlowLayout()
        someLayout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: someLayout)
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()
    
    private let items = ["1", "2", "3", "4", "5"]
    private let group = ["Книги", "Аудио"]
    
    private let someView: UIView = {
        let view = UIView()
        view.backgroundColor = .init(white: 0.95, alpha: 1)
        return view
    }()
    
    private var booksSegmentVC = BooksSegmentIndexViewController()
    private var audioSegmentVC = AudioSegmentIndexViewController()
    
    private var segment: UISegmentedControl = {
        let seg = UISegmentedControl()
        seg.selectedSegmentIndex = 0
        return seg
    }()
    
    //MARK: - Private constants
    private enum UIConstants {
        static let heightCollection: CGFloat = 150
        static let widthSize: CGFloat = 100
        static let heightSegment: CGFloat = 30
        static let insetLeftRight: CGFloat = 20
        static let heightBooksIndex: CGFloat = 350
        static let heightAudioIndex: CGFloat = 300
    }
    


}

//MARK: - Private Init
private extension ViewController {
    private func initialize() {
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Каталог книг"
        
        view.addSubview(collectionView)
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CollectionCell.self, forCellWithReuseIdentifier: ViewController.id)
        collectionView.snp.makeConstraints { make in
            make.topMargin.equalToSuperview().inset(10)
            make.trailing.leading.equalToSuperview()
            make.height.equalTo(UIConstants.heightCollection)
        }
        
        view.addSubview(someView)
        someView.snp.makeConstraints { make in
            make.top.equalTo(collectionView).inset(UIConstants.heightCollection)
            make.leading.bottomMargin.trailing.equalToSuperview()
        }
        segment = UISegmentedControl(items: group)
        segment.selectedSegmentIndex = 0
        segment.addTarget(self, action: #selector(changeCroup), for: .valueChanged)
        someView.addSubview(segment)
        segment.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(UIConstants.heightSegment)
            make.top.equalTo(someView).inset(20)
        }
        view.addSubview(booksSegmentVC.view)
        booksSegmentVC.view.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(UIConstants.heightBooksIndex)
            make.top.equalTo(segment).inset(UIConstants.heightSegment + 20)
        }
        
    }
        @objc private func changeCroup(item: UISegmentedControl) {
            
            switch item.selectedSegmentIndex {
            case 0:
                view.addSubview(booksSegmentVC.view)
                booksSegmentVC.view.snp.makeConstraints { make in
                    make.leading.trailing.equalToSuperview().inset(20)
                    make.height.equalTo(UIConstants.heightBooksIndex)
                    make.top.equalTo(segment).inset(UIConstants.heightSegment + 20)
                }
            case 1:
                view.addSubview(audioSegmentVC.view)
                audioSegmentVC.view.snp.makeConstraints { make in
                    make.leading.trailing.equalToSuperview().inset(20)
                    make.height.equalTo(UIConstants.heightBooksIndex)
                    make.top.equalTo(segment).inset(UIConstants.heightSegment + 20)
                }
           
                
            default: break
            }
            
            
        
    }
}

//MARK: - Collection Delegate / DataSource
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ViewController.id, for: indexPath) as! CollectionCell
            cell.configure(with: items[indexPath.row], index: indexPath.row)
            cell.delegate = self
            return cell
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: UIConstants.widthSize, height: UIConstants.heightCollection - 30)
    }
}

extension ViewController: CollectionCellDelegate {
    func didTap(with item: Int) {
        switch item {
        case 0: navigationController?.pushViewController(ShoesViewController(), animated: true)
        case 1: navigationController?.pushViewController(BooksViewController(), animated: true)
        case 2: navigationController?.pushViewController(CristmasViewController(), animated: true)
        case 3: navigationController?.pushViewController(ElectronicsViewController(), animated: true)
        case 4: navigationController?.pushViewController(HomeAppViewController(), animated: true)
        default:
            print("LOL")
        }
    }
}

