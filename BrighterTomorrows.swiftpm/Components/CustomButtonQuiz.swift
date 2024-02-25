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
struct CustomButtonQuiz: View {
    var letter: String
    var number: String
    var action: () -> Void
    var gradientColors: [Color]
    var borderColor: Color

    var body: some View {
        Button(action: action) {
            HStack {
                Text(letter)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.leading)
                    .font(.system(size: 25))

                Spacer()

                Text(number)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.trailing)
                    .font(.system(size: 20))
            }
            .frame(width: 350, height: 70)
            .background(LinearGradient(gradient: Gradient(colors: gradientColors), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(borderColor, lineWidth: 5)
            )
        }
    }
}
