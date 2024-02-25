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
