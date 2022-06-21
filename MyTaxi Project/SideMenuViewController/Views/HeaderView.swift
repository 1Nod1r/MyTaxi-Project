//
//  HeaderView.swift
//  MyTaxi Project
//
//  Created by Nodirbek on 20/06/22.
//

import UIKit
import SnapKit

class HeaderView: UIView {
    
    //MARK: Properties
    
    private let personImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "personImage")
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Nodirbek Khudoyberdiev"
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private let phoneLabel: UILabel = {
        let label = UILabel()
        label.text = "+998(90)000-00-00"
        label.numberOfLines = 0
        label.textColor = .secondarySystemBackground
        label.font = .systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    
    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    //MARK: Private
    
    private func setupUI(){
        addSubviews(personImageView, nameLabel, phoneLabel)
        backgroundColor = UIColor.init(hex: "272724")
        
        personImageView.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(15)
            make.bottom.equalToSuperview().offset(-15)
            make.width.equalTo(60)
        }
        
        
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(personImageView.snp.right).offset(5)
            make.top.equalToSuperview().offset(5)
            make.right.equalToSuperview().offset(-5)
        }
        
        phoneLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom)
            make.left.equalTo(personImageView.snp.right).offset(5)
            make.bottom.equalToSuperview()
            make.right.equalToSuperview().offset(-5)
        }

    }
}


