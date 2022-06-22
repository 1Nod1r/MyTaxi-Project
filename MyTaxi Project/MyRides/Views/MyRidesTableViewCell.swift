//
//  MyRidesTableViewCell.swift
//  MyTaxi Project
//
//  Created by Nodirbek on 20/06/22.
//

import UIKit

class MyRidesTableViewCell: UITableViewCell {

    static let identifier = "MyRidesTableViewCell"
    
    struct ViewModel {
        let firsLocation: String
        let secondLocation: String
        let startTime: String
        let endTime: String
        let carImage: UIImage
    }
    
    private let shadowView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor(hex: "EAEEF9").cgColor
        view.backgroundColor = .white
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let grayView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "F8F8F8")
        return view
    }()
    
    private let firstLocation: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    private let secondLocation: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    private let startTime: UILabel = {
        let label = UILabel()
        label.text = "22:18"
        label.font = .systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    private let endTime: UILabel = {
        let label = UILabel()
        label.text = "22:19"
        label.font = .systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    private let carImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "redCar")
        imageView.clipsToBounds = true
        return imageView
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
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }
    
    private func setupUI(){
        addSubview(shadowView)
        shadowView.addSubviews(firstLocation, secondLocation, blueImageView, redImageView,grayView)
        grayView.addSubviews(startTime, endTime, carImageView)
        shadowView.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(20)
            make.right.bottom.equalToSuperview().offset(-20)
        }
        
        blueImageView.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(15)
            make.height.width.equalTo(30)
        }
        
        redImageView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.top.equalTo(blueImageView.snp.bottom).offset(15)
            make.height.width.equalTo(30)
        }
        
        firstLocation.snp.makeConstraints { make in
            make.centerY.equalTo(blueImageView.snp.centerY)
            make.left.equalTo(blueImageView.snp.right).offset(20)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(18)
        }
        
        secondLocation.snp.makeConstraints { make in
            make.centerY.equalTo(redImageView.snp.centerY)
            make.left.equalTo(redImageView.snp.right).offset(20)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(18)
        }
        
        grayView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(65)
        }
        
        startTime.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.centerY.equalToSuperview()
            make.bottom.equalToSuperview().offset(-15)
            make.width.equalTo(75)
        }
        
        endTime.snp.makeConstraints { make in
            make.left.equalTo(startTime.snp.right)
            make.top.equalTo(15)
            make.centerY.equalToSuperview()
            make.width.equalTo(75)
        }
        
        carImageView.snp.makeConstraints { make in
            make.right.bottom.equalToSuperview().offset(-5)
            make.width.equalTo(108)
            make.height.equalTo(39)
        }
    }
    
    public func configue(with model: ViewModel){
        firstLocation.text = model.firsLocation
        secondLocation.text = model.secondLocation
        startTime.text = model.startTime
        endTime.text = model.endTime
        carImageView.image = model.carImage
    }
}
