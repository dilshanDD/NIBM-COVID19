//
//  homeViewController.swift
//  NIBM COVID19
//
//  Created by DilshanKumarasingheMac on 9/12/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import UIKit
import MapKit
import FirebaseAuth
import FirebaseDatabase
import Firebase

class homeViewController: UIViewController {

       override func viewDidLoad() {
           super.viewDidLoad()
        view.backgroundColor = .white
        checkIsUserLoggedIn()
        enableLocationServices()
        configureUI()
        //signOut()
 }
    
//Main Controllers
    let homepicviewController = UIView()
    let safeActionviewController = UIView()
    let notificationBellviewController = UIView()
    let caseupdateviewController = UIView()
    let mapviewController = UIView()
    let seeMoreController = UIView()
    let separatorView = UIView()
//Sub Controllers
    
    
    
    
    //MARK: - Selectors

    @objc func goSafeActions() {
        let safeActions = ASafeActionViewController()
        navigationController?.pushViewController(safeActions, animated: true)
        
    }
    @objc func goNotifications() {
        let notifications = notificationViewController()
        navigationController?.pushViewController(notifications, animated: true)
        
    }
    @objc func goUpdate() {
        let updates = updateViewController()
        navigationController?.pushViewController(updates, animated: true)
        
    }
    @objc func handleSettings() {
        let setting = settingViewController()
        navigationController?.pushViewController(setting, animated: true)
        
    }
    
    @objc func handleSeeMap() {
           let map = MapViewController()
           navigationController?.pushViewController(map, animated: true)
           
       }
      
      
    // MARK: - Propeties
    private let goPicture = UIImageView(image: #imageLiteral(resourceName: "pngwave"))
    private let homepicture = UIImageView(image: #imageLiteral(resourceName: "home"))
    private let bellpicture = UIImageView(image: #imageLiteral(resourceName: "WhatsApp Image 2020-09-17 at 1.01.22 PM"))
    
          private let ActiontitleLabel1: UILabel = {
          let label = UILabel()
          label.text = "All you need is"
          label.font = UIFont(name: "Avenir-Light", size: 16)
          label.textColor = UIColor.lightGray
          return label
          }()
    
        private let ActiontitleLabel2: UILabel = {
         let label = UILabel()
         label.text = "Stay at Home"
            label.font = UIFont.boldSystemFont(ofSize: 16)
         label.textColor = UIColor.lightGray
         
         return label
         }()
    
        let safeActionButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        attributedTitle.append(NSAttributedString(string: "Safe Actions",attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.mainBlueTint]))
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(goSafeActions), for: .touchUpInside)
        return button
         }()
    
//Notification Button............
    let notificationGoButton: UIButton = {
    let button = UIButton(type: .system)
    let attributedTitle = NSMutableAttributedString(string: "  NIBM is closed further notice ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.lightGray])
    attributedTitle.append(NSAttributedString(string: "Check",attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.orange]))
    button.setAttributedTitle(attributedTitle, for: .normal)
    button.addTarget(self, action: #selector(goNotifications), for: .touchUpInside)
    return button
     }()

//Bottom Buttons............................    
    
    private let homeButton: UIButton = {
             let button = UIButton(type: .system)
             button.setTitle("Home", for: .normal)
             button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        //     button.addTarget(self, action: #selector(handleSignIn), for: .touchUpInside)
             return button
     }()
    private let updateButton: UIButton = {
              let button = UIButton(type: .system)
              button.setTitle("Update", for: .normal)
              button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
              button.addTarget(self, action: #selector(goUpdate), for: .touchUpInside)
              return button
      }()
    private let settingsButton: UIButton = {
              let button = UIButton(type: .system)
              button.setTitle("Setting", for: .normal)
              button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
              button.addTarget(self, action: #selector(handleSettings), for: .touchUpInside)
              return button
      }()
// See more MAP .............................
    private let SeeMoreLabel1: UILabel = {
             let label = UILabel()
             label.text = "University Case Update"
             label.font = UIFont.boldSystemFont(ofSize: 12)
             label.textColor = UIColor.backgroundColor
             
             return label
             }()
    
    
    private let seeMapButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("See More", for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
            button.addTarget(self, action: #selector(handleSeeMap), for: .touchUpInside)
            button.tintColor = .purple
            return button
    }()
    
     private let mapView = MKMapView()
     private let locationManager = CLLocationManager()
    

    
    
    
    
       // MARK: - Lifecycale
    
    
    
    
    // MARK: - Helper Function
    
    func  configureUI() {

        confugireMapView()
        
        //....................
            view.addSubview(homepicviewController)
                homepicviewController.translatesAutoresizingMaskIntoConstraints = false
                homepicviewController.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
                homepicviewController.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5).isActive = true
                homepicviewController.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.5).isActive = true
                homepicviewController.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.3).isActive = true
                homepicviewController.backgroundColor = .backgroundColor
               
        //....................

            view.addSubview(safeActionviewController)
               safeActionviewController.translatesAutoresizingMaskIntoConstraints = false
               safeActionviewController.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
               safeActionviewController.leadingAnchor.constraint(equalTo: homepicviewController.trailingAnchor, constant: 0).isActive = true
               safeActionviewController.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.5).isActive = true
               safeActionviewController.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.3).isActive = true
                safeActionviewController.backgroundColor = .white
        //....................
                
