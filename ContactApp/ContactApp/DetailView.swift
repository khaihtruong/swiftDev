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
    var email: UILabel!
    var phone: UILabel!
    var address:UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //setting the background color...
        self.backgroundColor = .white
        
        setupName()
        setupEmail()
        setupPhone()
        setupAddress()
        
        initConstraints()
    }
    
    func setupName(){
        name = UILabel()
        name.textColor = .black
        name.textAlignment = .center
        name.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(name)
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
    
    func setupAddress() {
        address = UILabel()
        address.textColor = .black
        address.textAlignment = .center
        address.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(address)
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
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
