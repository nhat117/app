import SwiftUI

struct EmotionView: View {
    @State private var sliderValue: Double = 50

    var body: some View {
        ZStack (alignment: .topLeading){ // Use a ZStack to ensure the background covers the entire screen
            CustomColor().backgroundColor
                .edgesIgnoringSafeArea(.all) // Make the background extend to the edges
            HStack {
                            Button(action: {
                                // Action for the back button
                            }) {
                                Image(systemName: "arrow.left") // Use a system image for the back arrow
                                    .font(.system(size: 24)) // Set the font size to make the arrow larger
                                    .foregroundColor(.black)
                                    .padding()
                                    .background(Color.white) // Semi-transparent background
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 2))
                                    .shadow(radius: 3)
                            }
                            .padding() // Add padding to move the button a bit from the edges
                            
                            Spacer() // Add a spacer to push the next button to the right
                            
                            Button(action: {
                                // Action for the add button
                            }) {
                                Image(systemName: "camera") // Use a system image for the add button
                                    .font(.system(size: 24)) // Set the font size to make the button larger
                                    .foregroundColor(.black)
                                    .padding()
                                    .background(Color.white) // Semi-transparent background
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 2))
                                    .shadow(radius: 3)
                            }
                            .padding() // Add padding to move the button a bit from the edges
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
