//
//  NoteScreenView.swift
//  NoteApp
//
//  Created by Khai Truong on 11/4/24.
//

import UIKit

class NoteScreenView: UIView {

    var tableViewNotes: UITableView!
    var bottomAddView:UIView!
    var buttonAdd:UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupTableViewContacts()
        setupBottomAddView()
        setupButtonAdd()
        
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTableViewContacts(){
        tableViewNotes = UITableView()
        tableViewNotes.register(NoteScreenTableViewCell.self, forCellReuseIdentifier: "notes")
        tableViewNotes.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewNotes)
    }
    
    func setupBottomAddView(){
        bottomAddView = UIView()
        bottomAddView.backgroundColor = .white
        bottomAddView.layer.cornerRadius = 6
        bottomAddView.layer.shadowColor = UIColor.lightGray.cgColor
        bottomAddView.layer.shadowOffset = .zero
        bottomAddView.layer.shadowRadius = 4.0
        bottomAddView.layer.shadowOpacity = 0.7
        bottomAddView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(bottomAddView)
    }
    
    func setupButtonAdd(){
        buttonAdd = UIButton(type: .system)
        buttonAdd.titleLabel?.font = .boldSystemFont(ofSize: 16)
        buttonAdd.setTitle("Add New Note", for: .normal)
        buttonAdd.translatesAutoresizingMaskIntoConstraints = false
        bottomAddView.addSubview(buttonAdd)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            bottomAddView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor,constant: -8),
            bottomAddView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            bottomAddView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            
            buttonAdd.bottomAnchor.constraint(equalTo: bottomAddView.bottomAnchor, constant: -8),
            buttonAdd.leadingAnchor.constraint(equalTo: bottomAddView.leadingAnchor, constant: 4),
            buttonAdd.trailingAnchor.constraint(equalTo: bottomAddView.trailingAnchor, constant: -4),
            
            bottomAddView.topAnchor.constraint(equalTo: buttonAdd.topAnchor, constant: -8),
            
            tableViewNotes.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            tableViewNotes.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            tableViewNotes.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            tableViewNotes.bottomAnchor.constraint(equalTo: bottomAddView.topAnchor, constant: -8),
            
        ])
    }
}
