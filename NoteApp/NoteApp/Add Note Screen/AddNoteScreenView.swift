//
//  AddNoteScreenView.swift
//  NoteApp
//
//  Created by Khai Truong on 11/4/24.
//

import UIKit

class AddNoteScreenView: UIView {

    var text: UITextField!
    var textView: UITextView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupText()
        
        initConstraints()
    }
    func setupText(){
        text = UITextField()
        text.placeholder = "Add Note Here"
        text.borderStyle = .roundedRect
        text.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(text)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            
            text.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            text.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            text.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
