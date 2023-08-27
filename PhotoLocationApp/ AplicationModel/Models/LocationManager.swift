//
//  LocationManager.swift
//  PhotoLocationApp
//
//  Created by HiroakiSaito on 2023/08/14.
//

import Foundation
import CoreLocation
import MapKit

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let manager = CLLocationManager()
    @Published var coordinate: CLLocation?

    override init() {
        super.init()
        self.manager.delegate = self
        self.manager.requestWhenInUseAuthorization()
        self.manager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let lastCoordinate = locations.last {
            coordinate = lastCoordinate
        }
    }
}
