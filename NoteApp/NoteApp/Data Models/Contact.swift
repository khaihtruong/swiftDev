//
//  Contact.swift
//  NoteApp
//
//  Created by Khai Truong on 11/3/24.
//

import Foundation

struct Contact: Codable{
    var name: String
    var email: String
    var password: String
    
    init(name: String, email: String, password: String) {
        self.name = name
        self.email = email
        self.password = password
    }
}
