//
//  TripDetailView.swift
//  MyTaxi Project
//
//  Created by Nodirbek on 20/06/22.
//

import UIKit
import FloatingPanel
import MapboxMaps

class TripDetailView: UIView {

    internal var mapView: MapView!
    private let pinImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        imageView.image = UIImage(named: "pinImage")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureMapView()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    private func configureMapView(){
        let myResourceOptions = ResourceOptions(accessToken: "pk.eyJ1Ijoibm9kaXJiZWsyMjMiLCJhIjoiY2w0bW9zNnQ1MTdmMTNxbWh1NGJmbXZzNSJ9.Yx8jW3VwD0l5MoUjLRvqPg")
        let myMapInitOptions = MapInitOptions(resourceOptions: myResourceOptions, cameraOptions: CameraOptions(zoom: 15.0))
        mapView = MapView(frame: bounds, mapInitOptions: myMapInitOptions)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(mapView)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubviews(mapView)
        mapView.addSubview(pinImageView)
        pinImageView.center = mapView.center
        mapView.frame = bounds
        
    }

}
