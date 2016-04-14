//
//  BarViewController.swift
//  Carte Bars
//
//  Created by Renaud Descours on 08/04/2016.
//  Copyright © 2016 Renaud Descours. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class BarViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, MKMapViewDelegate, CLLocationManagerDelegate{

    // MARK: Properties
    
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var adressLabel: UILabel!
    
    var bars: [Bar]?
    var locationManager: CLLocationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Show user position
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        mapView.showsUserLocation = true
        
        if let bars = bars {
            // Title and address
            navigationItem.title = bars[0].name
            adressLabel.text = bars[0].adress
                
            // Set map position
            let initialLocation = CLLocation(latitude: bars[0].latitude, longitude: bars[0].longitude)
            centerMapOnLocation(initialLocation)
            
          
        } else { // if there is no bar then all of them are needed
            loadBars()
            
            navigationItem.title = "Bars de Paris"
            adressLabel.text = " "
            
            // Set map position
            if(self.locationManager.location==nil){
                print("locationManager.location==nil")
                let initialLocation = CLLocation(latitude: 48.853, longitude: 2.35)
                centerMapOnLocation(initialLocation)
            }else{
                let initialLocation = CLLocation(latitude: (self.locationManager.location?.coordinate.latitude)!, longitude: (self.locationManager.location?.coordinate.longitude)!)
                centerMapOnLocation(initialLocation)
            }
            
        }
        
        for bar in bars!{
            
            // Drop a pin
            let barLocation = CLLocationCoordinate2DMake(bar.latitude, bar.longitude)
            let dropPin = MKPointAnnotation()
            dropPin.coordinate = barLocation
            dropPin.title = bar.name
            mapView.addAnnotation(dropPin)
            
        }
        
    }
    
    // get bar's list from AppDelegate
    func loadBars(){
        let del = UIApplication.sharedApplication().delegate as! AppDelegate
        bars = del.bars
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  2000, 2000)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    // Open a google page with the concerned bar as research
    @IBAction func buttonPressed()  {
        let nomPlus = bars![0].name.stringByReplacingOccurrencesOfString(" ", withString: "+")
        if let url = NSURL(string: "https://www.google.fr/#q=bar+\(nomPlus)+Paris") {
            print(url)
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
    
}

