//
//  MainScreenView.swift
//  NoteApp
//
//  Created by Khai Truong on 11/3/24.
//

import UIKit

class MainScreenView: UIView {
    var login: UIButton!

    var email:UITextField!
    var pw: UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupEmail()
        setupNum()
        
        setupLogin()
        
        initConstraints()
        
    }
    
    func setupLogin(){
        login = UIButton(type: .system)
        login.titleLabel?.font = .boldSystemFont(ofSize: 16)
        login.setTitle("Log In", for: .normal)
        login.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(login)
    }
    
    func setupEmail() {
        email = UITextField()
        email.placeholder = "Email"
        email.borderStyle = .roundedRect
        email.translatesAutoresizingMaskIntoConstraints = false
        email.keyboardType = .emailAddress
        self.addSubview(email)
    }
    
    func setupNum() {
        pw = UITextField()
        pw.placeholder = "Password"
        pw.borderStyle = .roundedRect
        pw.translatesAutoresizingMaskIntoConstraints = false
        pw.keyboardType = .phonePad
        self.addSubview(pw)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            
            email.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            email.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            email.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            email.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            pw.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 16),
            pw.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            pw.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            pw.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            login.topAnchor.constraint(equalTo: pw.safeAreaLayoutGuide.bottomAnchor, constant: 32),
            login.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
