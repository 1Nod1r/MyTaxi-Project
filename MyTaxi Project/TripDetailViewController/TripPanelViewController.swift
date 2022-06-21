//
//  TripPanelViewController.swift
//  MyTaxi Project
//
//  Created by Nodirbek on 20/06/22.
//

import UIKit

class TripPanelViewController: UIViewController {
    
    let panelView = PanelView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(panelView)
        panelView.table.delegate = self
        panelView.table.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        panelView.frame = view.bounds
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIDevice.current.setValue(UIDeviceOrientation.portrait.rawValue, forKey: "orientation")
        AppDelegate.orientationLock = .portrait
    }
}

extension TripPanelViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PanelLocationTableViewCell.id, for: indexPath) as? PanelLocationTableViewCell else { return UITableViewCell() }
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PanelHelpTableViewCell.id, for: indexPath) as? PanelHelpTableViewCell else { return UITableViewCell() }
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PersonTableViewCell.id, for: indexPath) as? PersonTableViewCell else { return UITableViewCell() }
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: GeneralInfoTableViewCell.id, for: indexPath) as? GeneralInfoTableViewCell else { return UITableViewCell() }
            return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BIllTableViewCell.id, for: indexPath) as? BIllTableViewCell else { return UITableViewCell() }
            return cell
        case 5:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TotalInfoTableViewCell.id, for: indexPath) as? TotalInfoTableViewCell else { return UITableViewCell() }
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return PanelHeaderView.prefferedHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: PanelHeaderView.id) as? PanelHeaderView else { return nil }
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 1,2,4:
            return 120
        case 3:
            return 180
        case 5:
            return 60
        default:
            return 80
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // do smthng
    }
    
}
