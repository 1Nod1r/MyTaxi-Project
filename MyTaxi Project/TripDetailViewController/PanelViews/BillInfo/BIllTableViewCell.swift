//
//  BIllTableViewCell.swift
//  MyTaxi Project
//
//  Created by Nodirbek on 21/06/22.
//

import UIKit

class BIllTableViewCell: UITableViewCell {

    static let id = "BIllTableViewCell"
    // --
    
    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondaryLabel
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Расчет стоимости"
        label.font = .systemFont(ofSize: 23, weight: .bold)
        return label
    }()
    
    private let mininumSumLabel: UILabel = {
        let label = UILabel()
        label.text = "Минимальная сумма"
        label.font = .systemFont(ofSize: 17)
        label.tintColor = .secondaryLabel
        return label
    }()
    
    private let totalSumLabel: UILabel = {
        let label = UILabel()
        label.text = "Сумма поездки"
        label.font = .systemFont(ofSize: 17)
        label.tintColor = .secondaryLabel
        return label
    }()
    
    private let awaitedSumLabel: UILabel = {
        let label = UILabel()
        label.text = "Цена ожидании"
        label.font = .systemFont(ofSize: 17)
        label.tintColor = .secondaryLabel
        return label
    }()
    
    // --
    
    private let minimumSumAnsLabel: UILabel = {
        let label = UILabel()
        label.text = "10.000"
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    private let totalSumAnsLabel: UILabel = {
        let label = UILabel()
        label.text = "31.000"
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    private let awaitedSumAnsLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 17, weight: .bold)
        return label
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
        addSubviews(lineView, titleLabel, totalSumLabel, totalSumAnsLabel, mininumSumLabel, minimumSumAnsLabel, awaitedSumLabel, awaitedSumAnsLabel)
        
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
        
        mininumSumLabel.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(15)
            make.height.equalTo(17)
            make.width.equalTo(170)
        }
        
        minimumSumAnsLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-10)
            make.top.equalTo(lineView.snp.bottom).offset(10)
            make.height.equalTo(17)
            make.width.equalTo(130)
        }
        
        totalSumLabel.snp.makeConstraints { make in
            make.top.equalTo(mininumSumLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(15)
            make.height.equalTo(17)
            make.width.equalTo(170)
        }
        
        totalSumAnsLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-10)
            make.top.equalTo(mininumSumLabel.snp.bottom).offset(10)
            make.height.equalTo(17)
            make.width.equalTo(130)
        }
        
        awaitedSumLabel.snp.makeConstraints { make in
            make.top.equalTo(totalSumLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(15)
            make.height.equalTo(17)
            make.width.equalTo(170)
        }
        
        awaitedSumAnsLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-10)
            make.top.equalTo(totalSumLabel.snp.bottom).offset(10)
            make.height.equalTo(17)
            make.width.equalTo(30)
        }
    }
}
