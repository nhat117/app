import SwiftUI

struct CustomCard: View {
    var title: String
    var backgroundColor: Color
    var imageName: String // Use this if you have an image to display
    
    var body: some View {
        VStack {
            Image(systemName: imageName) // Replace with your own image handling
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .foregroundColor(.white)
            Text(title)
                .font(.title)
                .foregroundColor(.white)
        }
        .frame(width: 300, height: 500) // Adjust the size as needed
        .background(backgroundColor)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20) // Match the cornerRadius value with the one used in .cornerRadius()
                .stroke(Color.black, lineWidth: 3) // Here you can set the border color and line width
        )
    }
}

// Preview provider for SwiftUI canvas
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
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

