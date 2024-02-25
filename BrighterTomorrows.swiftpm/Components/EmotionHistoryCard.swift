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
