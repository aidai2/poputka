//
//  MainViewController.swift
//  poputka
//
//  Created by ITLabAdmin on 7/3/18.
//  Copyright © 2018 ITLabAdmin. All rights reserved.
//

import UIKit
import  GoogleMaps

class MainViewController: UIViewController, CLLocationManagerDelegate{
    
    override func viewDidLoad() {
        
        setupGoogleMap()
        setupNavigationBar()
        setupImage()
        setupMenuBarButton()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    private func setupImage() {
        let image: UIImage = UIImage(named: "blue_logo")!
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 40))
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        navigationItem.titleView = imageView
    }
    private func setupGoogleMap() {
//        let latitude = 42.810837
//        let longitude = 74.627434
        let zoomLevel: Float = 16.1
        let locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        let lat = locationManager.location?.coordinate.latitude
        let long = locationManager.location?.coordinate.longitude
        
        let camera = GMSCameraPosition.camera(withLatitude: lat!, longitude: long!, zoom: zoomLevel)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        
        do {
            if let styleURL = Bundle.main.url(forResource: "style", withExtension: "json") {
                mapView.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
            } else {
                NSLog("Unable to find style.json")
            }
        } catch {
            NSLog("One or more of the map styles failed to load. \(error)")
        }
        
        self.view = mapView
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: lat!, longitude: long!)
        marker.title = "AUCA"
        marker.snippet = "Bishkek"
        marker.map = mapView
    }
}
