import SwiftUI
struct EmotionEntry: Codable, Identifiable {
    var id: UUID = UUID()
    let emotionName: String
    let date: Date
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
        "Love": Emotion(name: "Love", color: .pink, imageName: "heart")
    ]
    
    static func emotion(for name: String) -> Emotion? {
        return emotions[name]
    }
}
