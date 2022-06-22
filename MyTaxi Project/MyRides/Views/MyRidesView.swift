//
//  MyRidesView.swift
//  MyTaxi Project
//
//  Created by Nodirbek on 20/06/22.
//

import UIKit

class MyRidesView: UIView {
    
    var caseSections: [String] = ["7 Марта, Вторник", "5 Июля, Вторник"]
    
    private var tableViewModel: [MyRidesTableViewCell.ViewModel] = [
        .init(firsLocation: "Chirchiq",
              secondLocation: "Toshkent",
              startTime: "19:15",
              endTime: "20:45",
              carImage: UIImage(named: "blackCar")!),
        .init(firsLocation: "Mirzo Ulug'bek",
              secondLocation: "Olmazor",
              startTime: "10:45",
              endTime: "12:00",
              carImage: UIImage(named: "grayCar")!),
        .init(firsLocation: "Oybek",
              secondLocation: "Beruniy",
              startTime: "12:00",
              endTime: "13:00",
              carImage: UIImage(named: "yellowCar")!),
        .init(firsLocation: "Chirchiq",
              secondLocation: "Toshkent",
              startTime: "19:15",
              endTime: "20:45",
              carImage: UIImage(named: "blackCar")!),
        .init(firsLocation: "Mirzo Ulug'bek",
              secondLocation: "Olmazor",
              startTime: "10:45",
              endTime: "12:00",
              carImage: UIImage(named: "grayCar")!),
        .init(firsLocation: "Oybek",
              secondLocation: "Beruniy",
              startTime: "12:00",
              endTime: "13:00",
              carImage: UIImage(named: "yellowCar")!),
    ]
    
    var completion: (() -> ())?
    
    private let table: UITableView = {
        let table = UITableView()
        table.rowHeight = 200
        table.separatorStyle = .none
        table.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        table.register(MyRidesTableViewCell.self, forCellReuseIdentifier: MyRidesTableViewCell.identifier)
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
        addSubview(table)
        table.frame = bounds
    }
}

extension MyRidesView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return caseSections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewModel.count / 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return caseSections[section]
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 29
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyRidesTableViewCell.identifier, for: indexPath) as? MyRidesTableViewCell else { return UITableViewCell() }
        let model = tableViewModel[indexPath.row]
        cell.configue(with: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        completion?()
    }
}
