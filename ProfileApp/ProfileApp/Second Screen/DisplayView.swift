//
//  DisplayView.swift
//  App4
//
//  Created by Sakib Miazi on 5/16/23.
//

import UIKit

class DisplayView: UIView {

    var name: UILabel!
    var email: UILabel!
    var phone: UILabel!
    var address: UILabel!
    var city: UILabel!
    var zip:UILabel!
    var image: UIImageView!
    
    //MARK: View initializer...
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //setting the background color...
        self.backgroundColor = .white
        
        setupName()
        setupEmail()
        setupPhone()
        setupAddress()
        setupZip()
        setupCity()
        setupImage()
        
        initConstraints()
    }
    
    func setupName(){
        name = UILabel()
        name.textColor = .black
        name.textAlignment = .left
        name.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(name)
    }
    
    func setupEmail(){
        email = UILabel()
        email.textColor = .black
        email.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(email)
    }
    
    func setupPhone() {
        phone = UILabel()
        phone.textColor = .black
        phone.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(phone)
    }
    
    //imageMood...
    func setupImage(){
        image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(image)
    }
    
    func setupAddress() {
        address = UILabel()
        address.textColor = .black
        address.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(address)
    }
    
    func setupCity() {
        city = UILabel()
        city.textColor = .black
        city.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(city)
    }
    
    func setupZip() {
        zip = UILabel()
        zip.textColor = .black
        zip.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(zip)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            name.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            name.leadingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            email.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 16),
            email.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            email.leadingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            phone.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 16),
            phone.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            phone.leadingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            address.topAnchor.constraint(equalTo: phone.bottomAnchor, constant: 16),
            address.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            address.leadingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            city.topAnchor.constraint(equalTo: address.bottomAnchor, constant: 16),
            city.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            city.leadingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            zip.topAnchor.constraint(equalTo: city.bottomAnchor, constant: 16),
            zip.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            zip.leadingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            image.topAnchor.constraint(equalTo: zip.bottomAnchor, constant: 16),
            image.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
