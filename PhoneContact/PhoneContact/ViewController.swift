//
//  ViewController.swift
//  PhoneContact
//
//  Created by Khai Truong on 10/1/24.
//

import UIKit

class ViewController: UIViewController {

    //MARK: expenses array to populate TableView...
    var contacts = [Contact]()
    
    //MARK: predefined types of expenses...
    let types = ["Cell", "Home", "Mobile"]
    
    let firstScreen = FirstScreenView()
    
    override func loadView() {
        view = firstScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Contact"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add, target: self,
            action: #selector(onAddBarButtonTapped)
            )
    }
    @objc func onAddBarButtonTapped(){
            //Will implement later...
        }
}

