//
//  CollectionCellBack.swift
//  Shop
//
//  Created by Artem on 09.01.2023.
//

import Foundation
import UIKit
import SnapKit

protocol CollectionCellBackDelegate: AnyObject {
    func didTapped(with: Int)
    
}

class CollectionCellBack: UICollectionViewCell {
    
    static let id = "CellBack"
    
    weak var delegateBack: CollectionCellBackDelegate?
    private var number: Int!
    
    public func configure(with item: String, info: Int) {
        self.number = info
        mainButton.setImage(UIImage(named: item), for: .normal)
        mainButton.clipsToBounds = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private properties
    public let mainButton: UIButton = {
        let item = UIButton()
        item.backgroundColor = .orange
        item.layer.cornerRadius = 20
        item.setImage(UIImage(named: "1"), for: .normal)
        item.addTarget(self, action: #selector(presentItem), for: .touchUpInside)
        return item
    }()
    
    @objc func presentItem() {
        delegateBack?.didTapped(with: number)
    }
}

//MARK: - Private Init
private extension CollectionCellBack {
    private func initialize() {
        addSubview(mainButton)
        mainButton.snp.makeConstraints { make in
            make.edges.edges.equalToSuperview()
        }
    }
}
