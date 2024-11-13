//
//  NoteDetailScreenView.swift
//  NoteApp
//
//  Created by Khai Truong on 11/4/24.
//

import UIKit

class NoteDetailScreenView: UIView {

    var text: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupText()
        
        initConstraints()
    }
    
    func setupText() {
        text = UILabel()
        text.textColor = .black
        text.numberOfLines = 0
        text.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
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
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
