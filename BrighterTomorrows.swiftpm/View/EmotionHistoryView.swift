import SwiftUI

struct EmotionHistoryView: View {
    @State private var emotionEntries: [EmotionEntry] = []

    var body: some View {
        ZStack {
            Color("primary")
                .ignoresSafeArea()
            ScrollView {
                VStack(spacing: 20) {
                    Text("Emotion Diary")
                        .font(.system(size: 30, weight: .bold))
                        .foregroundStyle(CustomColor().header)
                    ForEach(emotionEntries) { entry in
                        EmotionHistoryCard(date: entry.date.formattedAsShortMonthDay(), emotionName: entry.emotionName)
                    }
                }
                .padding()
            }
            .onAppear {
                loadEmotionHistory()
            }
        }
    }

    private func loadEmotionHistory() {
        emotionEntries = EmotionHistoryManager.shared.loadEmotionHistory()
    }
}

struct EmotionalHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        EmotionHistoryView()
    }
}
