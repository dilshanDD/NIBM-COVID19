//
//  MapViewController.swift
//  NIBM COVID19
//
//  Created by DilshanKumarasingheMac on 9/15/20.
//  Copyright © 2020 NIBM. All rights reserved.
//



import UIKit
import MapKit


class MapViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
       configureUI()
       enableLocationServices()
       
    }
    
   // MARK: - Properties
   private let inputActivationUIView = LocationInputActivationUIView ()
    private let mapView = MKMapView()
    private let locationManager = CLLocationManager()

    private let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Home", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(Back), for: .touchUpInside)

        return button
    }()

    //MARK: - Selectors
    @objc func Back() {
    navigationController?.popViewController(animated: true)
       }


    //MARK: - Helper Functions

    func configureUI() {
        
        
    inputActivationUIView.alpha = 0
    confugireMapView()
        
        
    UIView.animate(withDuration: 2) {
        self.inputActivationUIView.alpha = 1
    }      
   
        
   view.addSubview(inputActivationUIView)
   inputActivationUIView.centerX(inView: view)
   inputActivationUIView.setDimensions(height: 50, width: view.frame.width - 64)
   inputActivationUIView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)

        
        

    view.addSubview(mapView)
    mapView.frame = view.frame

//Back Button -...........
view.addSubview(closeButton)
closeButton.translatesAutoresizingMaskIntoConstraints = false
closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
closeButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
    }

func confugireMapView() {
       view.addSubview(mapView)
       mapView.frame = view.frame

       mapView.showsUserLocation = true
       mapView.userTrackingMode = .follow
   }
    
    // MARK: - Selectors
    
    @objc func handleShowLocationInputView() {
        
    }


    
}

//  MARK: - LocationServices
   extension MapViewController: CLLocationManagerDelegate {

        func enableLocationServices() {

            locationManager.delegate = self

            switch CLLocationManager.authorizationStatus() {
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
            case .restricted, .denied:
                break
            case .authorizedWhenInUse:
                locationManager.requestAlwaysAuthorization()
            case .authorizedAlways:
                locationManager.startUpdatingLocation()
                locationManager.desiredAccuracy = kCLLocationAccuracyBest
            default:
                break
            }
        }


       func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
             if status == .authorizedWhenInUse {
                 locationManager.requestAlwaysAuthorization()
             }
         }

}
extension MapViewController: LocationInputActivationUIViewDelegate {
    func presentLocationInputView() {
        
        inputActivationUIView.delegate = self
        print("DEBUG: LocationInputActivationUIViewDelegate called")
    }
}
