import SwiftUI

struct CustomCard: View {
    var title: String
    var backgroundColor: Color
    var imageName: String

    var body: some View {
        VStack {
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .foregroundColor(.white)
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
            CustomCard(title: "Surprise", backgroundColor: .orange, imageName: "bell")
            CustomCard(title: "Happiness", backgroundColor: .yellow, imageName: "sun.max")
            CustomCard(title: "Sadness", backgroundColor: .blue, imageName: "cloud.rain")
            CustomCard(title: "Love", backgroundColor: .pink, imageName: "heart")
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .frame(height: 520) 
    }
}

