//
//  ChangeCollectionCell.swift
//  Shop
//
//  Created by Artem on 10.01.2023.
//

import Foundation
import UIKit
import SnapKit

class ChangeCollectionCell: UICollectionViewCell {
    
    public func configure(with info: String) {
        someView.image = UIImage(named: info)
        someView.layer.magnificationFilter = CALayerContentsFilter.nearest
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private properties
    private let someView: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 10
        return view
    }()
}

//MARK: - Private Init
private extension ChangeCollectionCell {
    private func initialize() {
        contentView.addSubview(someView)
        someView.snp.makeConstraints { make in
            make.leading.bottom.trailing.equalToSuperview()
            make.top.equalTo(10)
        }

    }
}
