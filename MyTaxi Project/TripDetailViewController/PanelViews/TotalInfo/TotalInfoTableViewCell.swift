//
//  TotalInfoTableViewCell.swift
//  MyTaxi Project
//
//  Created by Nodirbek on 21/06/22.
//

import UIKit

class TotalInfoTableViewCell: UITableViewCell {

    static let id = "TotalInfoTableViewCell"
    
    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondaryLabel
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Итого"
        label.font = .systemFont(ofSize: 23, weight: .bold)
        return label
    }()
    
    private let sumLabel: UILabel = {
        let label = UILabel()
        label.text = "39,600 UZS"
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 23, weight: .bold)
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
        addSubviews(titleLabel, sumLabel, lineView)
        
        lineView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.equalTo(1)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp.bottom).offset(15)
            make.left.equalToSuperview().offset(15)
            make.height.equalTo(23)
            make.width.equalTo(130)
        }
        
        sumLabel.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp.bottom).offset(15)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(23)
            make.width.equalTo(150)
        }
        
    }
}
