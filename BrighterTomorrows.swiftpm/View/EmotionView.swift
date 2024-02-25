import SwiftUI

struct EmotionView: View {
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isDarkMode") private var isDarkMode: Bool = Theme.darkMode
    @State private var selectedEmotion: String = "Happiness"

    private let emotions = [
        ("Surprise", "bell", Color.orange),
        ("Happiness", "sun.max", Color.yellow),
        ("Sadness", "cloud.rain", Color.blue),
        ("Neutral", "cloud", Color.gray)
    ]

    var body: some View {
        ZStack(alignment: .topLeading) {
            CustomColor().backgroundColor
                .edgesIgnoringSafeArea(.all)
        
            VStack {
                Spacer().frame(height: 40) 
                Text("How do you feel today?")
                    .font(.system(size: 30, weight: .bold))
                Spacer()
                emotionTabView
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton, trailing: addButton)
    }

    private var backButton: some View {
        NavigationBarButton(systemName: "arrow.left") {
            presentationMode.wrappedValue.dismiss()
        }
    }

    private var addButton: some View {
        NavigationBarButton(systemName: "plus") {
            saveCurrentEmotion()
            presentationMode.wrappedValue.dismiss()
        }
    }

    private var emotionTabView: some View {
        TabView(selection: $selectedEmotion) {
            ForEach(emotions, id: \.0) { emotion in
                CustomCard(title: emotion.0, backgroundColor: emotion.2, imageName: emotion.1)
                    .tag(emotion.0)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .frame(height: 520)
    }

    private func saveCurrentEmotion() {
        let newEntry = EmotionEntry(emotionName: selectedEmotion)
        EmotionHistoryManager.shared.saveEmotionEntry(newEntry)
    }
}

struct NavigationBarButton: View {
    var systemName: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: systemName)
                .navigationButtonStyle()
        }
    }
}


 #Preview {
     EmotionView()
 }
