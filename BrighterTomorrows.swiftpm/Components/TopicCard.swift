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
                    .font(.system(.title3, weight: .semibold))
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
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 150)
                .foregroundColor(.white)
                .padding(.horizontal)
        }
        .frame(width: UIScreen.main.bounds.width - 50, height: 120)
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
        .padding(.bottom, 20)
        .shadow(radius: 10, x: 0, y: 10)
    }
}

#Preview {
    TopicCard(title: "Domestic Violence", backgroundColor: Color("red"), imageName: "domestic_violence", topicDesc: "Explore how children are being abused and its preventions")
}
