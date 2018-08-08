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

class MainViewController: UIViewController, CLLocationManagerDelegate, GMSMapViewDelegate {
    
    private var mapView = GMSMapView()
    private var button = UIButton()
    private var locationManager = CLLocationManager()
    private var marker = GMSMarker()
    private var currentUserAddress: String?
    var currentLocation: CLLocation?
    var routeView = UIView()
    private var check: Bool?
    
    override func viewDidLoad() {
        
        check = true
        setupNavigationBar()
        setupImage()
        setupMenuBarButton()
        setupRightBarButton()
        currentLocation = locationManager.location
        let tapOnRouteView = UITapGestureRecognizer(target: self, action: #selector(self.handleTapOnRouteView(tapGestureRecognizer:)))
        routeView.isUserInteractionEnabled = true
        routeView.addGestureRecognizer(tapOnRouteView)
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
        //setupFormButton()
        //setupSettingButton()
    }

    // setuping, initializing
    private func setupImage() {
        let image: UIImage = UIImage(named: "blue_logo")!
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 40))
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        navigationItem.titleView = imageView
    }
    
    private func setupRightBarButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image:#imageLiteral(resourceName: "profile"),
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(showProfilePage))
    }
    
    private func setupFormButton() {
        button = UIButton(frame: CGRect(x: view.frame.midX + 100, y: view.frame.size.height - 80, width: 60, height: 60))
        button.addTarget(self, action: #selector(formButtonClicked), for: .touchUpInside)
        button.setImage(#imageLiteral(resourceName: "formeButton"), for: .normal)
        view.addSubview(button)
    }
    @objc private func formButtonClicked() {
        locationManager.startUpdatingLocation()
        //setupJellyForm()
    }
    
    private func setupSettingButton() {
        button = UIButton(frame: CGRect(x: view.frame.midX - 160, y: view.frame.size.height - 80, width: 60, height: 60))
        button.addTarget(self, action: #selector(settingButtonClicked), for: .touchUpInside)
        button.setImage(#imageLiteral(resourceName: "setting"), for: .normal)
        view.addSubview(button)
    }
    @objc private func settingButtonClicked () {
        seetupJellySetting()
    }
    
    private func setupRouteView() {
        let routeFrame = CGRect(x: view.frame.midX - 80, y: view.frame.size.height - 80, width: 160, height: 50)
        routeView = UIView(frame: routeFrame)
        routeView.layer.cornerRadius = 30
        routeView.layer.borderWidth = 2
        routeView.layer.borderColor = Colors.blue.cgColor
        routeView.layer.backgroundColor = UIColor.white.cgColor
        
        let frame = CGRect(x: 16.0, y: 0.0, width: 160, height: 50)
        let text = UITextField(frame: frame)
        text.text = "Where to?"
        text.textColor = Colors.blue
        
        routeView.addSubview(text)
        view.addSubview(routeView)
    }
    
    @objc func handleTapOnRouteView(tapGestureRecognizer: UITapGestureRecognizer) {
        print("AMMMA TAPPED MAZAFAKA")
    }
    
    // jelly
    private func setupJellyForm() {
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
    
    private func seetupJellySetting() {
        var jellyAnimator: JellyAnimator?
        let customCornerSlideInPresentation = JellySlideInPresentation(cornerRadius: 23,
                                                                       backgroundStyle: .dimmed(alpha: 0.3),
                                                                       jellyness: .jelly,
                                                                       duration: .medium,
                                                                       directionShow: .bottom,
                                                                       directionDismiss: .right,
                                                                       widthForViewController: .custom(value: view.frame.size.width - 130),
                                                                       heightForViewController: .custom(value: view.frame.size.height-460))
        
        let vc = viewControllerWith(identifier: "SettingViewController", storyboard: "Main")
        jellyAnimator = JellyAnimator(presentation: customCornerSlideInPresentation)
        jellyAnimator?.prepare(viewController: vc)
        present(vc, animated: true, completion: nil)
    }
    
    @objc private func showProfilePage() {
        let vc = viewControllerWith(identifier: "ProfileViewController", storyboard: "Profile")
        let nvc = UINavigationController(rootViewController: vc)
        present(nvc, animated: true, completion: nil)
    }
    
    //location, map
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard status == .authorizedWhenInUse else {
            return
        }
        
        locationManager.startUpdatingLocation()
        
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        
        //mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
        
        let zoomLevel: Float = 16.1
        
        let camera = GMSCameraPosition.camera(withLatitude: (currentLocation?.coordinate.latitude)!, longitude: (currentLocation?.coordinate.longitude)!, zoom: zoomLevel)
        
        mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
        mapView.delegate = self
        self.view = mapView
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
        
        marker.position = CLLocationCoordinate2D(latitude: (currentLocation?.coordinate.latitude)!, longitude: (currentLocation?.coordinate.longitude)!)
        marker.title = "You are here"
        marker.snippet = currentUserAddress ?? "Krasauuuucheg"
        marker.map = mapView
        marker.icon = #imageLiteral(resourceName: "marker")
        
        locationManager.stopUpdatingLocation()
        
        
        setupFormButton()
        setupSettingButton()
        setupRouteView()
    }
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        mapView.clear()
        addMarker(coordinate: coordinate)
    }
    
    func addMarker(coordinate: CLLocationCoordinate2D) {
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
        marker.title = "Initial point"
        marker.snippet = ""
        marker.map = mapView
        marker.icon = #imageLiteral(resourceName: "marker")
    }

    
    //current address name
//    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
//        //marker.title = "Initial point"
//
//        //self.marker = marker
//        mapView.selectedMarker = marker
//        return true
//    }
//
//    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
//        reverseGeocodeCoordinate(coordinate: position.target)
//    }
    
//    private func reverseGeocodeCoordinate(coordinate: CLLocationCoordinate2D) {
//
//        let geocoder = GMSGeocoder()
//        //var lines: String?
//        //let coordinate = CLLocationCoordinate2D(latitude: tappedMarker.position.latitude, longitude: tappedMarker.position.longitude)
//
//        geocoder.reverseGeocodeCoordinate(coordinate) { response, error in
//            guard let address = response?.firstResult(), let lines = address.lines else {
//                return
//            }
//
//            //self.marker.title = "Initial point"
//            self.marker.snippet = lines.joined(separator: "\n")
//
////            print("AKJSFOIAHFJAOISFJAMOIFJAMOFL \(lines1)")
////            lines = lines1.joined(separator: "\n")
////            return lines!
//
//        }
//        //return lines!
//    }
    
}

//extension MainViewController: GMSMapViewDelegate {
//
//    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
//        reverseGeocodeCoordinate(position.target)
//    }
//}


