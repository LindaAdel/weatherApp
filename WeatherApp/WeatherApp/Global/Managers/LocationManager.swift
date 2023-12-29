//
//  LocationManager.swift
//  WeatherApp
//
//  Created by Linda adel on 28/12/2023.
//

import Foundation
import CoreLocation

protocol LocationManagerDelegate: AnyObject {
    func didUpdateCountryCode(_ countryCode: String?)
    func didFailWithError(_ error: Error)
}

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    static let LocationSharedInstance = LocationManager()
    
    private var locationManager: CLLocationManager
    private var lastLocation: CLLocation?
    
    weak var delegate: LocationManagerDelegate?
    
    @Published var countryCode: String?
    
    override private init() {
        locationManager = CLLocationManager()
        super.init()
        
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.pausesLocationUpdatesAutomatically = false
    }
    
    func requestAccessingLocation() {
        locationManager.requestAlwaysAuthorization()
        startUpdating()
    }
    
    func startUpdating() {
        locationManager.startUpdatingLocation()
    }
    
    func stopUpdating() {
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        delegate?.didFailWithError(error)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let lastLocation = locations.last else {
            return
        }
        
        self.lastLocation = lastLocation
        getCurrentCountryCode(lastLocation: lastLocation)
    }
    
    private func getCurrentCountryCode(lastLocation: CLLocation) {
        let geocoder = CLGeocoder()
        
        geocoder.reverseGeocodeLocation(lastLocation) { [weak self] (placemarks, error) in
            if let error = error {
                self?.delegate?.didFailWithError(error)
                return
            }
            
            if let firstLocation = placemarks?.first {
                self?.countryCode = firstLocation.postalCode
                self?.delegate?.didUpdateCountryCode(firstLocation.postalCode)
            }
        }
    }
}
