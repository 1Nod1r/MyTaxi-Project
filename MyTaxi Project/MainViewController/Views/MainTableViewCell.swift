//
//  MainTableViewCell.swift
//  MyTaxi Project
//
//  Created by Nodirbek on 20/06/22.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    // MARK: ViewModel
    
    struct ViewModel {
        let image: UIImage
        let title: String
        let font: UIFont
    }
    
    // MARK: Properties
    
    static let identifier = "MainTableViewCell"
    
    var completion: ((Int) -> Void)?
    
    private let iconImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    private let nextView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    
    private let shadowView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor(hex: "EAEEF9").cgColor
        view.backgroundColor = .white
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        return view
    }()
    
    // MARK: Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    // MARK: - Private
    
    private func setupUI(){
        contentView.backgroundColor = UIColor(red: 0.984, green: 0.984, blue: 0.984, alpha: 1)
        
        contentView.addSubview(shadowView)
        shadowView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        shadowView.addSubview(iconImage)
        iconImage.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(30)
        }
        
        shadowView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(iconImage.snp.right).offset(10)
            make.right.equalToSuperview().offset(-10)
            make.centerY.equalToSuperview()
            make.height.equalTo(18)
        }
    }
    
    public func configure(with model: ViewModel){
        iconImage.image = model.image
        titleLabel.text = model.title
        titleLabel.font = model.font
    }
    
}
