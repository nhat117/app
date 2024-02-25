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

struct CustomButton: View {
    var title : String
    var action: () -> Void
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.white)
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .background(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.orange]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(30)
                .shadow(color: .gray, radius: 2, x: 0, y: 2)
        }
    }
}


#Preview{
    CustomButton(title: "YAY, OK!", action: {})
            .padding()
}

