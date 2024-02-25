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
import SwiftUI
struct EmotionEntry: Codable, Identifiable {
    var id: UUID = UUID()
    let emotionName: String
    var date: Date = Date()
}

struct Emotion {
    let name: String
    let color: Color
    let imageName: String
}

struct EmotionData {
    static let emotions: [String: Emotion] = [
        "Surprise": Emotion(name: "Surprise", color: .orange, imageName: "bell"),
        "Happiness": Emotion(name: "Happiness", color: .yellow, imageName: "sun.max"),
        "Sadness": Emotion(name: "Sadness", color: .blue, imageName: "cloud.rain"),
        "Neutral": Emotion(name: "Neutral", color: .gray, imageName: "cloud")
    ]
    
    static func emotion(for name: String) -> Emotion? {
        return emotions[name]
    }
}
