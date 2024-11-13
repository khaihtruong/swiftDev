//
//  DetailScreenView.swift
//  ContactAPI
//
//  Created by Khai Truong on 10/21/24.
//

import UIKit

class DetailScreenView: UIView {

    var contentWrapper:UIScrollView!
    var name: UILabel!
    var email: UILabel!
    var phone: UILabel!
    var delete: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        setupContentWrapper()
        
        setupName()
        setupEmail()
        setupPhone()
        setupDelete()
        
        initConstraints()
    }
    
    func setupContentWrapper(){
        contentWrapper = UIScrollView()
        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentWrapper)
    }
    
    func setupName(){
        name = UILabel()
        name.textColor = .black
        name.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        name.textAlignment = .center
        name.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(name)
    }
    
    func setupEmail() {
        email = UILabel()
        email.textColor = .black
        email.textAlignment = .center
        email.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(email)
    }
    
    func setupPhone() {
        phone = UILabel()
        phone.textColor = .black
        phone.textAlignment = .center
        phone.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(phone)
    }
    
    func setupDelete() {
        delete = UIButton(type: .system)
        delete.titleLabel?.font = .boldSystemFont(ofSize: 16)
        delete.setTitle("Delete Contact", for: .normal)
        delete.translatesAutoresizingMaskIntoConstraints = false
        delete.setTitleColor(.red, for: .normal)
        contentWrapper.addSubview(delete)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            
            contentWrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            contentWrapper.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            contentWrapper.widthAnchor.constraint(equalTo:self.safeAreaLayoutGuide.widthAnchor),
            contentWrapper.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor),
            
            name.topAnchor.constraint(equalTo: contentWrapper.topAnchor, constant: 32),
            name.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            name.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 16),
            
            email.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 22),
            email.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            email.leadingAnchor.constraint(equalTo:contentWrapper.leadingAnchor, constant: 16),
            
            phone.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 16),
            phone.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            phone.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 16),
            
            delete.topAnchor.constraint(equalTo: phone.bottomAnchor, constant: 16),
            delete.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            delete.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 16),
            delete.bottomAnchor.constraint(equalTo: contentWrapper.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
