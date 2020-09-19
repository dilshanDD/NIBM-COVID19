//
//  settingViewController.swift
//  NIBM COVID19
//
//  Created by DilshanKumarasingheMac on 9/13/20.
//  Copyright © 2020 NIBM. All rights reserved.
//


import UIKit
import MapKit
import Firebase

private let annotationIdentifier = "UserAnnotation"
private let reuseIdentifier = "LocationCell"


private enum ActionButtonConfiguration {
    case showMenu
    case dismissActionView
    
    init() {
        self = .showMenu
    }
}



class MapViewController: UIViewController {
    
    override func viewDidLoad() {
           super.viewDidLoad()
       config()
       configureLocationInputActivationView()
       enableLocationServices()
       fetchUserLocations()
        
             }
    
    // MARK: - Properties
    
    private let mapView = MKMapView()
    private let locationManager = LocationHandler.shared.locationManager

    private let actionButton: UIButton = {
          let button = UIButton(type: .system)
         
          button.addTarget(self, action: #selector(actionButtonPressed), for: .touchUpInside)
          return button
      }()
    
      private let inputActivationUIView = LocationInputActivationUIView()
      private var actionButtonConfig = ActionButtonConfiguration()
      private let tableView = UITableView()
      private var searchResults = [MKPlacemark]()
      private final let locationInputViewHeight: CGFloat = 200
      private let locationInputView = LocationInputView()
      private var route: MKRoute?
      var alertsArray = [String]()
    
    
   
    
     // MARK: - functions
    
    @objc func actionButtonPressed() {
         switch actionButtonConfig {
         case .showMenu:
             break
         case .dismissActionView:
             removeAnnotationsAndOverlays()
             mapView.showAnnotations(mapView.annotations, animated: true)
             
             UIView.animate(withDuration: 0.3) {
                 self.inputActivationUIView.alpha = 1
                 self.configureActionButton(config: .showMenu)
             }
             break
         }
     }
    
    func setupUi() {
        
        view.addSubview(mapView)
        mapView.frame = view.frame
        
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        mapView.delegate = self
         navigationController?.navigationBar.isHidden = false
    }
  
    
    func fetchUsers() {
          
          guard let location = locationManager?.location else { return }
          Service.shared.fetchUsersLocation(location: location) { (user) in
              guard let coordinate = user.location?.coordinate else { return }
              let annotation = UserAnnotation(uid: user.uid, coordinate: coordinate)
              
              var userIsVisible: Bool {
                
                  return self.mapView.annotations.contains { (annotation) -> Bool in
                      guard let userAnno = annotation as? UserAnnotation else { return false }
                      
                      if userAnno.uid == user.uid {
                          userAnno.updateAnnotationPosition(withCoordinate: coordinate)
                          return true
                      }
                      
                      return false
                  }
              }
              
              if !userIsVisible {
                  self.mapView.addAnnotation(annotation)
              }
          }
      }
    
    func fetchUserLocations() {
        
        var weightSum = 0
        var temparature = 0.0
        guard let location = locationManager?.location else { return }
        
        Service.shared.fetchUsersLocation(location: location) { (user) in
            guard let coordinate = user.location?.coordinate else { return }
            let annotation = UserAnnotation(uid: user.uid, coordinate: coordinate)
            
            weightSum = user.QA + user.QB + user.QC + user.QD
            temparature = Double(user.temparature)!
            
            var userIsVisible: Bool {
                
                return self.mapView.annotations.contains { (annotation) -> Bool in
                    guard let userAnno = annotation as? UserAnnotation else { return false }
                    if userAnno.uid == user.uid {
                    
                        if weightSum >= 9 {
                            userAnno.updateAnnotationPosition(withCoordinate: coordinate)
                            self.alertsArray.append(user.uid)

                            let uialert = UIAlertController(title: "Warning", message: "You are near to suspect of a covid 19. Avoid the Danger" , preferredStyle: UIAlertController.Style.alert)
                                           uialert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
                                           self.present(uialert, animated: true, completion: nil)


                        } else if temparature > 38 {
                            userAnno.updateAnnotationPosition(withCoordinate: coordinate)
                            self.alertsArray.append(user.uid)
                            
                            let uialert = UIAlertController(title: "Warning", message: "You are near to suspect of a covid 19. Avoid the Danger" , preferredStyle: UIAlertController.Style.alert)
                            uialert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
                            self.present(uialert, animated: true, completion: nil)
                            
                        } else {
                            
                            if let index = self.alertsArray.firstIndex(of: user.uid) {
                                self.alertsArray.remove(at: index)
                            }
                            self.mapView.removeAnnotation(annotation)
                        }

                        return true
                    }
                    return false
                }
            }
            if !userIsVisible {
                
                if weightSum >= 9 {
                    self.mapView.addAnnotation(annotation)
                    self.alertsArray.append(user.uid)
                } else if temparature > 38 {
                    self.mapView.addAnnotation(annotation)
                    self.alertsArray.append(user.uid)
                } else {
                    if let index = self.alertsArray.firstIndex(of: user.uid) {
                        self.alertsArray.remove(at: index)
                    }
                    self.mapView.removeAnnotation(annotation)
                }
                
            }
        }
    }
    
    
    func removeAnnotationsAndOverlays() {
          mapView.annotations.forEach { (annotation) in
              if let anno = annotation as? MKPointAnnotation {
                  mapView.removeAnnotation(anno)
              }
          }
          
          if mapView.overlays.count > 0 {
              mapView.removeOverlay(mapView.overlays[0])
          }
      }
    
    fileprivate func configureActionButton(config: ActionButtonConfiguration) {
        switch config {
        case .showMenu:
            self.actionButton.setImage(#imageLiteral(resourceName: "baseline_menu_black_36dp").withRenderingMode(.alwaysOriginal), for: .normal)
            self.actionButtonConfig = .showMenu
        case .dismissActionView:
            actionButton.setImage(#imageLiteral(resourceName: "baseline_arrow_back_black_36dp").withRenderingMode(.alwaysOriginal), for: .normal)
            actionButtonConfig = .dismissActionView
        }
    }
    
    func config() {
        configureUi()
        fetchUsers()
      //  fetchUserLocations()
    
    }
    func configureUi() {
          setupUi()


          view.addSubview(actionButton)
           actionButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor,
                               paddingTop: 16, paddingLeft: 20, width: 30, height: 30)
          
          configureTableView()

      }
    func configureLocationInputActivationView() {
        view.addSubview(inputActivationUIView)
        inputActivationUIView.centerX(inView: view)
        inputActivationUIView.setDimensions(height: 50, width: view.frame.width - 64)
        inputActivationUIView.anchor(top: actionButton.bottomAnchor, paddingTop: 32)
        inputActivationUIView.alpha = 0
        inputActivationUIView.delegate = self
        
        UIView.animate(withDuration: 2) {
            self.inputActivationUIView.alpha = 1
        }
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(LocationTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 60
        tableView.tableFooterView = UIView()
        
        let height = view.frame.height - locationInputViewHeight
        tableView.frame = CGRect(x: 0, y: view.frame.height, width: view.frame.width, height: height)
        
        view.addSubview(tableView)
    }
    
    func dismissLocationView(completion: ((Bool) -> Void)? = nil) {
          UIView.animate(withDuration: 0.3, animations: {
              self.locationInputView.alpha = 0
              self.tableView.frame.origin.y = self.view.frame.height
              self.locationInputView.removeFromSuperview()
              
          }, completion: completion)
      }
    
    func configureLocationInputView () {
        locationInputView.delegate = self
           
           view.addSubview(locationInputView)
           locationInputView.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 47, height: locationInputViewHeight)
           locationInputView.alpha = 0
           
           UIView.animate(withDuration: 0.5, animations: {
               self.locationInputView.alpha = 1
           }) { _ in
               UIView.animate(withDuration: 0.3) {
                   self.tableView.frame.origin.y = self.locationInputViewHeight
               }
           }
       }
}

// MARK: - MapView Functions
private extension MapViewController {
    
    func generatePolyline(toDestination destination: MKMapItem) {
         let request = MKDirections.Request()
         request.source = MKMapItem.forCurrentLocation()
         request.destination = destination
         request.transportType = .automobile
         
         let directionRequest = MKDirections(request: request)
         directionRequest.calculate { (response, error) in
             guard let response = response else { return }
             
         self.route = response.routes[0]
         guard let polyline = self.route?.polyline else { return }
         self.mapView.addOverlay(polyline)
         }
     }
    
    func searchBy(naturalLanguageQuery: String, completion: @escaping([MKPlacemark]) -> Void) {
          var results = [MKPlacemark]()
          
          let request = MKLocalSearch.Request()
          request.region = mapView.region
          request.naturalLanguageQuery = naturalLanguageQuery
          
          let search = MKLocalSearch(request: request)
          search.start { (response, error) in
              guard let response = response else { return }
              
              response.mapItems.forEach({ item in
                  results.append(item.placemark)
              })
              
              completion(results)
          }
      }
    
    
}

extension MapViewController: CLLocationManagerDelegate {
    func enableLocationServices() {
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationManager?.requestWhenInUseAuthorization()
        case .restricted, .denied:
            break
        case .authorizedWhenInUse:
            locationManager?.requestAlwaysAuthorization()
        case .authorizedAlways:
            locationManager?.startUpdatingLocation()
            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        default:
            break
        }
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
           
       }
}

// MARK: - MKMapViewDelegate
extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? UserAnnotation {
            let view = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            view.image = #imageLiteral(resourceName: "iconfinder_map-marker_299087-2")
          
            return view
        }
        
