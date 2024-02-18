import SwiftUI

struct AchievementCard: View {
    var title: String
    var backgroundColor: Color
    var imageName: String // Use this if you have an image to display
    
    var body: some View {
        VStack {
            Image(imageName) // Replace with your own image handling
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
                .foregroundColor(.white)
            Text("New Achievement")
                .font(.title)
                .foregroundColor(.black)
            HStack(spacing: 0) {
                Text("You earned the ")
                Text(title)
                    .fontWeight(.bold) // Make this part of the text bold
                    .foregroundColor(.orange) // Set the text color for this part
                Text(" Badge")
            
            }
            .fixedSize(horizontal: false, vertical: true)
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
struct AchievementView_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            AchievementCard(title: "Quiz 1", backgroundColor: .white, imageName: "quiz1") // Use your actual image name
            AchievementCard(title: "Quiz 2", backgroundColor: .white, imageName: "quiz2")
            AchievementCard(title: "Love", backgroundColor: .white, imageName: "lesson")
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .frame(height: 520) // Adjust the height as needed
    }
}

