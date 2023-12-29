//
//  LocationManager.swift
//  WeatherApp
//
//  Created by Linda adel on 28/12/2023.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    static let LocationSharedInstance = LocationManager()
    private var locationManager = CLLocationManager()
    private var lastLocation: CLLocation?
    
    @Published var countryCode: String?
  //  var countryCode: String?
    
    override private init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.pausesLocationUpdatesAutomatically = false
    }

    func requestAccessingLocation() {
        locationManager.requestAlwaysAuthorization()
        self.startUpdating()
    }

    func startUpdating() {
        locationManager.startUpdatingLocation()
    }
    
    func stopUpdating() {
        locationManager.stopUpdatingLocation()
    }
    
    private func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("didFailWithError Error" + error.description)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        lastLocation = locations.last
        guard let lastLocation = lastLocation else {
            return
        }
        getCurrentCountryCode(lastLocation: lastLocation)
    }
    
    private func getCurrentCountryCode(lastLocation: CLLocation) {
        let geocoder = CLGeocoder()

          geocoder.reverseGeocodeLocation(lastLocation) { [weak self] (placemarks, error) in
              if error == nil {
                  if let firstLocation = placemarks?[0] {
                      self?.countryCode = firstLocation.postalCode
                      self?.locationManager.stopUpdatingLocation()
                  }
              }
          }
    }
}
