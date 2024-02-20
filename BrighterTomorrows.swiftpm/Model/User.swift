//
//  File.swift
//  
//
//  Created by Nhat Bui Minh on 2/20/24.
//

import Foundation

struct User : Identifiable {
    let id = UUID()
    let name : String
    let age: Int
    let achievements = EmptyCollection<Achievement>()
}

struct Achievement{
    let name : String
    let dsc: String
    let img : String
}


