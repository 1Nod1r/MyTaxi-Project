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
    }
    
    private func setupUI(){
        addSubview(customView)
        customView.addSubview(customImageView)
        customView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        customImageView.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(15)
            make.right.bottom.equalToSuperview().offset(-15)
        }
    }
    
}
