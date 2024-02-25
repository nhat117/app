/*
    Author: Bui Minh Nhat
    Email: s3878174@rmit.edu.vn
    Created date: 12/2/2023
    Last modified: 25/2/2023
    Acknowledgements:
        - Inspired by "Children Learning App" on Dribbble,
          https://dribbble.com/shots/7265955-Children-Learning-App/attachments/222641?mode=media (accessed Feb. 24, 2023).
        - Utilized "Apple Documentation" for SwiftUI guidance,
          https://developer.apple.com/documentation/swiftui/ (accessed Feb. 22, 2023).
        - Incorporated best practices from "Hacking With Swift",
          https://www.hackingwithswift.com/ (accessed Feb. 22, 2023).
*/
import SwiftUI

struct EmotionView: View {
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isDarkMode") private var isDarkMode: Bool = ThemeEnum.darkMode
    @State private var selectedEmotion: String = "Happiness"

    // Define a list of emotions with associated icons and colors
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
                emotionTabView  // Display the tab view for selecting emotions
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton, trailing: addButton)
    }

    // Back button to return to the previous view
    private var backButton: some View {
        NavigationBarButton(systemName: "arrow.left") {
            presentationMode.wrappedValue.dismiss()
        }
    }

    // Add button to save the current emotion selection
    private var addButton: some View {
        NavigationBarButton(systemName: "plus") {
            saveCurrentEmotion()
            presentationMode.wrappedValue.dismiss()
        }
    }

    // Tab view to display emotion cards
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

    // Function to save the currently selected emotion
    private func saveCurrentEmotion() {
        let newEntry = EmotionEntry(emotionName: selectedEmotion)
        EmotionHistoryManager.shared.saveEmotionEntry(newEntry)
    }
}


 #Preview {
     EmotionView()
 }
