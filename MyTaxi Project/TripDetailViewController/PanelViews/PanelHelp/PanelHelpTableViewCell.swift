//
//  PanelHelpTableViewCell.swift
//  MyTaxi Project
//
//  Created by Nodirbek on 21/06/22.
//

import UIKit

class PanelHelpTableViewCell: UITableViewCell {

    static let id = "PanelHelpTableViewCell"
    
    private var viewModel: [PanelHelpCollectionViewCell.ViewModel] = [
        .init(image: UIImage(named: "questionImage")!,
              backgroundColor: UIColor(hex: "FEF8E8"),
              tintColor: UIColor(hex: "EDB118"),
              title: "Помощь"),
        .init(image: UIImage(named: "retry")!,
              backgroundColor: UIColor(hex: "ECF2FD"),
              tintColor: UIColor(hex: "3F7BEB"),
              title: "Повторить"),
        .init(image: UIImage(named: "callImage")!,
              backgroundColor: UIColor(hex: "EEF9F2"),
              tintColor: UIColor(hex: "479F6A"),
              title: "Позвонить")
    ]
    
    private let helpCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 110, height: 90)
        let collecitonView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collecitonView.register(PanelHelpCollectionViewCell.self, forCellWithReuseIdentifier: PanelHelpCollectionViewCell.id)
        collecitonView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        collecitonView.isScrollEnabled = false
        collecitonView.showsHorizontalScrollIndicator = false
        return collecitonView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        helpCollectionView.delegate = self
        helpCollectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(helpCollectionView)
        helpCollectionView.frame = bounds
    }
}

extension PanelHelpTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PanelHelpCollectionViewCell.id, for: indexPath) as? PanelHelpCollectionViewCell else { return UICollectionViewCell()}
        let model = viewModel[indexPath.row]
        cell.configure(with: model)
        return cell
    }
}
