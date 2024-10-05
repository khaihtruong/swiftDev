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
        detailView.name.text = contact.name
        detailView.email.text = contact.email
        detailView.phone.text = contact.phone
        detailView.address.text = "\(contact.address!), \(contact.city!), \(contact.zip!)"
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
