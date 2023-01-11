//
//  HomeApp.swift
//  Shop
//
//  Created by Artem on 09.01.2023.
//

import Foundation
import UIKit

class HomeAppViewController: UIViewController {
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
        view.image = UIImage(named: "back5")
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    private let mainLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.numberOfLines = 2
        lbl.textAlignment = .right
        lbl.text = "Слышите, да?"
        lbl.font = .systemFont(ofSize: 30, weight: .bold)
        return lbl
    }()
    
    private let descriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 2
        lbl.textAlignment = .right
        lbl.textColor = .white
        lbl.text = "Это в книгах скрипит снег"
        lbl.font = .systemFont(ofSize: 20, weight: .semibold)
        return lbl
    }()
}

//MARK: - Private Init
private extension HomeAppViewController {
    private func initialize() {
        
        view.addSubview(itemImage)
        itemImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        itemImage.addSubview(mainLabel)
        mainLabel.snp.makeConstraints { make in
            make.trailing.equalTo(-20)
            make.topMargin.equalToSuperview()
            make.leading.equalTo(60)
        }
        itemImage.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.trailing.equalTo(itemImage).inset(20)
            make.leading.equalToSuperview().inset(100)
            make.bottom.equalTo(mainLabel).inset(-60)
        }
    }
    
}
