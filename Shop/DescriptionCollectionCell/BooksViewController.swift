//
//  BooksViewController.swift
//  Shop
//
//  Created by Artem on 09.01.2023.
//

import Foundation
import UIKit

class BooksViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    
    //MARK: - Private constants
    private enum UIConstants {
        static let heightBtn: CGFloat = 50
    }
    
    //MARK: - Private properties
    private let itemImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "back2")
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    private let mainLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.numberOfLines = 2
        lbl.text = "Cамые классные истории 2022 года"
        lbl.font = .systemFont(ofSize: 30, weight: .bold)
        return lbl
    }()
    
    private let descriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.text = "Что читали и слушали весь год"
        lbl.font = .systemFont(ofSize: 20, weight: .semibold)
        return lbl
    }()
}

//MARK: - Private Init
private extension BooksViewController {
    private func initialize() {
        
        view.addSubview(itemImage)
        itemImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        itemImage.addSubview(mainLabel)
        mainLabel.snp.makeConstraints { make in
            make.leading.equalTo(20)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(150)
        }
        itemImage.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.bottom.equalTo(mainLabel).inset(-20)
            make.leading.equalToSuperview().inset(20)
        }
    }
    
}
