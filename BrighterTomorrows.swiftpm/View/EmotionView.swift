import SwiftUI

struct EmotionView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @AppStorage("isDarkMode") private var isDarkMode: Bool = Theme.darkMode
    @State private var sliderValue: Double = 50

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
        ZStack (alignment: .topLeading){ // Use a ZStack to ensure the background covers the entire screen
            CustomColor().backgroundColor
                .edgesIgnoringSafeArea(.all) // Make the background extend to the edges
            HStack {
                Spacer()
                
                Button(action: {
                    // Action for the add button
                }) {
                    Image(systemName: "camera")
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
                    CustomCard(title: "Surprise", backgroundColor: .orange, imageName: "bell") // Use your actual image name
                    CustomCard(title: "Happiness", backgroundColor: .yellow, imageName: "sun.max")
                    CustomCard(title: "Sadness", backgroundColor: .blue, imageName: "cloud.rain")
                    CustomCard(title: "Love", backgroundColor: .pink, imageName: "heart")
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
}

// Assuming CustomColor is a struct you've defined that contains a 'backgroundColor' property.
// If 'CustomColor().backgroundColor' is not a valid color or CustomColor is not defined,
// replace it with a direct SwiftUI Color, e.g., Color.blue or Color(red: 1.0, green: 0.5, blue: 0.0).

struct EmotionView_Previews: PreviewProvider {
    static var previews: some View {
        EmotionView()
    }
}
