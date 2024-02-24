import SwiftUI

struct EmotionView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @AppStorage("isDarkMode") private var isDarkMode: Bool = Theme.darkMode
    @State private var sliderValue: Double = 50
    @State private var selectedEmotion: String = "Happiness"
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
        .padding(.vertical)
    }
    
    var body: some View {
        ZStack (alignment: .topLeading){
            CustomColor().backgroundColor
                .edgesIgnoringSafeArea(.all)
            HStack {
                Spacer()
                
                Button(action: {
               
                    presentationMode.wrappedValue.dismiss()
                    
                }) {
                    Image(systemName: "plus")
                        .font(.system(size: 24))
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.white) // Semi-transparent background
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 2))
                        .shadow(radius: 3)
                }
                .padding()
            }
            VStack {
                Color.clear.frame(height: 90)
                Text("How do you feel today ?").font(.system(size: 30, weight: .bold))
                TabView {
                    CustomCard(title: "Surprise", backgroundColor: .orange, imageName: "bell").onTapGesture {
                        selectedEmotion = "Surprise"
                    }
                    CustomCard(title: "Happiness", backgroundColor: .yellow, imageName: "sun.max").onTapGesture {
                        selectedEmotion = "Happiness"
                    }
                    CustomCard(title: "Sadness", backgroundColor: .blue, imageName: "cloud.rain").onTapGesture {
                        selectedEmotion = "Sadness"
                    }
                    CustomCard(title: "Love", backgroundColor: .pink, imageName: "heart").onTapGesture {
                        selectedEmotion = "Love"
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .frame(height: 520) // Adjust the height as needed
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
    func saveCurrentEmotion(emotionName: String) {
        let newEntry = EmotionEntry(emotionName: emotionName)
        EmotionHistoryManager.shared.saveEmotionEntry(newEntry)
    }
}


struct EmotionView_Previews: PreviewProvider {
    static var previews: some View {
        EmotionView()
    }
}
