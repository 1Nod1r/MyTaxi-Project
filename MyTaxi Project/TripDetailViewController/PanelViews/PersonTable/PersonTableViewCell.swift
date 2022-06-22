//
//  PersonTableViewCell.swift
//  MyTaxi Project
//
//  Created by Nodirbek on 21/06/22.
//

import UIKit

class PersonTableViewCell: UITableViewCell {

    static let id = "PersonTableViewCell"
    
    private let personImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "personImage")
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 23
        return imageView
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "Рейтинг: "
        label.font = .systemFont(ofSize: 17)
        label.tintColor = .secondaryLabel
        return label
    }()
    
    private let numberOfPath: UILabel = {
        let label = UILabel()
        label.text = "Поездки: "
        label.font = .systemFont(ofSize: 17)
        label.tintColor = .secondaryLabel
        return label
    }()
    
    private let ratingNumber: UILabel = {
        let label = UILabel()
        label.text = "5 ⭐️"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private let pathCount: UILabel = {
        let label = UILabel()
        label.text = "1885"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Водитель"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    private let personNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Nodirbek Khudoyberdiev"
        label.font = .systemFont(ofSize: 22, weight: .bold)
        return label
    }()
    
    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondaryLabel
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }
    
    private func setupUI(){
        addSubviews(personImageView, personNameLabel, lineView, titleLabel, pathCount, ratingLabel, ratingNumber, numberOfPath)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.left.equalToSuperview().offset(15)
            make.height.equalTo(23)
            make.right.equalToSuperview().offset(-15)
        }
        
        lineView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.height.equalTo(1)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
        }
        
        personImageView.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(15)
            make.height.width.equalTo(56)
        }
        
        personNameLabel.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp.bottom).offset(10)
            make.left.equalTo(personImageView.snp.right).offset(15)
            make.right.equalToSuperview().offset(-15)
            make.height.equalTo(20)
        }
        ratingLabel.snp.makeConstraints { make in
            make.top.equalTo(personNameLabel.snp.bottom).offset(5)
            make.left.equalTo(personImageView.snp.right).offset(15)
            make.width.equalTo(70)
            make.bottom.equalToSuperview().offset(-15)
        }
        
        ratingNumber.snp.makeConstraints { make in
            make.left.equalTo(ratingLabel.snp.right).offset(3)
            make.centerY.equalTo(ratingLabel.snp.centerY)
            make.bottom.equalToSuperview().offset(-15)
            make.width.equalTo(44)
        }
        
        numberOfPath.snp.makeConstraints { make in
            make.left.equalTo(ratingNumber.snp.right).offset(10)
            make.centerY.equalTo(ratingLabel.snp.centerY)
            make.bottom.equalToSuperview().offset(-15)
            make.width.equalTo(75)
        }
        
        pathCount.snp.makeConstraints { make in
            make.left.equalTo(numberOfPath.snp.right).offset(3)
            make.centerY.equalTo(ratingLabel.snp.centerY)
            make.bottom.equalToSuperview().offset(-15)
            make.width.equalTo(50)
        }
    }

}
