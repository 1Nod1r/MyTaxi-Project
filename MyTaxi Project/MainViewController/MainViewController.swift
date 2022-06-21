//
//  ViewController.swift
//  MyTaxi Project
//
//  Created by Nodirbek on 20/06/22.
//

import UIKit
import SideMenu
import MapboxMaps


class MainViewController: UIViewController{
    // MARK: Properties
    var menu: SideMenuNavigationController?
    let mainView = MainView()
    internal var cameraLocationConsumer: CameraLocationConsumer!
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureMapView()
        configureSideMenu()
        configureNavigationController()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIDevice.current.setValue(UIDeviceOrientation.portrait.rawValue, forKey: "orientation")
        AppDelegate.orientationLock = .portrait
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.addSubview(mainView)
        mainView.frame = view.bounds
    }

    // MARK: - Private
    
    private func configureUI(){
        mainView.locationButton.addTarget(self, action: #selector(didTapLocation), for: .touchUpInside)
    }
    
    private func configureNavigationController(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "menuButtonImage")!, style: .done, target: self, action: #selector(menuButtonClicked))
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    private func configureSideMenu(){
        menu = SideMenuNavigationController(rootViewController: SideMenuViewController())
        menu?.leftSide = true
    }
    
    @objc private func menuButtonClicked(){
        present(menu ?? UIViewController(),animated: true)
    }
    
    @objc private func didTapLocation(){
        // Do some stuff here ...
        print("Location button tapped")
    }
    private func configureMapView(){
        cameraLocationConsumer = CameraLocationConsumer(mapView: mainView.mapView)
        mainView.mapView.location.options.puckType = .puck2D()
        mainView.mapView.location.delegate = self
        mainView.mapView.mapboxMap.onNext(.mapLoaded) {[weak self] _ in
            // Register the location consumer with the map
            self?.mainView.mapView.location.addLocationConsumer(newConsumer: self!.cameraLocationConsumer)
        }
    }

}

extension MainViewController: LocationPermissionsDelegate {

    func locationManager(_ locationManager: LocationManager, didChangeAccuracyAuthorization accuracyAuthorization: CLAccuracyAuthorization) {
        if accuracyAuthorization == .reducedAccuracy {
            
        }
    }
}

// class which conforms to LocationConsumer, update the camera's centerCoordinate when a locationUpdate is received
public class CameraLocationConsumer: LocationConsumer {
    weak var mapView: MapView?

    init(mapView: MapView) {
        self.mapView = mapView
    }

    public func locationUpdate(newLocation: Location) {
        mapView?.camera.ease(
            to: CameraOptions(center: newLocation.coordinate, zoom: 15),
            duration: 1.3)
    }
}
