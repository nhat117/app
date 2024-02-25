import Foundation

struct Contact: Identifiable {
    var id = UUID()
    var image: String
    var name: String
    var path: String
    
    init(image: String, name: String, path: String) {
        self.image = image
        self.name = name
        self.path = path
    }
}

let myContact: [Contact] = [
    Contact(image: "facebook_icon", name: "Facebook", path: "https://www.facebook.com/buiminhnhat122"),
    Contact(image: "linkedin_icon", name: "LinkedIn", path: "https://www.linkedin.com/in/nhat-minh-bui-9142561b7/")
]
