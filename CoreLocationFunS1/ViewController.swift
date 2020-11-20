//
//  ViewController.swift
//  CoreLocationFunS1
//
//  Created by Gina Sprint on 11/18/20.
//

import UIKit
import CoreLocation

// MARK: - Location Services
// Simulator -> Features -> Location
// set a predefined location/route or a custom location
// CLLocationManager: a class used to get the user's location and updates
// CLGeocoder: a class used to convert address/place -> coordinates and coordinates -> address/place
// task: set up a UI with three labels: latitude, longitude, name
// set up the outlets as well

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet var latitudeLabel: UILabel!
    @IBOutlet var longitudeLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // first is make sure location services are enabled
        if CLLocationManager.locationServicesEnabled() {
            print("enabled")
            setupLocationServices()
        }
        else {
            print("disabled")
            // the user could have turned off location services, airplane mode, HW failure, etc.
        }
    }

    func setupLocationServices() {
        // we need a CLLocationManager object
        // and we need to setup a delegate for it
        locationManager.delegate = self
        
        // we need to request authorization from the suer to great their location
        // 2 types of location authorization
        // 1. When in use: the app can get location updates when it is running
        // 2. Always: the app always gets location updates. the OS will start your app to deliver an updates
        // we are going do 1.
        // we need to add a key-value pair to our Info.plist to declare the authorization
        // key: Privacy - Location When in Use Usage Description
        // value: a string describing to the user why we need their location
        locationManager.requestWhenInUseAuthorization()
        
        // set the desired accuracy for location updates to be as course grained as our app can tolerate
        // default is best
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        
        // two types of location updates
        // 1. requestLocation(): one time update of the user's location
        // 2. startUpdatingLocation(): continuous updates based on the desiredAccuracy
        // for #2, don't forget to call stopUpdatingLocation() when you're done with location updates
        locationManager.requestLocation()
        // we need delegate callback methods!!
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
        // we are guaranteed there is at least one CLLocation
        // the newest location is at the end of the array
        let location = locations[locations.count - 1]
        // update the labels
        latitudeLabel.text = "Latitude: \(location.coordinate.latitude)"
        longitudeLabel.text = "Longitude: \(location.coordinate.longitude)"
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error accessing location \(error)")
        // here are a few noteworthy error codes
        // 0: no location (e.g. Simulator's location is set to None)
        // 1: authorization deny
    }
}

