//
//  MainViewController.swift
//  poputka
//
//  Created by ITLabAdmin on 7/3/18.
//  Copyright © 2018 ITLabAdmin. All rights reserved.
//

import UIKit
import  GoogleMaps

var latitude = 42.810837
var longitude = 74.627434
var zoomLevel: Float = 16.1


class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let image : UIImage = UIImage(named: "blue_logo")!
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 40))
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        self.navigationItem.titleView = imageView

        
        
        let camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: zoomLevel)
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
        marker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
//        marker.title = "AUCA"
//        marker.snippet = "Bishkek"
        marker.map = mapView
        

//        setupMenuBarButton()
        
    }

    
}
