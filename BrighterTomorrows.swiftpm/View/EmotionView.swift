import SwiftUI

struct EmotionView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @AppStorage("isDarkMode") private var isDarkMode: Bool = Theme.darkMode
    @State private var sliderValue: Double = 50
    @State private var selectedEmotion: String = "Happiness"
    @State private var selectedImage: UIImage?
    @State private var isPhotoPickerPresented = false
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

    var addButton: some View {
        Button(action: {
            saveCurrentEmotion(emotionName: selectedEmotion)
            presentationMode.wrappedValue.dismiss()
            
        }) {
            Image(systemName: "plus")
                .font(.system(size: 22))
                .foregroundColor(.black)
                .padding(.all, 8)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 2))
                .shadow(radius: 3)
        }
        .frame(width: 44, height: 44)
        .padding()
    }
    var body: some View {
        ZStack (alignment: .topLeading){
            CustomColor().backgroundColor
                .edgesIgnoringSafeArea(.all)
        
            VStack {
                Color.clear.frame(height: 40)
                Text("How do you feel today ?").font(.system(size: 30, weight: .bold))
                Spacer()
                TabView(selection: $selectedEmotion) {
                    CustomCard(title: "Surprise", backgroundColor: .orange, imageName: "bell")
                        .tag("Surprise") // Use .tag to identify this view in the selection
                    CustomCard(title: "Happiness", backgroundColor: .yellow, imageName: "sun.max")
                        .tag("Happiness")
                    CustomCard(title: "Sadness", backgroundColor: .blue, imageName: "cloud.rain")
                        .tag("Sadness")
                    CustomCard(title: "Neutral", backgroundColor: .gray, imageName: "cloud")
                        .tag("Neutral")
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .frame(height: 520)
                Spacer()

            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                HStack(spacing: 20) {
                    backButton
                }
            }   
            ToolbarItem(placement: .topBarTrailing) {
                HStack(spacing: 20) {
                    addButton
                }
            }
            
        }
    }
    func saveCurrentEmotion(emotionName: String) {
        let newEntry = EmotionEntry(emotionName: emotionName)
        EmotionHistoryManager.shared.saveEmotionEntry(newEntry)
    }
}


#Preview{
        EmotionView()
}

