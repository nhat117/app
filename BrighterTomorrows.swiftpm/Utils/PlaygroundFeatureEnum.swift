/*
    Author: Bui Minh Nhat
    Email: s3878174@rmit.edu.vn
    Created date: 12/2/2023
    Last modified: 25/2/2023
    Acknowledgements:
        - Inspired by “Children Learning App” from Dribbble,
          https://dribbble.com/shots/7265955-Children-Learning-App/attachments/222641?mode=media (accessed Feb. 24, 2023).
        - Utilized "Apple Documentation" for SwiftUI guidance,
          https://developer.apple.com/documentation/swiftui/ (accessed Feb. 22, 2023).
        - Incorporated best practices from "Hacking With Swift",
          https://www.hackingwithswift.com/ (accessed Feb. 22, 2023).
*/

import Foundation

// Enum defining the various features within the playground
enum PlaygroundFeatureEnum: Int, CustomStringConvertible {
    case sandbox = 1, swings, pond, parking, slide, picnicArea

    var description: String {
        switch self {
        case .sandbox: return "sandbox"
        case .swings: return "swings"
        case .pond: return "pond"
        case .parking: return "parking"
        case .slide: return "slide"
        case .picnicArea: return "picnic area"
        }
    }
}
