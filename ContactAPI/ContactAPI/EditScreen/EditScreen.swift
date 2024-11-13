//
//  EditScreen.swift
//  ContactAPI
//
//  Created by Khai Truong on 10/22/24.
//

import UIKit

class EditScreen: UIView {

    var contentWrapper:UIScrollView!
    var name: UITextField!
    var email: UITextField!
    var phone: UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //setting the background color...
        self.backgroundColor = .white
        
        setupContentWrapper()
        setupName()
        setupEmail()
        setupNum()
        
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupContentWrapper(){
        contentWrapper = UIScrollView()
        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentWrapper)
    }
    
    func setupName() {
        name = UITextField()
        name.placeholder = "Name"
        name.borderStyle = .roundedRect
        name.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(name)
    }
    
    func setupEmail() {
        email = UITextField()
        email.placeholder = "Email"
        email.borderStyle = .roundedRect
        email.translatesAutoresizingMaskIntoConstraints = false
        email.keyboardType = .emailAddress
        contentWrapper.addSubview(email)
    }
    
    func setupNum() {
        phone = UITextField()
        phone.placeholder = "Phone number"
        phone.borderStyle = .roundedRect
        phone.translatesAutoresizingMaskIntoConstraints = false
        phone.keyboardType = .phonePad
        contentWrapper.addSubview(phone)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            
            contentWrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            contentWrapper.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            contentWrapper.widthAnchor.constraint(equalTo:self.safeAreaLayoutGuide.widthAnchor),
            contentWrapper.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor),
            
            name.topAnchor.constraint(equalTo: contentWrapper.topAnchor, constant: 32),
            name.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            name.leadingAnchor.constraint(equalTo:contentWrapper.leadingAnchor, constant: 16),
            
            email.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 22),
            email.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            email.leadingAnchor.constraint(equalTo:contentWrapper.leadingAnchor, constant: 16),
            
            phone.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 16),
            phone.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            phone.leadingAnchor.constraint(equalTo:contentWrapper.leadingAnchor, constant: 16),
            phone.bottomAnchor.constraint(equalTo: contentWrapper.bottomAnchor)
        ])
    }

}
