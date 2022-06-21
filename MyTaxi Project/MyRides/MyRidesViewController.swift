//
//  MyRidesViewController.swift
//  MyTaxi Project
//
//  Created by Nodirbek on 20/06/22.
//

import UIKit

class MyRidesViewController: UIViewController {

    let myRides = MyRidesView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Мои поездки"
        navigationController?.navigationBar.prefersLargeTitles = true
        myRides.completion = {[weak self] in
            let vc = TripDetailViewController()
            self?.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIDevice.current.setValue(UIDeviceOrientation.portrait.rawValue, forKey: "orientation")
        AppDelegate.orientationLock = .portrait
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.addSubview(myRides)
        myRides.frame = view.bounds

    }

}
