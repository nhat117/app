import SwiftUI

struct EmotionHistoryCard: View {
    @State var imageName: String = ""
    @State var backgroundColor: Color = .clear
    var date: String
    var emotionName: String
    
    var body: some View {
        VStack {

            HStack {
                VStack(alignment: .leading) {
                    Text(date).font(.system(size: 23, weight: .bold))
                    
                    Text(emotionName)
                        .font(.system(size: 22))
                }
                
                Spacer()
                Image(systemName: imageName)
                          .resizable()
                          .scaledToFit()
                          .frame(width: 40, height: 40)
                          .foregroundColor(.white)
                          .padding(10)
                          .background(backgroundColor)
                          .clipShape(Circle())
                          .overlay(Circle().stroke(Color.white, lineWidth: 4))
                          .padding(3)
            }
            .padding()
            .onAppear(perform: {
                showEmotion()
            })
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
    
    func showEmotion() {
      if let emotion =  EmotionData.emotion(for: emotionName) {
          imageName = emotion.imageName
          backgroundColor = emotion.color
                    }
    }
    
}

#Preview{
    EmotionHistoryCard(date: "SEP 12", emotionName: "Sadness")
}
