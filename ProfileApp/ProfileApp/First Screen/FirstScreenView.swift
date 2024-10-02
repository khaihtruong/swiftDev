//
//  FirstScreenView.swift
//  App4
//
//  Created by Sakib Miazi on 5/16/23.
//

import UIKit

class FirstScreenView: UIView {

    var createProfile:UILabel!
    var name:UITextField!
    var email:UITextField!
    var num:UITextField!
    var address:UITextField!
    var city:UITextField!
    var zip:UITextField!
    var addPhone:UILabel!
    var select:UILabel!
    var option:UIPickerView!
    var button:UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //MARK: set the background color...
        self.backgroundColor = .white
        
        //MARK: initializing the UI elements and constraints...
        
        setupName()
        setupNum()
        setupEmail()
        setupZip()
        setupAddPhone()
        setupAddress()
        setupOption()
        setupSelect()
        setupCity()
        setupButton()
        
        initConstraints()
    }
    
    func setupName() {
        name = UITextField()
        name.placeholder = "Name"
        name.borderStyle = .roundedRect
        name.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(name)
    }
    
    func setupEmail() {
        email = UITextField()
        email.placeholder = "Email"
        email.borderStyle = .roundedRect
        email.translatesAutoresizingMaskIntoConstraints = false
        email.keyboardType = .emailAddress
        self.addSubview(email)
    }
    
    func setupAddPhone() {
        addPhone = UILabel()
        addPhone.text = "Add Phone"
        addPhone.font = UIFont.systemFont(ofSize: 22)
        addPhone.textColor = .black
        addPhone.textAlignment = .center
        addPhone.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(addPhone)
    }
    
    func setupSelect() {
        select = UILabel()
        select.text = "Select Type:"
        select.font = UIFont.systemFont(ofSize: 18)
        select.textColor = .black
        select.textAlignment = .center
        select.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(select)
    }
    
    func setupOption() {
        option = UIPickerView()
        option.isUserInteractionEnabled = true
        option.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(option)
    }
    
    func setupNum() {
        num = UITextField()
        num.placeholder = "Phone number"
        num.borderStyle = .roundedRect
        num.translatesAutoresizingMaskIntoConstraints = false
        num.keyboardType = .phonePad
        self.addSubview(num)
    }
    
    func setupAddress() {
        address = UITextField()
        address.placeholder = "Address"
        address.borderStyle = .roundedRect
        address.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(address)
    }
    
    func setupCity() {
        city = UITextField()
        city.placeholder = "City, State"
        city.borderStyle = .roundedRect
        city.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(city)
    }
    
    func setupZip() {
        zip = UITextField()
        zip.placeholder = "Zip"
        zip.borderStyle = .roundedRect
        zip.translatesAutoresizingMaskIntoConstraints = false
        zip.keyboardType = .numberPad
        self.addSubview(zip)
    }
    
    func setupButton(){
        button = UIButton(type: .system)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        button.setTitle("Show Profile", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(button)
    }
    
    func initConstraints(){
            NSLayoutConstraint.activate(
                [
                    //MARK: constraints for textField...
                    name.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
                    name.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                    name.leadingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
                    name.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
                    
                    email.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 16),
                    email.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                    email.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
                    email.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
                    
                    addPhone.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 22),
                    addPhone.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                    
                    select.topAnchor.constraint(equalTo: addPhone.bottomAnchor, constant: 16),
                    select.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                    
                    option.topAnchor.constraint(equalTo: select.bottomAnchor, constant:0),
                    option.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                    
                    num.topAnchor.constraint(equalTo: option.bottomAnchor, constant:0),
                    num.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                    num.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
                    num.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
                    
                    address.topAnchor.constraint(equalTo: num.bottomAnchor, constant:16),
                    address.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                    address.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
                    address.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
                    
                    city.topAnchor.constraint(equalTo: address.bottomAnchor, constant:16),
                    city.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                    city.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
                    city.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
                    
                    zip.topAnchor.constraint(equalTo: city.bottomAnchor, constant:16),
                    zip.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                    zip.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
                    zip.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
                    
                    button.topAnchor.constraint(equalTo: zip.bottomAnchor, constant:22),
                    button.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                    
                ]
                
            )
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
