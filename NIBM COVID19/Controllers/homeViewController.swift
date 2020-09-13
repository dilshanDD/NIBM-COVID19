//
//  homeViewController.swift
//  NIBM COVID19
//
//  Created by DilshanKumarasingheMac on 9/12/20.
//  Copyright © 2020 NIBM. All rights reserved.
//
import FirebaseAuth
import UIKit
import MapKit


class homeViewController: UIViewController {

       override func viewDidLoad() {
           super.viewDidLoad()
       //    checkIsUserLoggedIn()
      //     enableLocationServices()
        view.backgroundColor = .yellow
      
       configureUI()
 //....................
    view.addSubview(homepicview)
        homepicview.translatesAutoresizingMaskIntoConstraints = false
        homepicview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        homepicview.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5).isActive = true
        homepicview.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.5).isActive = true
        homepicview.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.3).isActive = true
        homepicview.backgroundColor = .red
//....................

    view.addSubview(safeActionview)
       safeActionview.translatesAutoresizingMaskIntoConstraints = false
       safeActionview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
       safeActionview.leadingAnchor.constraint(equalTo: homepicview.trailingAnchor, constant: 5).isActive = true
       safeActionview.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.5).isActive = true
       safeActionview.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.3).isActive = true
       safeActionview.backgroundColor = .red
//....................
        
  view.addSubview(notificationBellview)
      notificationBellview.translatesAutoresizingMaskIntoConstraints = false
      notificationBellview.topAnchor.constraint(equalTo: homepicview.bottomAnchor, constant: 10).isActive = true
      notificationBellview.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5).isActive = true
      notificationBellview.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 1).isActive = true
      notificationBellview.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.1).isActive = true
       notificationBellview.backgroundColor = .blue
//....................
        
    view.addSubview(caseupdateview)
        caseupdateview.translatesAutoresizingMaskIntoConstraints = false
        caseupdateview.topAnchor.constraint(equalTo: notificationBellview.bottomAnchor, constant: 10).isActive = true
        caseupdateview.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5).isActive = true
        caseupdateview.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 1).isActive = true
        caseupdateview.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.2).isActive = true
        caseupdateview.backgroundColor = .blue
      
//....................
        
    view.addSubview(mapview)
        mapview.translatesAutoresizingMaskIntoConstraints = false
        mapview.topAnchor.constraint(equalTo: caseupdateview.bottomAnchor, constant: 10).isActive = true
        mapview.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5).isActive = true
        mapview.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 1).isActive = true
        mapview.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.3).isActive = true
        mapview.backgroundColor = .blue
//....................
    view.addSubview(homeButton)
        homeButton.translatesAutoresizingMaskIntoConstraints = false
        homeButton.topAnchor.constraint(equalTo: mapview.bottomAnchor, constant: 10).isActive = true
        homeButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5).isActive = true
        homeButton.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.3).isActive = true
        homeButton.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.1).isActive = true
        homeButton.backgroundColor = .blue
//....................
        
    view.addSubview(updateButton)
        updateButton.translatesAutoresizingMaskIntoConstraints = false
        updateButton.topAnchor.constraint(equalTo: mapview.bottomAnchor, constant: 10).isActive = true
        updateButton.leadingAnchor.constraint(equalTo:homeButton.trailingAnchor, constant: 10).isActive = true
        updateButton.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.32).isActive = true
        updateButton.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.1).isActive = true
        updateButton.backgroundColor = .blue
//....................
                
    view.addSubview(settingButton)
        settingButton.translatesAutoresizingMaskIntoConstraints = false
        settingButton.topAnchor.constraint(equalTo: mapview.bottomAnchor, constant: 10).isActive = true
        settingButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: 5).isActive = true
        settingButton.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.3).isActive = true
        settingButton.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.1).isActive = true
         settingButton.backgroundColor = .blue
 
        
        
        
       }
    let homepicview = UIView()
    let safeActionview = UIView()
    let notificationBellview = UIView()
    let caseupdateview = UIView()
    let mapview = UIView()
    let homeButton = UIView()
    let updateButton = UIView()
    let settingButton = UIView()
    
    
        
        // MARK: - Properties
    // MARK: - Propeties
      private let titleLabel: UILabel = {
          let label = UILabel()
          label.text = "Sign in"
          label.font = UIFont(name: "Avenir-Light", size: 36)
          label.textColor = UIColor(white: 1, alpha: 0.8)
          
          return label
      }()
      
      private lazy var emailContainerView: UIView = {
                 let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_mail_outline_white_2x"), textField: emailTextFiled)
                 view.heightAnchor.constraint(equalToConstant: 50).isActive = true
                 return view
                 }()
    
 
    
      private let emailTextFiled: UITextField = {
                  return UITextField().textField(withPlaceholder: "Email", isSecureTextEntry: false)
                 }()

    
      private let signInButton: SafeActionUIButton = {
              let button = SafeActionUIButton(type: .system)
              button.setTitle("Safe actions", for: .normal)
              button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
              button.addTarget(self, action: #selector(signOut), for: .touchUpInside)
              return button
      }()
    
 
    
    
    
    
     private let mapView = MKMapView()
     private let locationManager = CLLocationManager()
    

    
    
    
    
       // MARK: - Lifecycale
    
    
    
    
    // MARK: - Helper Function
    
    func configureUI() {

        view.backgroundColor = .backgroundColor
        
              
        
    
//        view.addSubview(mapView)
//        mapView.frame = view.frame
//
//        confugireMapView()
    
    } 
    
   

    func confugireMapView() {
        view.addSubview(mapView)
     //   mapView.frame = view.frame
        
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
    }
    
       //MARK: API
    
       func checkIsUserLoggedIn() {
           if(Auth.auth().currentUser?.uid == nil) {
            DispatchQueue.main.async {
              let nav = UINavigationController(rootViewController: loginViewController())
              nav.modalPresentationStyle = .fullScreen
              self.present(nav, animated: true, completion: nil)
                      }
           } else {
               configureUI()
               print("DEBUG: User is logged in..")
           }
       }
       
       @objc func signOut() {
           do {
               try Auth.auth().signOut()
           } catch {
               print("DEBUG: sign out error")
           }
       }
    
    
    // MARK: - LocationServices
}


 // MARK: - LocationServices
   extension homeViewController: CLLocationManagerDelegate {
        
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
