/*  Author: Bui Minh Nhat
    Email: s3878174@rmit.edu.vn
    Created  date: 12/2/2023
    Last modified: 25/2/2023
    Acknowledgement:
        - The UI designs are inspired from:
            “Children Learning App,” Dribbble,
 https://dribbble.com/shots/7265955-Children-Learning-App/attachments/222641?mode=media
    (accessed Feb. 24, 2023).
        - "Apple Documentation", Apple ,https://developer.apple.com/documentation/swiftui/     (accessed Feb. 22, 2023).
        - "Hacking With Swift", Hacking With Swift, https://www.hackingwithswift.com/
     (accessed Feb. 22, 2023).
*/
import SwiftUI

struct TopicCard: View {
    var title: String
    var backgroundColor: Color
    var imageName: String
    var topicDesc: String?
    
    var body: some View {
        HStack {
            VStack {
                Text(title)
                    .foregroundStyle(Color.white)
                    .font(.system(size: 25, weight: .semibold))
                    .multilineTextAlignment(.leading)
                
                Text(topicDesc ?? "")
                    .foregroundStyle(.white)
                    .font(.system(.caption, weight: .thin))
                    .multilineTextAlignment(.leading)
                
            }
            .padding()
            
            Spacer()
            
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 150)
                .foregroundColor(.white)
        }
        .frame(width: UIScreen.main.bounds.width - 50, height: 120)
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
        .padding(.bottom, 20)
        .shadow(radius: 10, x: 0, y: 10)
    }
}

#Preview {
    TopicCard(title: "Sexually Abuse Children", backgroundColor: Color("red"), imageName: "domestic_violence", topicDesc: "Explore how children are being sexually abused and its preventions")
}
