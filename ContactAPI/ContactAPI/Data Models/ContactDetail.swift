//
//  ContactDetail.swift
//  ContactAPI
//
//  Created by Khai Truong on 10/21/24.
//

import Foundation
struct ContactDetail {
    var name: String?
    var phone: String?
    var email: String?
    
    init(name: String? = nil, phone: String? = nil, email: String? = nil) {
        self.name = name
        self.phone = phone
        self.email = email
    }
}
