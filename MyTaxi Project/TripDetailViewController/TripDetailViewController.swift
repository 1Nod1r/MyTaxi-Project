//
//  TripDetailViewController.swift
//  MyTaxi Project
//
//  Created by Nodirbek on 20/06/22.
//

import UIKit
import FloatingPanel
import MapboxMaps

class TripDetailViewController: UIViewController {
    
    let tripDetailView = TripDetailView()
    internal var cameraLocationConsumer: CameraLocationConsumer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tripDetailView)
        configureMapView()
        tripDetailView.frame = view.bounds
        setupPanel()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIDevice.current.setValue(UIDeviceOrientation.portrait.rawValue, forKey: "orientation")
        AppDelegate.orientationLock = .portrait
    }
    
    private func setupPanel(){
        let vc = TripPanelViewController()
        let panel = FloatingPanelController(delegate: self)
        panel.set(contentViewController: vc)
        panel.track(scrollView: vc.panelView.table)
        panel.addPanel(toParent: self)
    }
    
    private func configureMapView(){
        cameraLocationConsumer = CameraLocationConsumer(mapView: tripDetailView.mapView)
        tripDetailView.mapView.location.options.puckType = .puck2D()
        tripDetailView.mapView.location.delegate = self
        tripDetailView.mapView.mapboxMap.onNext(.mapLoaded) {[weak self] _ in
            self?.tripDetailView.mapView.location.addLocationConsumer(newConsumer: self!.cameraLocationConsumer)
        }
    }
}

extension TripDetailViewController: FloatingPanelControllerDelegate {
    func floatingPanelDidChangeState(_ fpc: FloatingPanelController) {
        
    }
}

extension TripDetailViewController: LocationPermissionsDelegate {
    
}
