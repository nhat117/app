/*  Author: Bui Minh Nhat
    Email: s3878174@rmit.edu.vn
    Created  date: 12/2/2023
    Last modified: 25/2/2023
    Acknowledgement:
        - The UI designs are inspired from:
            “Children Learning App,” Drible,
 https://dribbble.com/shots/7265955-Children-Learning-App/attachments/222641?mode=media
    (accessed Feb. 24, 2023).
        - "Apple Documentation", Apple ,https://developer.apple.com/documentation/swiftui/     (accessed Feb. 22, 2023).
        - "Hacking With Swift", Hacking With Swift, https://www.hackingwithswift.com/
     (accessed Feb. 22, 2023).
*/
import SwiftUI

struct EmotionHistoryView: View {
    @State private var emotionEntries: [EmotionEntry] = []
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    //Storage
    @AppStorage("isDarkMode") private var isDarkMode: Bool = Theme.darkMode
    
    var backButton: some View {
        Button(action: {
            withAnimation() {
                presentationMode.wrappedValue.dismiss()
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
            Color("primary")
                .ignoresSafeArea()
           
                VStack(spacing: 20) {
                    Text("Emotion Diary")
                        .font(.system(size: 30, weight: .bold))
                        .foregroundStyle(CustomColor().header)
                    ScrollView(showsIndicators: false) {
                        ForEach(emotionEntries) { entry in
                            EmotionHistoryCard(date: entry.date.formattedAsShortMonthDay(), emotionName: entry.emotionName)
                        }
                    }
                }
                .padding()
            
            .onAppear {
                loadEmotionHistory()
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

    private func loadEmotionHistory() {
        emotionEntries = EmotionHistoryManager.shared.loadEmotionHistory()
    }
}

#Preview{
    EmotionHistoryView()
}
