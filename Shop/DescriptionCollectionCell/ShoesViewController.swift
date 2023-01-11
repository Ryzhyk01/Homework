//
//  ShoesViewController.swift
//  Shop
//
//  Created by Artem on 09.01.2023.
//

import Foundation
import UIKit
import SnapKit

class ShoesViewController: UIViewController {
    
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
        view.image = UIImage(named: "back1")
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    private let mainLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = #colorLiteral(red: 0.4684045493, green: 0.5597629677, blue: 0.4177030187, alpha: 1)
        lbl.numberOfLines = 2
        lbl.text = "Топ зарубежной прозы за 2022 года"
        lbl.font = .systemFont(ofSize: 30, weight: .bold)
        return lbl
    }()
    
    private let descriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = #colorLiteral(red: 1, green: 0.5597629677, blue: 0.4177030187, alpha: 1)
        lbl.text = "Узнай прямо сейчас"
        lbl.font = .systemFont(ofSize: 20, weight: .semibold)
        return lbl
    }()
}

//MARK: - Private Init
private extension ShoesViewController {
    private func initialize() {
        
        view.addSubview(itemImage)
        itemImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        itemImage.addSubview(mainLabel)
        mainLabel.snp.makeConstraints { make in
            make.leading.equalTo(20)
            make.trailing.equalToSuperview()
            make.top.equalToSuperview().inset(200)
        }
        itemImage.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.bottom.equalTo(mainLabel).inset(-20)
            make.leading.equalToSuperview().inset(20)
        }
    }

}
