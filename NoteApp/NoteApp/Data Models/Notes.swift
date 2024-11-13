//
//  Notes.swift
//  NoteApp
//
//  Created by Khai Truong on 11/4/24.
//

import Foundation

struct Note: Codable {
    var _id: String
    var userId: String
    var text: String
    var __v: Int
}
struct Notes: Codable{
    var notes: [Note]
}
