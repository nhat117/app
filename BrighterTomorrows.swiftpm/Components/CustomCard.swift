import SwiftUI

struct CustomCard: View {
    var title: String
    var backgroundColor: Color
    var imageName: String // Use this if you have an image to display
    var useSystemImage: Bool = true

    var body: some View {
        VStack {
            if useSystemImage {
                Image(systemName: imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .foregroundColor(.white)
            } else {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250, height: 250)
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
            }
            
            
            Text(title)
                .font(.title)
                .foregroundColor(.white)
        }
        .frame(width: 300, height: 500)
        .background(backgroundColor)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth: 3)
        )
    }
}

// Preview provider for SwiftUI canvas
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            CustomCard(title: "National Child Helpline", backgroundColor: .orange, imageName: "child_helpline_111_vietnam", useSystemImage: false)
            CustomCard(title: "Surprise", backgroundColor: .orange, imageName: "bell")
            CustomCard(title: "Happiness", backgroundColor: .yellow, imageName: "sun.max")
            CustomCard(title: "Sadness", backgroundColor: .blue, imageName: "cloud.rain")
            CustomCard(title: "Love", backgroundColor: .pink, imageName: "heart")
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .frame(height: 520) // Adjust the height as needed
    }
}

