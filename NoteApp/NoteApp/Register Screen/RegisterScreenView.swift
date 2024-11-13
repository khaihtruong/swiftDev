//
//  RegisterScreenView.swift
//  NoteApp
//
//  Created by Khai Truong on 11/4/24.
//

import UIKit

class RegisterScreenView: UIView {

    var name: UITextField!
    var email:UITextField!
    var pw: UITextField!
    
    var register: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupName()
        setupEmail()
        setupPW()
        
        setupRegister()
        
        initConstraints()
        
    }
    
    func setupRegister(){
        register = UIButton(type: .system)
        register.titleLabel?.font = .boldSystemFont(ofSize: 16)
        register.setTitle("Register", for: .normal)
        register.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(register)
    }
    
    func setupName() {
        name = UITextField()
        name.placeholder = "Name"
        name.borderStyle = .roundedRect
        name.translatesAutoresizingMaskIntoConstraints = false
        name.keyboardType = .emailAddress
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
    
    func setupPW() {
        pw = UITextField()
        pw.placeholder = "Password"
        pw.borderStyle = .roundedRect
        pw.translatesAutoresizingMaskIntoConstraints = false
        pw.keyboardType = .phonePad
        self.addSubview(pw)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            
            name.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            name.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            name.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            name.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            email.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 16),
            email.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            email.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            email.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            pw.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 16),
            pw.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            pw.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            pw.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            register.topAnchor.constraint(equalTo: pw.safeAreaLayoutGuide.bottomAnchor, constant: 32),
            register.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
