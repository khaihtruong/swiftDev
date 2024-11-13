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
    var imageReceipt: UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupWrapperCellView()
            setupName()
            setupEmail()
            setupPhone()
            setupimageReceipt()
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
    
    func setupimageReceipt() {
        imageReceipt = UIImageView()
        imageReceipt.image = UIImage(systemName: "photo")
        imageReceipt.contentMode = .scaleToFill
        imageReceipt.clipsToBounds = true
        imageReceipt.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(imageReceipt)
    }
    
    func initConstraints(){
            NSLayoutConstraint.activate([
                wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 2),
                wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                
                name.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 4),
                name.leadingAnchor.constraint(equalTo: imageReceipt.trailingAnchor, constant:8),
                name.heightAnchor.constraint(equalToConstant: 20),
                
                email.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 4),
                email.leadingAnchor.constraint(equalTo: imageReceipt.trailingAnchor, constant:8),
                email.heightAnchor.constraint(equalToConstant: 20),
                
                phone.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 4),
                phone.leadingAnchor.constraint(equalTo: imageReceipt.trailingAnchor, constant:8),
                phone.heightAnchor.constraint(equalToConstant: 20),
                
                imageReceipt.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 8),
                imageReceipt.centerYAnchor.constraint(equalTo: wrapperCellView.centerYAnchor),
                imageReceipt.heightAnchor.constraint(equalTo: wrapperCellView.heightAnchor, constant: -20),
                imageReceipt.widthAnchor.constraint(equalTo: wrapperCellView.heightAnchor, constant: -20),
                
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
