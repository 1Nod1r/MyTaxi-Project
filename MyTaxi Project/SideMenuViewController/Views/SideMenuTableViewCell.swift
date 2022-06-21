//
//  SideMenuTableViewCell.swift
//  MyTaxi Project
//
//  Created by Nodirbek on 20/06/22.
//

import UIKit

class SideMenuTableViewCell: UITableViewCell {
    
    static let identifier = "SideMenuTableViewCell"
    
    // MARK: ViewModel
    struct ViewModel {
        let image: UIImage
        let title: String
    }
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        imageView.tintColor = .white
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(hex: "272724")
        return view
    }()
    
    private let shadowView: UIView = {
        let view = UIView()
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }
    
    private func setupUI(){
        backgroundColor = UIColor.init(hex: "1B1B19")
        addSubview(shadowView)
        shadowView.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(10)
            make.right.bottom.equalToSuperview().offset(-10)
        }

        shadowView.addSubview(iconImageView)
        iconImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(10)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
        
        shadowView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(iconImageView.snp.right).offset(10)
            make.right.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        shadowView.addSubview(lineView)
        lineView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.right.left.equalToSuperview()
            make.width.equalTo(1)
            make.height.equalTo(1)
        }
    }
    
    public func configure(with model: ViewModel){
        iconImageView.image = model.image
        titleLabel.text = model.title
    }
}