        return nil
    }

    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
         if let route = self.route {
             let polyline = route.polyline
             let lineRenderer = MKPolylineRenderer(overlay: polyline)
            lineRenderer.strokeColor = .mainBlueTint
             lineRenderer.lineWidth = 4
             return lineRenderer
         }
         return MKOverlayRenderer()
     }

}

// MARK: - LocationInputViewDelegate
extension MapViewController: LocationInputViewDelegate {
    func executeSearch(query: String) {
        searchBy(naturalLanguageQuery: query) { (results) in
            self.searchResults = results
            self.tableView.reloadData()
        }
    }
    
    func dismissLocationInputView() {
        dismissLocationView { _ in
            UIView.animate(withDuration: 0.5) {
                self.inputActivationUIView.alpha = 1
            }
        }
    }
}

// MARK: - LocationInputActivationUIViewDelegate
 extension MapViewController: LocationInputActivationUIViewDelegate {
    func presentLocationInputView() {
        inputActivationUIView.alpha = 0
        configureLocationInputView()
    }

}



// MARK: - UITableViewDelegate/DataSource
extension MapViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Searching places"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 2 : searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! LocationTableViewCell
        
        if indexPath.section == 1 {
            cell.placemark = searchResults[indexPath.row]
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedPlacemark = searchResults[indexPath.row]
        
        configureActionButton(config: .dismissActionView)
        
        let destination = MKMapItem(placemark: selectedPlacemark)
        generatePolyline(toDestination: destination)
        
        dismissLocationView { _ in
            let annotation = MKPointAnnotation()
            annotation.coordinate = selectedPlacemark.coordinate
            self.mapView.addAnnotation(annotation)
            self.mapView.selectAnnotation(annotation, animated: true)
            
            let annotations = self.mapView.annotations.filter({ !$0.isKind(of: UserAnnotation.self) })
            self.mapView.zoomToFit(annotations: annotations)
        }
        
    }
}
