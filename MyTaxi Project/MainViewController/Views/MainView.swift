//
//  MainView.swift
//  MyTaxi Project
//
//  Created by Nodirbek on 20/06/22.
//

import UIKit
import SnapKit
import SideMenu
import MapboxMaps

class MainView: UIView {
    
    // MARK: Properties
    internal var mapView: MapView!
    private let mainBottomView = MainBottomView()
    
    let locationButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        let image = UIImage(systemName: "location.circle.fill")
        button.setImage(image!, for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private let pinImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        imageView.image = UIImage(named: "pinImage")
        return imageView
    }()

    
    // MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureMapView()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        setupUI()
    }
    
    // MARK: - Private
    
    private func configureMapView(){
        let myResourceOptions = ResourceOptions(accessToken: "pk.eyJ1Ijoibm9kaXJiZWsyMjMiLCJhIjoiY2w0bW9zNnQ1MTdmMTNxbWh1NGJmbXZzNSJ9.Yx8jW3VwD0l5MoUjLRvqPg")
        let myMapInitOptions = MapInitOptions(resourceOptions: myResourceOptions, cameraOptions: CameraOptions(zoom: 15.0))
        mapView = MapView(frame: bounds, mapInitOptions: myMapInitOptions)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(mapView)
    }
    
    private func setupUI(){
        addSubview(mapView)
        mapView.addSubviews(pinImageView, mainBottomView, locationButton)
        mapView.frame = self.bounds
        pinImageView.center = self.center
        
        mainBottomView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.right.left.equalToSuperview()
            make.height.equalTo(200)
        }
        
        locationButton.snp.makeConstraints { make in
            make.bottom.equalTo(mainBottomView.snp.top).offset(-20)
            make.right.equalToSuperview().offset(-10)
            make.width.height.equalTo(40)
        }
        
    }

}


