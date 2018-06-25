//
//  ViewController.swift
//  poputka
//
//  Created by ITLabAdmin on 6/25/18.
//  Copyright © 2018 ITLabAdmin. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
    GMSServices.provideAPIKey("AIzaSyCcWt-XHPIQlnTtoa4zwQkxLNzp70vvL94")
        let camera = GMSCameraPosition.camera(withLatitude: 42.811525, longitude: 74.628816, zoom: 10.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        let currentLoc = CLLocationCoordinate2DMake(42.811525, 74.628816)
        let marker = GMSMarker(position: currentLoc)
        marker.title = "ty zdes'"
        marker.map = mapView
        
        
    }

  


}

