//
//  DetailScreenView.swift
//  NoteApp
//
//  Created by Khai Truong on 11/4/24.
//

import UIKit

class DetailScreenView: UIView {

    var name: UILabel!
    var email: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupName()
        setupEmail()
        
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupName() {
        name = UILabel()
        name.textColor = .black
        name.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        name.textAlignment = .center
        name.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(name)
    }
    
    func setupEmail() {
        email = UILabel()
        email.textColor = .black
        email.textAlignment = .center
        email.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(email)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            name.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            email.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 16),
            email.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
        ])
    }
}
