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
