//
//  Contact.swift
//  PhoneContact
//
//  Created by Khai Truong on 10/1/24.
//

import Foundation
struct Contact {
    var name: String?
    var phone: Double?
    var email: String?
    var type: String?
    
    init(name: String? = nil, phone: Double? = nil, email: String? = nil, type: String? = nil) {
        self.name = name
        self.phone = phone
        self.email = email
        self.type = type
    }
}
