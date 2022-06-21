//
//  MainBottomView.swift
//  MyTaxi Project
//
//  Created by Nodirbek on 20/06/22.
//

import UIKit

class MainBottomView: UIView {
    
    // MARK: Properties
    private var tabelViewModel: [MainTableViewCell.ViewModel] = [
        .init(image: UIImage(named: "pinImage64")!,
              title: "5а улица Асадуллы Ходжаева",
              font: .systemFont(ofSize: 18,
                                weight: .ultraLight)),
        .init(image: UIImage(named: "roundImage64")!,
              title: "Куда?",
              font: .systemFont(ofSize: 18,
                                weight: .bold))
    ]
    
    private let table: UITableView = {
        let table = UITableView()
        table.rowHeight = 70.75
        table.separatorStyle = .none
        table.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        table.showsVerticalScrollIndicator = false
        table.isScrollEnabled = false
        table.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.identifier)
        return table
    }()
    
    // MARK: - Init
    
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
        addSubview(table)
        table.frame = self.bounds
    }
      
}

extension MainBottomView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tabelViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as? MainTableViewCell else { return UITableViewCell() }
        let model = tabelViewModel[indexPath.row]
        cell.configure(with: model)
        return cell
    }
}
