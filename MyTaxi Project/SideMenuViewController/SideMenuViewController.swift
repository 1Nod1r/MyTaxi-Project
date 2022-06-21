//
//  SideMenuViewController.swift
//  MyTaxi Project
//
//  Created by Nodirbek on 20/06/22.
//

import UIKit

class SideMenuViewController: UIViewController {
    
    private let sideMenuView = SideMenuView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sideMenuView.completion = {[weak self] in
            let vc = MyRidesViewController()
            self?.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.addSubview(sideMenuView)
        sideMenuView.frame = view.bounds
    }

}
