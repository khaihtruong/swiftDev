//
//  Contact.swift
//  ContactApp
//
//  Created by Khai Truong on 10/3/24.
//

import Foundation
struct Contact {
    var name: String?
    var phone: String?
    var email: String?
    var type: String?
    var address: String?
    var city: String?
    var zip: String?
    
    init(name: String? = nil, phone: String? = nil, email: String? = nil, type: String? = nil, address: String?, city: String?, zip: String?) {
        self.name = name
        self.phone = phone
        self.email = email
        self.type = type
        self.address = address
        self.city = city
        self.zip = zip
    }
}