          view.addSubview(notificationBellviewController)
              notificationBellviewController.translatesAutoresizingMaskIntoConstraints = false
              notificationBellviewController.topAnchor.constraint(equalTo: homepicviewController.bottomAnchor, constant: 0).isActive = true
              notificationBellviewController.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 0).isActive = true
              notificationBellviewController.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 1).isActive = true
              notificationBellviewController.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.1).isActive = true
                notificationBellviewController.backgroundColor = .white
        //....................
                
            view.addSubview(caseupdateviewController)
                caseupdateviewController.translatesAutoresizingMaskIntoConstraints = false
                caseupdateviewController.topAnchor.constraint(equalTo: notificationBellviewController.bottomAnchor, constant: 0).isActive = true
                caseupdateviewController.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5).isActive = true
                caseupdateviewController.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 1).isActive = true
                caseupdateviewController.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.2).isActive = true
                caseupdateviewController.backgroundColor = .blue
              
        //....................
                
            view.addSubview(mapviewController)
                mapviewController.translatesAutoresizingMaskIntoConstraints = false
                mapviewController.topAnchor.constraint(equalTo: caseupdateviewController.bottomAnchor, constant: 0).isActive = true
                mapviewController.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5).isActive = true
                mapviewController.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 1).isActive = true
                mapviewController.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.3).isActive = true
                mapviewController.backgroundColor = .blue
        //....................
                
                homepicviewController.addSubview(homepicture)
                   homepicture.translatesAutoresizingMaskIntoConstraints = false

                   homepicture.topAnchor.constraint(equalTo: homepicviewController.topAnchor).isActive = true
                   homepicture.leadingAnchor.constraint(equalTo: homepicviewController.leadingAnchor).isActive = true
                   homepicture.trailingAnchor.constraint(equalTo: homepicviewController.trailingAnchor).isActive = true
                   homepicture.bottomAnchor.constraint(equalTo: homepicviewController.bottomAnchor).isActive = true
                
        //MAP.....................
                mapviewController.addSubview(mapView)
                mapView.translatesAutoresizingMaskIntoConstraints = false

                mapView.topAnchor.constraint(equalTo: mapviewController.topAnchor).isActive = true
                mapView.leadingAnchor.constraint(equalTo: mapviewController.leadingAnchor).isActive = true
                mapView.trailingAnchor.constraint(equalTo: mapviewController.trailingAnchor).isActive = true
                mapView.bottomAnchor.constraint(equalTo: mapviewController.bottomAnchor).isActive = true
                
         //Safe Actions .................
                
                
                
                safeActionviewController.addSubview(ActiontitleLabel1)
                ActiontitleLabel1.translatesAutoresizingMaskIntoConstraints = false
                ActiontitleLabel1.topAnchor.constraint(equalTo: safeActionviewController.topAnchor, constant: 80).isActive = true
                ActiontitleLabel1.leadingAnchor.constraint(equalTo: safeActionviewController.leadingAnchor).isActive = true
                
                
                safeActionviewController.addSubview(ActiontitleLabel2)
                ActiontitleLabel2.translatesAutoresizingMaskIntoConstraints = false
                ActiontitleLabel2.topAnchor.constraint(equalTo: safeActionviewController.topAnchor, constant: 100).isActive = true
                ActiontitleLabel2.leadingAnchor.constraint(equalTo: safeActionviewController.leadingAnchor).isActive = true
               

                safeActionviewController.addSubview(safeActionButton)
                safeActionButton.translatesAutoresizingMaskIntoConstraints = false
                safeActionButton.topAnchor.constraint(equalTo: safeActionviewController.topAnchor, constant: 120).isActive = true
                safeActionButton.leadingAnchor.constraint(equalTo: safeActionviewController.leadingAnchor).isActive = true
              
        //----> Notification Sub Controllers
                    notificationBellviewController.addSubview(bellpicture)
                    bellpicture.translatesAutoresizingMaskIntoConstraints = false
                    bellpicture.bottomAnchor.constraint(equalTo: notificationBellviewController.bottomAnchor, constant: -20).isActive = true
                    bellpicture.leadingAnchor.constraint(equalTo: notificationBellviewController.leadingAnchor).isActive = true
                    bellpicture.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.08).isActive = true
                    bellpicture.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.04).isActive = true

                
                notificationBellviewController.addSubview(notificationGoButton)
                notificationGoButton.translatesAutoresizingMaskIntoConstraints = false

                notificationGoButton.topAnchor.constraint(equalTo: notificationBellviewController.topAnchor).isActive = true
                notificationGoButton.leadingAnchor.constraint(equalTo: bellpicture.trailingAnchor).isActive = true
                notificationGoButton.bottomAnchor.constraint(equalTo: notificationBellviewController.bottomAnchor).isActive = true
                
                  notificationBellviewController.addSubview(goPicture)
                  goPicture.translatesAutoresizingMaskIntoConstraints = false
                  goPicture.topAnchor.constraint(equalTo: notificationBellviewController.topAnchor, constant: 0).isActive = true
                  goPicture.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: 0).isActive = true
                  goPicture.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.1).isActive = true
                  goPicture.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.06).isActive = true
                
        //Univercity case update.....................
         
                
        //Bottom buttons.....................
                let bottomControlStackView = UIStackView(arrangedSubviews:[homeButton,updateButton,settingsButton])
                    bottomControlStackView.translatesAutoresizingMaskIntoConstraints = false
                    bottomControlStackView.distribution = .fillEqually
                    view.addSubview(bottomControlStackView)
                    
                    NSLayoutConstraint.activate([
                        bottomControlStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                        bottomControlStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                        bottomControlStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                        bottomControlStackView.heightAnchor.constraint(equalToConstant: 50),
                    ])

                
        // See more ........................
                
                caseupdateviewController.addSubview(seeMoreController)
                       seeMoreController.translatesAutoresizingMaskIntoConstraints = false
                       seeMoreController.topAnchor.constraint(equalTo: caseupdateviewController.topAnchor, constant: 0).isActive = true
                       seeMoreController.leadingAnchor.constraint(equalTo: caseupdateviewController.leadingAnchor, constant: 0).isActive = true
                       seeMoreController.trailingAnchor.constraint(equalTo: caseupdateviewController.trailingAnchor).isActive = true
                       seeMoreController.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.05).isActive = true
                       seeMoreController.backgroundColor = .white
                
        // See Map Button............................
                      caseupdateviewController.addSubview(seeMapButton)
                      seeMapButton.translatesAutoresizingMaskIntoConstraints = false
                      seeMapButton.topAnchor.constraint(equalTo: caseupdateviewController.topAnchor, constant: 2).isActive = true
                      seeMapButton.trailingAnchor.constraint(equalTo: caseupdateviewController.trailingAnchor).isActive = true
                      seeMapButton.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.05).isActive = true
                              
        // SeeMoreLabel1.........
                
                caseupdateviewController.addSubview(SeeMoreLabel1)
                SeeMoreLabel1.translatesAutoresizingMaskIntoConstraints = false
                SeeMoreLabel1.topAnchor.constraint(equalTo: caseupdateviewController.topAnchor, constant: 2).isActive = true
                SeeMoreLabel1.leadingAnchor.constraint(equalTo: caseupdateviewController.leadingAnchor, constant: 2).isActive = true
                SeeMoreLabel1.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.05).isActive = true
                
        //....Seperator
                caseupdateviewController.addSubview(separatorView)
                separatorView.backgroundColor = .lightGray
                separatorView.translatesAutoresizingMaskIntoConstraints = false
                separatorView.topAnchor.constraint(equalTo: caseupdateviewController.topAnchor, constant: 0).isActive = true
                separatorView.leadingAnchor.constraint(equalTo: caseupdateviewController.leadingAnchor, constant: 5).isActive = true
                separatorView.trailingAnchor.constraint(equalTo: caseupdateviewController.trailingAnchor, constant: -5).isActive = true
                separatorView.bottomAnchor.constraint(equalTo: SeeMoreLabel1.topAnchor).isActive = true
        func configureNavigationBar() {
            navigationController?.navigationBar.isHidden = true
            navigationController?.navigationBar.barStyle = .black
        }
    }
  
    func confugireMapView() {
          view.addSubview(mapView)
          mapView.frame = view.frame
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
            //   configureUI()
               print("DEBUG: User is logged in..")
           }
       }
       
       @objc func signOut() {
           do {
               try Auth.auth().signOut()
            print("Signout !");
           } catch {
               print("DEBUG: sign out error")
           }
       }
    
    
    
}

//  MARK: - LocationServices
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


