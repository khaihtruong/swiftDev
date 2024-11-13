//
//  DetailView.swift
//  ContactApp
//
//  Created by Khai Truong on 10/3/24.
//

import UIKit

class DetailView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var name: UILabel!
    var imageReceipt: UIImageView!
    var email: UILabel!
    var phone: UILabel!
    
    var addressStart:UILabel!
    var address:UILabel!
    var city: UILabel!
    var zip: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //setting the background color...
        self.backgroundColor = .white
        
        setupName()
        setupEmail()
        setupPhone()
        setupAddress()
        setupAddressStart()
        setupCity()
        setupZip()
        setupimageReceipt()
        
        initConstraints()
    }
    
    func setupName(){
        name = UILabel()
        name.textColor = .black
        name.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        name.textAlignment = .center
        name.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(name)
    }
    
    func setupimageReceipt() {
        imageReceipt = UIImageView()
        imageReceipt.image = UIImage(systemName: "photo")
        imageReceipt.contentMode = .scaleToFill
        imageReceipt.clipsToBounds = true
        imageReceipt.layer.cornerRadius = 10
        imageReceipt.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageReceipt)
    }
    
    func setupEmail(){
        email = UILabel()
        email.textColor = .black
        email.textAlignment = .center
        email.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(email)
    }
    
    func setupPhone() {
        phone = UILabel()
        phone.textColor = .black
        phone.textAlignment = .center
        phone.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(phone)
    }
    
    func setupAddressStart() {
        addressStart = UILabel()
        addressStart.textColor = .black
        addressStart.text = "Address: "
        addressStart.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        addressStart.textAlignment = .center
        addressStart.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(addressStart)
    }
    
    func setupAddress() {
        address = UILabel()
        address.textColor = .black
        address.textAlignment = .center
        address.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(address)
    }
    
    func setupCity() {
        city = UILabel()
        city.textColor = .black
        city.textAlignment = .center
        city.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(city)
    }
    
    func setupZip() {
        zip = UILabel()
        zip.textColor = .black
        zip.textAlignment = .center
        zip.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(zip)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            
            imageReceipt.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            imageReceipt.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            imageReceipt.widthAnchor.constraint(equalToConstant: 100),
            imageReceipt.heightAnchor.constraint(equalToConstant: 100),
            
            name.topAnchor.constraint(equalTo: imageReceipt.bottomAnchor, constant: 16),
            name.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            name.leadingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            email.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 22),
            email.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            email.leadingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            phone.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 16),
            phone.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            phone.leadingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            addressStart.topAnchor.constraint(equalTo: phone.bottomAnchor, constant: 32),
            addressStart.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            addressStart.leadingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            address.topAnchor.constraint(equalTo: addressStart.bottomAnchor, constant: 16),
            address.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            address.leadingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            city.topAnchor.constraint(equalTo: address.bottomAnchor, constant: 16),
            city.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            city.leadingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            zip.topAnchor.constraint(equalTo: city.bottomAnchor, constant: 16),
            zip.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            zip.leadingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
