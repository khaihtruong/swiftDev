//
//  AddContactView.swift
//  ContactApp
//
//  Created by Khai Truong on 10/3/24.
//

import UIKit

class AddContactView: UIView {

    var title: UILabel!
    var name: UITextField!
    var email: UITextField!
    var buttonSelectType: UIButton!
    var buttonTakePhoto: UIButton!
    var phone: UITextField!
    var address:UITextField!
    var city: UITextField!
    var zip: UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setupTitle()
        setupName()
        setupEmail()
        setupbuttonTakePhoto()
        setupbuttonSelectType()
        setupCity()
        setupAddress()
        setupZip()
        setupNum()
        
        initConstraints()
    }
    
    func setupTitle(){
        title = UILabel()
        title.textColor = .black
        title.text = "Add a new contact:"
        title.textAlignment = .center
        title.font = UIFont.systemFont(ofSize: 22)
        title.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(title)
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
    
    func setupbuttonSelectType(){
        buttonSelectType = UIButton(type: .system)
        buttonSelectType.setTitle("Cell", for: .normal)
        buttonSelectType.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        buttonSelectType.showsMenuAsPrimaryAction = true
        buttonSelectType.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonSelectType)
    }
    func setupbuttonTakePhoto(){
        buttonTakePhoto = UIButton(type: .system)
        buttonTakePhoto.setTitle("", for: .normal)
        buttonTakePhoto.setImage(UIImage(systemName: "camera.fill"), for: .normal)
        buttonTakePhoto.contentHorizontalAlignment = .fill
        buttonTakePhoto.contentVerticalAlignment = .fill
        buttonTakePhoto.imageView?.contentMode = .scaleAspectFit
        buttonTakePhoto.showsMenuAsPrimaryAction = true
        buttonTakePhoto.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonTakePhoto)
    }
    
    func setupNum() {
        phone = UITextField()
        phone.placeholder = "Phone number"
        phone.borderStyle = .roundedRect
        phone.translatesAutoresizingMaskIntoConstraints = false
        phone.keyboardType = .phonePad
        self.addSubview(phone)
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
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0),
            title.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            name.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 16),
            name.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            name.leadingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            name.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            buttonTakePhoto.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 8),
            buttonTakePhoto.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            buttonTakePhoto.widthAnchor.constraint(equalToConstant: 100),
            buttonTakePhoto.heightAnchor.constraint(equalToConstant: 100),
            
            email.topAnchor.constraint(equalTo: buttonTakePhoto.bottomAnchor, constant: 16),
            email.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            email.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            email.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            phone.topAnchor.constraint(equalTo: email.bottomAnchor, constant:8),
            phone.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            phone.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -100),
            phone.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            buttonSelectType.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 8),
            buttonSelectType.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            buttonSelectType.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 16),
            buttonSelectType.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 260),
            
            address.topAnchor.constraint(equalTo: phone.bottomAnchor, constant:16),
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
        ])
    }
    
    
}
