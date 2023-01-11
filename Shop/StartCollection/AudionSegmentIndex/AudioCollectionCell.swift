//
//  AudioCollectionCell.swift
//  Shop
//
//  Created by Artem on 10.01.2023.
//

import Foundation
import UIKit
import SnapKit

protocol AudioCollectionCellDelegate: AnyObject {
    func didTap(with index: Int)
}

class AudioCollectionCell: UICollectionViewCell {
    
    weak var delegate: AudioCollectionCellDelegate?
    
    public func configure(with info: String, index: Int) {
        self.number = index
        someView.setImage(UIImage(named: info), for: .normal)
        someView.contentMode = .scaleAspectFill
        someView.layer.cornerRadius = 20
        someView.clipsToBounds = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private properties
    private let someView: UIButton = {
        let view = UIButton()
        view.backgroundColor = .white
        return view
    }()
    
    private var number: Int!
}

//MARK: - Private Init
private extension AudioCollectionCell {
    private func initialize() {
        
        someView.addTarget(self, action: #selector(didTapped), for: .touchUpInside)
        contentView.addSubview(someView)
        someView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    @objc private func didTapped() {
        delegate?.didTap(with: number)
    }
}


