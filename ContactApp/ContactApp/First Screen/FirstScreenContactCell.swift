//
//  FirstScreenContactCell.swift
//  ContactApp
//
//  Created by Khai Truong on 10/3/24.
//

import UIKit

class FirstScreenContactCell: UITableViewCell {

    var wrapperCellView: UIView!
    var name: UILabel!
    var email: UILabel!
    var phone: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupWrapperCellView()
            setupName()
            setupEmail()
            setupPhone()
            initConstraints()
        }
    
    func setupWrapperCellView() {
        wrapperCellView = UITableViewCell()
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.layer.borderColor = UIColor.gray.cgColor
        wrapperCellView.layer.borderWidth = 1
        wrapperCellView.layer.cornerRadius = 10
        self.addSubview(wrapperCellView)
    }
    
    func setupName() {
        name = UILabel()
        name.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        name.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(name)
    }
    
    func setupEmail() {
        email = UILabel()
        email.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(email)
    }
    
    func setupPhone() {
        phone = UILabel()
        phone .translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(phone)
    }
    
    func initConstraints(){
            NSLayoutConstraint.activate([
                wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 2),
                wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                
                name.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 4),
                name.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 4),
                name.heightAnchor.constraint(equalToConstant: 20),
                
                email.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 4),
                email.leadingAnchor.constraint(equalTo: name.leadingAnchor),
                email.heightAnchor.constraint(equalToConstant: 20),
                
                phone.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 4),
                phone.leadingAnchor.constraint(equalTo: email.leadingAnchor),
                phone.heightAnchor.constraint(equalToConstant: 20),
                
                wrapperCellView.heightAnchor.constraint(equalToConstant: 76)
            ])
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
