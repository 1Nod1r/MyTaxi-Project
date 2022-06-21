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
        .init(image: UIImage(named: "question")!, backgroundColor: UIColor(hex: "FDF8EA")),
        .init(image: UIImage(named: "retry")!, backgroundColor: UIColor(hex: "EDF2FC")),
        .init(image: UIImage(named: "call")!, backgroundColor: UIColor(hex: "F0F9F3"))
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
