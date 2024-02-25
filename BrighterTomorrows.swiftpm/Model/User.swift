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


