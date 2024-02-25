/*
    Author: Bui Minh Nhat
    Email: s3878174@rmit.edu.vn
    Created date: 12/2/2023
    Last modified: 25/2/2023
    Acknowledgements:
        - Inspired by “Children Learning App” from Dribbble,
          https://dribbble.com/shots/7265955-Children-Learning-App/attachments/222641?mode=media (accessed Feb. 24, 2023).
        - Utilized "Apple Documentation" for SwiftUI guidance,
          https://developer.apple.com/documentation/swiftui/ (accessed Feb. 22, 2023).
        - Incorporated best practices from "Hacking With Swift",
          https://www.hackingwithswift.com/ (accessed Feb. 22, 2023).
*/
import SwiftUI

struct CustomCard: View {
    var title: String
    var backgroundColor: Color
    var imageName: String
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
#Preview {
        TabView {
            CustomCard(title: "National Child Helpline", backgroundColor: .orange, imageName: "child_helpline_111_vietnam", useSystemImage: false)
            CustomCard(title: "Surprise", backgroundColor: .orange, imageName: "bell")
            CustomCard(title: "Happiness", backgroundColor: .yellow, imageName: "sun.max")
            CustomCard(title: "Sadness", backgroundColor: .blue, imageName: "cloud.rain")
            CustomCard(title: "Love", backgroundColor: .pink, imageName: "heart")
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .frame(height: 520) 
}


