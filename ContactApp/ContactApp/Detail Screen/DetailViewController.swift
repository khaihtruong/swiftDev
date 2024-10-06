//
//  DetailViewController.swift
//  ContactApp
//
//  Created by Khai Truong on 10/3/24.
//

import UIKit

class DetailViewController: UIViewController {

    let detailView = DetailView()
    
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func delegateOnDetail(contact: Contact) {
        if let unwrappedName = contact.name, let unwrappedEmail = contact.email, let unwrappedPhone = contact.phone, let unwrappedAddress = contact.address, let unwrappedCity = contact.city, let unwrappedZip = contact.zip, let unwrappedTypes = contact.type {
            if !unwrappedName.isEmpty, !unwrappedZip.isEmpty, !unwrappedCity.isEmpty, !unwrappedPhone.isEmpty, !unwrappedEmail.isEmpty, !unwrappedAddress.isEmpty, !unwrappedTypes.isEmpty {
                detailView.name.text = unwrappedName
                detailView.email.text = "Email: \(unwrappedEmail)"
                detailView.phone.text = "Phone: \(unwrappedPhone) (\(unwrappedTypes))"
                detailView.address.text = unwrappedAddress
                detailView.city.text = unwrappedCity
                detailView.zip.text = unwrappedZip
                
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
