//
//  PanelTableViewCell.swift
//  MyTaxi Project
//
//  Created by Nodirbek on 21/06/22.
//

import UIKit

class PanelLocationTableViewCell: UITableViewCell {

    static let id = "PanelLocationTableViewCell"
    
    private let firstLocation: UILabel = {
        let label = UILabel()
        label.text = "First location"
        label.font = .systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    private let secondLocation: UILabel = {
        let label = UILabel()
        label.text = "Second location"
        label.font = .systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    private let redImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "red")
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let blueImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "blue")
        imageView.clipsToBounds = true
        return imageView
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
        addSubviews(redImageView, blueImageView, firstLocation, secondLocation)
        
        redImageView.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(15)
            make.height.equalTo(25)
            make.width.equalTo(25)
        }
        
        blueImageView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.bottom.equalToSuperview().offset(-10)
            make.height.equalTo(25)
            make.width.equalTo(25)
        }
        
        firstLocation.snp.makeConstraints { make in
            make.left.equalTo(redImageView.snp.right).offset(10)
            make.right.equalToSuperview().offset(-10)
            make.centerY.equalTo(redImageView.snp.centerY)
            make.height.equalTo(18)
        }
        
        secondLocation.snp.makeConstraints { make in
            make.left.equalTo(blueImageView.snp.right).offset(10)
            make.right.equalToSuperview().offset(-10)
            make.centerY.equalTo(blueImageView.snp.centerY)
            make.height.equalTo(18)
        }
        
    }
    
}
