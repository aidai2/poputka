//
//  MainViewController.swift
//  poputka
//
//  Created by ITLabAdmin on 7/3/18.
//  Copyright © 2018 ITLabAdmin. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation
import Jelly

class MainViewController: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate {
    
    private var mapView = GMSMapView()
    private var button = UIButton()
    
    override func viewDidLoad() {
        
        setupNavigationBar()
        setupImage()
        setupMenuBarButton()
        setupFormButton()
        setupRightBarButton()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupGoogleMap()
    }
    
    private func setupJelly() {
        var jellyAnimator: JellyAnimator?
        let customCornerSlideInPresentation = JellySlideInPresentation(cornerRadius: 23,
                                                                       backgroundStyle: .dimmed(alpha: 0.3),
                                                                       jellyness: .jelly,
                                                                       duration: .medium,
                                                                       directionShow: .bottom,
                                                                       directionDismiss: .right,
                                                                       widthForViewController: .custom(value: view.frame.size.width - 64),
                                                                       heightForViewController: .custom(value: view.frame.size.height-128))
        
        let vc = viewControllerWith(identifier: "FormViewController", storyboard: "Main")
        jellyAnimator = JellyAnimator(presentation: customCornerSlideInPresentation)
        jellyAnimator?.prepare(viewController: vc)
        present(vc, animated: true, completion: nil)
    }
    
    private func setupFormButton() {
        button = UIButton(frame: CGRect(x: view.frame.midX - 30, y: view.frame.size.height - 80, width: 60, height: 60))
        button.addTarget(self, action: #selector(formButtonClicked), for: .touchUpInside)
        button.setImage(#imageLiteral(resourceName: "formeButton"), for: .normal)
        view.addSubview(button)
    }
    
    @objc private func formButtonClicked() {
        setupJelly()
        
    }
    private func setupRightBarButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image:#imageLiteral(resourceName: "profile"),
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(showProfilePage))
    }
    
    @objc private func showProfilePage() {
        let vc = viewControllerWith(identifier: "ProfileViewController", storyboard: "Profile")
        let nvc = UINavigationController(rootViewController: vc)
        present(nvc, animated: true, completion: nil)
    }
    
    private func setupImage() {
        let image: UIImage = UIImage(named: "blue_logo")!
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 40))
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        navigationItem.titleView = imageView
    }
    
    private func setupGoogleMap() {
        
        if CLLocationManager.locationServicesEnabled() {
            
            
            let locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
        }
    
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        var currentLocation: CLLocation!
        let zoomLevel: Float = 16.1
        if( CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() ==  .authorizedAlways){
            
            currentLocation = manager.location
            
            let camera = GMSCameraPosition.camera(withLatitude: currentLocation.coordinate.latitude, longitude: currentLocation.coordinate.longitude, zoom: zoomLevel)
            mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
            
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
            marker.position = CLLocationCoordinate2D(latitude: currentLocation.coordinate.latitude, longitude: currentLocation.coordinate.longitude)
            marker.title = "AUCA"
            marker.snippet = "Bishkek"
            marker.map = mapView
            marker.icon = #imageLiteral(resourceName: "marker")
        }
        
    }
}
