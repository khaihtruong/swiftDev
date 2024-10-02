//
//  DisplayViewController.swift
//  App4
//
//  Created by Sakib Miazi on 5/16/23.
//

import UIKit

class DisplayViewController: UIViewController {

    //MARK: creating instance of DisplayView...
    let displayScreen = DisplayView()
    
    //MARK: patch the view of the controller to the DisplayView...
    override func loadView() {
        view = displayScreen
    }
    
    //MARK: message and mood from the first screen...
    var receivedPackage: ViewController.Package = ViewController.Package() // The first screen can set this variable...
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let unwrappedName = receivedPackage.name, let unwrappedEmail = receivedPackage.email, let unwrappedAddress = receivedPackage.address, let unwrappedPhone = receivedPackage.phone, let unwrappedZip = receivedPackage.zip, let unwrappedCity = receivedPackage.city, let unwrappedTypes = receivedPackage.types {
            
            if !unwrappedName.isEmpty, !unwrappedZip.isEmpty, !unwrappedCity.isEmpty, !unwrappedPhone.isEmpty, !unwrappedEmail.isEmpty, !unwrappedAddress.isEmpty, !unwrappedTypes.isEmpty {
                
                displayScreen.name.text = "Name: \(unwrappedName)"
                displayScreen.address.text = "Address: \(unwrappedAddress)"
                displayScreen.phone.text = "Phone number: \(unwrappedPhone) (\(unwrappedTypes))"
                displayScreen.zip.text = "Zip code: \(unwrappedZip)"
                displayScreen.city.text = "City, State: \(unwrappedCity)"
                displayScreen.email.text = "Email: \(unwrappedEmail)"
                displayScreen.image.image = UIImage(named: unwrappedTypes.lowercased())
            }
        }
    }

}
