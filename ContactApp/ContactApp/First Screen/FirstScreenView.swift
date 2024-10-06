//
//  FirstScreenView.swift
//  ContactApp
//
//  Created by Khai Truong on 10/3/24.
//

import UIKit

class FirstScreenView: UIView {

    var myContacts: UILabel!
    var tableView: UITableView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setupTable()
        setupMyContacts()
        initConstraints()
        
    }
    
    func setupMyContacts() {
        myContacts = UILabel()
        myContacts.text = "My Contacts"
        myContacts.textColor = .black
        myContacts.font = UIFont.systemFont(ofSize: 22)
        myContacts.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(myContacts)
    }
    
    
    func setupTable() {
        tableView = UITableView()
        tableView.register(FirstScreenContactCell.self, forCellReuseIdentifier: "contacts")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableView)
    }
    
    func initConstraints(){
            NSLayoutConstraint.activate([
                myContacts.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0),
                myContacts.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
                
                tableView.topAnchor.constraint(equalTo: myContacts.bottomAnchor, constant: 8),
                tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8),
                tableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
                tableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            ])
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
