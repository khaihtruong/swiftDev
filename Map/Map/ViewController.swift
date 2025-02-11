//
//  ViewController.swift
//  Map
//
//  Created by Khai Truong on 12/8/24.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    var home = View()
    
    override func loadView() {
        view = home
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Map"
        
        let tapRecognizer = UITapGestureRecognizer(
            target: self, action: #selector(hideKeyboardOnTap))
        tapRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapRecognizer)
        
        home.showButton.addTarget(self, action: #selector(onShowMapTapped), for: .touchUpInside)
    }
    
    @objc func hideKeyboardOnTap() {
        //MARK: removing the keyboard from screen...
        view.endEditing(true)
    }
    
    //MARK: Go to map screen when map button tapped
    @objc func onShowMapTapped() {
        guard let eventLocation = home.address.text, !eventLocation.isEmpty else {
            print("Event location is missing or empty")
            return
        }
        
        // ConvertZ event location text to coordinates
        convertAddressToCoordinates(address: eventLocation) { [weak self] coordinate, error in
            guard let self = self else { return }
            
            if let error = error {
                print("Geocoding error: \(error.localizedDescription)")
                return
            }
            
            if let coordinate = coordinate {
                print("Coordinates fetched for \(eventLocation): \(coordinate.latitude), \(coordinate.longitude)")
                
                let mapViewController = MapViewController()
                mapViewController.eventLocation = coordinate
                self.navigationController?.pushViewController(mapViewController, animated: true)
            }
        }
    }
    
    func convertAddressToCoordinates(address: String, completion: @escaping (CLLocationCoordinate2D?, Error?) -> Void) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) { placemarks, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            if let placemark = placemarks?.first, let location = placemark.location {
                completion(location.coordinate, nil)
            } else {
                completion(nil, NSError(domain: "GeocodingError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Unable to find coordinates for the given address."]))
            }
        }
    }


}

