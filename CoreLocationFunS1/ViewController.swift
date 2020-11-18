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

class ViewController: UIViewController {
    
    @IBOutlet var latitudeLabel: UILabel!
    @IBOutlet var longitudeLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

