/*
    Author: Bui Minh Nhat
    Email: s3878174@rmit.edu.vn
    Created date: 12/2/2023
    Last modified: 25/2/2023
    Acknowledgements:
        - Inspired by “Children Learning App” on Dribbble,
          https://dribbble.com/shots/7265955-Children-Learning-App/attachments/222641?mode=media (accessed Feb. 24, 2023).
        - Utilized "Apple Documentation" for SwiftUI guidance,
          https://developer.apple.com/documentation/swiftui/ (accessed Feb. 22, 2023).
        - Incorporated best practices from "Hacking With Swift",
          https://www.hackingwithswift.com/ (accessed Feb. 22, 2023).
*/

import SwiftUI

struct EmotionHistoryView: View {
    @State private var emotionEntries: [EmotionEntry] = []  // Holds the list of emotion entries
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @AppStorage("isDarkMode") private var isDarkMode: Bool = ThemeEnum.darkMode  // User's theme preference
    
    // Back button for navigation
    var backButton: some View {
        Button(action: {
            withAnimation() {
                presentationMode.wrappedValue.dismiss()  // Dismisses the current view
            }
        }) {
            Image(systemName: "arrow.left")
                .font(.system(size: 22))
                .foregroundColor(.black)
                .padding(.all, 8)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 2)
                )
                .shadow(radius: 3)
        }
        .frame(width: 44, height: 44)
        .padding(.vertical)
    }

    var body: some View {
        ZStack {
            Color("primary")  // Background color for the view
                .ignoresSafeArea()
           
            VStack(spacing: 20) {
                Text("Emotion Diary")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundStyle(CustomColor().header)  // Custom header style

                // Scrollable list of emotion history cards
                ScrollView(showsIndicators: false) {
                    ForEach(emotionEntries) { entry in
                        EmotionHistoryCard(date: entry.date.formattedAsShortMonthDay(), emotionName: entry.emotionName)
                    }
                }
            }
            .padding()
            .onAppear {
                loadEmotionHistory()  // Loads the emotion history when the view appears
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                HStack(spacing: 20) {
                    backButton
                }
            }
        }
    }

    // Loads the emotion history from the EmotionHistoryManager
    private func loadEmotionHistory() {
        emotionEntries = EmotionHistoryManager.shared.loadEmotionHistory()
    }
}

 #Preview{
     EmotionHistoryView()
 }
