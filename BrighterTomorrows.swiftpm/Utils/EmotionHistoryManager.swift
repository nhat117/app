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
class EmotionHistoryManager {
    static let shared = EmotionHistoryManager()

    private let userDefaultsKey = "emotionHistory"

    func saveEmotionEntry(_ entry: EmotionEntry) {
        var history = loadEmotionHistory()
        history.append(entry)
        if let encoded = try? JSONEncoder().encode(history) {
            UserDefaults.standard.set(encoded, forKey: userDefaultsKey)
        }
    }

    func loadEmotionHistory() -> [EmotionEntry] {
        if let savedData = UserDefaults.standard.data(forKey: userDefaultsKey),
           let savedEntries = try? JSONDecoder().decode([EmotionEntry].self, from: savedData) {
            return savedEntries
        }
        return []
    }

}
