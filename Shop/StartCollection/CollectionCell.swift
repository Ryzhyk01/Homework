//
//  CollectionCell.swift
//  Shop
//
//  Created by Artem on 09.01.2023.
//

import Foundation
import UIKit
import SnapKit

//MARK: - Protocol
protocol CollectionCellDelegate: AnyObject {
    func didTap(with item: Int)
}

class CollectionCell: UICollectionViewCell {
    
    static let id = "Cell"
    
    public func configure(with item: String, index: Int) {
        self.number = index
        mainButton.setImage(UIImage(named: item), for: .normal)
        mainButton.clipsToBounds = true
        mainButton.contentMode = .scaleAspectFit
        mainButton.contentScaleFactor = 5
    }
    
    weak var delegate: CollectionCellDelegate?
    private var number: Int!
    
    override init(frame: CGRect) {
        super.init(frame: frame)        
        initialize()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Public properties
    public let mainButton: UIButton = {
        let item = UIButton()
        item.backgroundColor = .orange
        item.layer.cornerRadius = 20
        item.contentMode = .scaleAspectFit
        item.addTarget(self, action: #selector(presentItem), for: .touchUpInside)
        return item
    }()
    
    @objc func presentItem() {
        delegate?.didTap(with: number)
    }
    
   
}


//MARK: - Private Init
private extension CollectionCell {
    private func initialize() {
        contentView.addSubview(mainButton)
        mainButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}



