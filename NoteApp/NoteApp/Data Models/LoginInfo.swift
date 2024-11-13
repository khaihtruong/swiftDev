//
//  LoginInfo.swift
//  NoteApp
//
//  Created by Khai Truong on 11/3/24.
//

import Foundation

struct LoginInfo: Codable{
    var email: String
    var password: String
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}
