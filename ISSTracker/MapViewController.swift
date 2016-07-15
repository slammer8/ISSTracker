//
//  MapViewController.swift
//  ISSTracker
//
//  Created by Sam Wu on 7/15/16.
//  Copyright © 2016 BothPoints. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

/// Displays the current location of the ISS and the user.
final class MapViewController: UIViewController {

    private let ISSUpdater = MapUpdater()
    private let myLocationUpdater = FavoriteLocationUpdater()
    private let locationManager = CLLocationManager()
    
    @IBOutlet private weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        title = NSLocalizedString("Map View", comment: "Map View")
        locationManager.delegate = self
    }
    
    @IBAction private func meBarButtonPressed(sender: AnyObject) {
        locationManager.requestLocation()
    }
    
    @IBAction private func ISSBarButtonPressed(sender: AnyObject) {
        
        ISSUpdater.requestCurrentPosition { [weak self] result in
            
            guard let strongSelf = self else { return }
            
            switch result {
            case let .Success(position):
                let annotation = MKPointAnnotation()
                annotation.title = NSLocalizedString("Current ISS Position", comment: "Current ISS Position")
                
                strongSelf.centerMapOnLocationWithAnnotation(position.currentPosition, annotation: annotation)
                
            case let .Failure(error):
                print("error \(error)")
            }
        }
    }
    
    private func centerMapOnLocationWithAnnotation(location: CLLocationCoordinate2D, annotation: MKPointAnnotation) {

        mapView.removeAnnotations(mapView.annotations)
        
        let regionRadius: CLLocationDistance = 1000

        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location,
                                                                  regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
        annotation.coordinate = location
        mapView.addAnnotation(annotation)
    }

}

// MARK: CLLocationMangerDelegate

extension MapViewController: CLLocationManagerDelegate {
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            
            let request = ISSRequest.LocationPassTime(location: location.coordinate)
            
            myLocationUpdater.requestSavedLocation(request, name: nil, completion: { [weak self] result in
                guard let strongSelf = self else { return }
                
                switch result {
                case let .Success(position):
                    
                    guard let lat = position.latitude.value, long = position.longitude.value, date = position.passTimes.first?.riseTime else { return }
                    
                    let annotation = MKPointAnnotation()
                    
                    let location = CLLocationCoordinate2DMake(lat, long)
                    
                    annotation.title = date.convertToLocaleUsingDateFormat(SavedLocationCell.DateFormat)
                    
                    strongSelf.centerMapOnLocationWithAnnotation(location, annotation: annotation)
                    
                case let .Failure(error):
                    print("error \(error)")
                }

            })
        }
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Failed to find user's location: \(error.localizedDescription)")
    }
}
