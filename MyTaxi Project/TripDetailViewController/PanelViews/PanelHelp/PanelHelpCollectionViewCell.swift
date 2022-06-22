//
//  PanelHelpCollectionViewCell.swift
//  MyTaxi Project
//
//  Created by Nodirbek on 21/06/22.
//

import UIKit

class PanelHelpCollectionViewCell: UICollectionViewCell {
    static let id = "PanelHelpCollectionViewCell"
    
    struct ViewModel {
        let image: UIImage
        let backgroundColor: UIColor
        let tintColor: UIColor
        let title: String
    }
    
    private let customImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let customView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }
    
    public func configure(with model: ViewModel){
        customImageView.image = model.image
        customView.backgroundColor = model.backgroundColor
        titleLabel.tintColor = model.tintColor
        titleLabel.text = model.title
    }
    
    private func setupUI(){
        addSubview(customView)
        customView.addSubviews(customImageView, titleLabel)
        customView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        customImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(20)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.height.equalTo(14)
            make.width.equalTo(100)
            make.centerX.equalToSuperview()
            make.top.equalTo(customImageView.snp.bottom).offset(10)
        }
    }
    
}
