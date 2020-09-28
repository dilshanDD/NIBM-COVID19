//
//  UserAnnotation.swift
//  NIBM COVID19
//
//  Created by DilshanKumarasingheMac on 9/16/20.
//  Copyright © 2020 NIBM. All rights reserved.
//

import Foundation
import MapKit

class UserAnnotation: NSObject, MKAnnotation {
    dynamic var coordinate: CLLocationCoordinate2D
    var uid: String
    
    init(uid: String, coordinate: CLLocationCoordinate2D) {
        self.uid = uid
        self.coordinate = coordinate
    }
    
    func updateAnnotationPosition(withCoordinate coordinate: CLLocationCoordinate2D) {
        UIView.animate(withDuration: 0.2) {
            self.coordinate = coordinate
        }
    }
}
