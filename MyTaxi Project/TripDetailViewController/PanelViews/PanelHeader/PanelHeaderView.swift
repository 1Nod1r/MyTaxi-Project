//
//  PanelHeaderView.swift
//  MyTaxi Project
//
//  Created by Nodirbek on 21/06/22.
//

import UIKit

class PanelHeaderView: UITableViewHeaderFooterView {

    static let id = "PanelHeaderView"
    static let prefferedHeight: CGFloat = 90
    
    private let carNumberView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 5
        view.backgroundColor = UIColor(hex: "FFFFFF")
        return view
    }()
    
    private let carNumberLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 23, weight: .bold)
        label.text = "25 | L 771 FA"
        return label
    }()
    
    private let carNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.tintColor = .secondarySystemBackground
        label.text = "Черный Chevrolet Malibu"
        return label
    }()
    
    private let carImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Lambo")
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }
    
    private func setupUI(){
        addSubviews(carNumberView, carNameLabel, carImageView)
        carNumberView.addSubview(carNumberLabel)
        
        carNumberView.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(15)
            make.height.equalTo(40)
            make.width.equalTo(150)
        }
        
        carNumberLabel.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(5)
            make.bottom.right.equalToSuperview().offset(-5)
        }
        
        carImageView.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-10)
            make.centerY.equalToSuperview()
            make.top.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().offset(-5)
            make.width.equalTo(100)
        }
        
        carNameLabel.snp.makeConstraints { make in
            make.top.equalTo(carNumberView.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(15)
            make.bottom.equalToSuperview().offset(-5)
            make.right.equalTo(carImageView.snp.left).offset(-5)
        }
    }
    
}
