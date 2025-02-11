//
//  View.swift
//  Map
//
//  Created by Khai Truong on 12/8/24.
//

import UIKit

class View: UIView {

    var address: UITextField!
    var showButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupAddress()
        setupButton()
        
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupAddress() {
        address = UITextField()
        address.placeholder = "Enter your address"
        address.backgroundColor = .systemFill
        address.borderStyle = .roundedRect
        address.backgroundColor = .systemFill
        address.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(address)
    }

    func setupButton() {
        showButton = UIButton(type: .system)
        showButton.backgroundColor = .systemBlue
        showButton.layer.cornerRadius = 10
        showButton.setTitleColor(.white, for: .normal)
        showButton.setTitle("Show map", for: .normal)
        showButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(showButton)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            address.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 50),
            address.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            address.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            address.heightAnchor.constraint(equalToConstant: 44),
            
            showButton.topAnchor.constraint(equalTo: address.bottomAnchor, constant: 22),
            showButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            showButton.heightAnchor.constraint(equalToConstant: 44),
            showButton.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
}
