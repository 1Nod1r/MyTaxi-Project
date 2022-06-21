//
//  SideMenuView.swift
//  MyTaxi Project
//
//  Created by Nodirbek on 20/06/22.
//

import UIKit
import SnapKit

class SideMenuView: UIView {
    private var tabelViewModel: [SideMenuTableViewCell.ViewModel] = [
        .init(image: UIImage(systemName: "location.circle")!,
              title: "Мои поездки"),
        .init(image: UIImage(named: "wallet")!,
              title: "Способы оплаты"),
        .init(image: UIImage(systemName: "star.fill")!,
              title: "Избранные адреса"),
    ]
    var completion: (() -> ())?
    private let headerView = HeaderView()
    private let table: UITableView = {
        let table = UITableView()
        table.separatorStyle = .none
        table.rowHeight = 70.75
        table.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        table.showsVerticalScrollIndicator = false
        table.isScrollEnabled = false
        table.backgroundColor = UIColor.init(hex: "1B1B19")
        table.register(SideMenuTableViewCell.self, forCellReuseIdentifier: SideMenuTableViewCell.identifier)
        return table
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        table.delegate = self
        table.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }
    
    
    private func setupUI(){
        addSubviews(headerView, table)
        backgroundColor = UIColor.init(hex: "1B1B19")
        headerView.layer.cornerRadius = 10
        headerView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(6)
            make.right.equalToSuperview().offset(-6)
            make.top.equalToSuperview().offset(50)
            make.height.equalTo(100)
        }
        table.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom)
            make.left.bottom.right.equalToSuperview()
        }
    }
    

}
extension SideMenuView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tabelViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SideMenuTableViewCell.identifier, for: indexPath) as? SideMenuTableViewCell else { return UITableViewCell() }
        let model = tabelViewModel[indexPath.row]
        cell.configure(with: model)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            //Go to next vc
            completion?()
        }
        else {
            print("sd")
        }
    }
    
}
