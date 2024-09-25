//
//  ViewController.swift
//  ProfileApp
//
//  Created by Khai Truong on 9/25/24.
//

import UIKit

class ViewController: UIViewController {
    var createProfile:UILabel!
    var name:UITextField!
    var email:UITextField!
    var addPhone:UILabel!
    var select:UILabel!
    var option:UIPickerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupCreateP()
        setupName()
        setupEmail()
        setupAddPhone()
        setupSelect()
        
        initConstraints()
        
    }

    func setupCreateP() {
        createProfile = UILabel()
        createProfile.text = "Create Profile"
        createProfile.font = UIFont.systemFont(ofSize: 24)
        createProfile.textColor = .systemBlue
        createProfile.textAlignment = .center
        createProfile.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(createProfile)
    }
    
    func setupName() {
        name = UITextField()
        name.placeholder = "Name"
        name.borderStyle = .roundedRect
        name.font = UIFont.systemFont(ofSize: 18)
        name.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(name)
    }
    
    func setupEmail() {
        email = UITextField()
        email.placeholder = "Email"
        email.borderStyle = .roundedRect
        
        email.font = UIFont.systemFont(ofSize: 18)
        email.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(email)
    }
    
    func setupAddPhone() {
        addPhone = UILabel()
        addPhone.text = "Add Phone"
        addPhone.font = UIFont.systemFont(ofSize: 22)
        addPhone.textColor = .black
        addPhone.textAlignment = .center
        addPhone.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addPhone)
    }
    
    func setupSelect() {
        select = UILabel()
        select.text = "Select Type:"
        select.font = UIFont.systemFont(ofSize: 18)
        select.textColor = .black
        select.textAlignment = .center
        select.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(select)
    }
    
    func setupOption() {
        option = UIPickerView()
        
        
    }
    
    
    func initConstraints(){
            NSLayoutConstraint.activate(
                [
                    //Constraints for labelHello....
                    createProfile.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
                    createProfile.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                    
                    //MARK: constraints for textField...
                    name.topAnchor.constraint(equalTo: createProfile.bottomAnchor, constant: 16),
                    name.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                    name.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
                    name.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
                    
                    email.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 16),
                    email.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                    email.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
                    email.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
                    
                    addPhone.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 16),
                    addPhone.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                    
                    select.topAnchor.constraint(equalTo: addPhone.bottomAnchor, constant: 16),
                    select.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                ]
                
            )
        }

}

