//
//  GeneralInfoTableViewCell.swift
//  MyTaxi Project
//
//  Created by Nodirbek on 21/06/22.
//

import UIKit

class GeneralInfoTableViewCell: UITableViewCell {

    static let id = "GeneralInfoTableViewCell"
    
    // --
    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondaryLabel
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Общие данные"
        label.font = .systemFont(ofSize: 23, weight: .bold)
        return label
    }()

    private let rateLabel: UILabel = {
        let label = UILabel()
        label.text = "Тариф"
        label.font = .systemFont(ofSize: 17)
        label.tintColor = .secondaryLabel
        return label
    }()
    
    private let payLabel: UILabel = {
        let label = UILabel()
        label.text = "Способы оплаты"
        label.font = .systemFont(ofSize: 17)
        label.tintColor = .secondaryLabel
        return label
    }()
    
    private let orderLabel: UILabel = {
        let label = UILabel()
        label.text = "Заказ"
        label.font = .systemFont(ofSize: 17)
        label.tintColor = .secondaryLabel
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Дата и время поездки"
        label.font = .systemFont(ofSize: 17)
        label.tintColor = .secondaryLabel
        return label
    }()
    
    private let longLabel: UILabel = {
        let label = UILabel()
        label.text = "Продолжительность поездки"
        label.font = .systemFont(ofSize: 17)
        label.tintColor = .secondaryLabel
        return label
    }()
    
    // --
    private let rateAnsNumber: UILabel = {
        let label = UILabel()
        label.text = "Бизнес"
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    private let payAnsNumber: UILabel = {
        let label = UILabel()
        label.text = "💰Наличными"
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    private let orderAnsNumber: UILabel = {
        let label = UILabel()
        label.text = "399131"
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    private let dateAnsNumber: UILabel = {
        let label = UILabel()
        label.text = "29 Август, 19:20"
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    private let longAnsNumber: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.text = "00:45"
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
        addSubviews(lineView, titleLabel, rateLabel, rateAnsNumber, payLabel, payAnsNumber, orderLabel, orderAnsNumber, dateLabel, dateAnsNumber, longAnsNumber, longLabel)
        
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
        
        rateLabel.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(15)
            make.height.equalTo(17)
            make.width.equalTo(70)
        }
        
        rateAnsNumber.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-10)
            make.top.equalTo(lineView.snp.bottom).offset(10)
            make.height.equalTo(17)
            make.width.equalTo(130)
        }
        
        payLabel.snp.makeConstraints { make in
            make.top.equalTo(rateLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(15)
            make.height.equalTo(17)
            make.width.equalTo(150)
        }
        
        payAnsNumber.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-10)
            make.top.equalTo(rateLabel.snp.bottom).offset(10)
            make.height.equalTo(17)
            make.width.equalTo(130)
        }
        
        orderLabel.snp.makeConstraints { make in
            make.top.equalTo(payLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(15)
            make.height.equalTo(17)
            make.width.equalTo(70)
        }
        
        orderAnsNumber.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-10)
            make.top.equalTo(payLabel.snp.bottom).offset(10)
            make.height.equalTo(17)
            make.width.equalTo(130)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(orderLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(15)
            make.height.equalTo(17)
            make.width.equalTo(190)
        }
        
        dateAnsNumber.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-10)
            make.top.equalTo(orderLabel.snp.bottom).offset(10)
            make.height.equalTo(17)
            make.width.equalTo(150)
        }
        
        longLabel.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(15)
            make.height.equalTo(17)
            make.width.equalTo(240)
        }
        
        longAnsNumber.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-10)
            make.top.equalTo(dateLabel.snp.bottom).offset(10)
            make.height.equalTo(17)
            make.width.equalTo(130)
        }
        
    }
}
