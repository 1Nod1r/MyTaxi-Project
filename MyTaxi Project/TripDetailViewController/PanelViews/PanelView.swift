//
//  PanelViews.swift
//  MyTaxi Project
//
//  Created by Nodirbek on 20/06/22.
//

import UIKit

class PanelView: UIView {
    
    let table: UITableView = {
        let table = UITableView()
        table.register(PanelHeaderView.self, forHeaderFooterViewReuseIdentifier: PanelHeaderView.id)
        table.register(PanelLocationTableViewCell.self, forCellReuseIdentifier: PanelLocationTableViewCell.id)
        table.register(PanelHelpTableViewCell.self, forCellReuseIdentifier: PanelHelpTableViewCell.id)
        table.register(PersonTableViewCell.self, forCellReuseIdentifier: PersonTableViewCell.id)
        table.register(GeneralInfoTableViewCell.self, forCellReuseIdentifier: GeneralInfoTableViewCell.id)
        table.register(BIllTableViewCell.self, forCellReuseIdentifier: BIllTableViewCell.id)
        table.register(TotalInfoTableViewCell.self, forCellReuseIdentifier: TotalInfoTableViewCell.id)
        return table
    }() 
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(table)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        table.frame = bounds
    }

}
