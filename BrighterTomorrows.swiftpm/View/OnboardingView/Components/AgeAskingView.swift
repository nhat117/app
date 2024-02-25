/*
    Author: Bui Minh Nhat
    Email: s3878174@rmit.edu.vn
    Created date: 12/2/2023
    Last modified: 25/2/2023
    Acknowledgements:
        - Inspired by “Children Learning App” on Dribbble,
          https://dribbble.com/shots/7265955-Children-Learning-App/attachments/222641?mode=media (accessed Feb. 24, 2023).
        - Utilized "Apple Documentation" for SwiftUI guidance,
          https://developer.apple.com/documentation/swiftui/ (accessed Feb. 22, 2023).
        - Incorporated best practices from "Hacking With Swift",
          https://www.hackingwithswift.com/ (accessed Feb. 22, 2023).
*/
import SwiftUI

struct AgeAskingView: View {
    @State private var age: String = ""  // State variable to store the user's age input
    @State private var isTextClicked: Bool = false  // State variable to toggle the text field's active state

    var body: some View {
        NavigationStack {
            VStack {
                Spacer()

                // Prompt text
                Text("How about your ")

                // Conditional TextField or Button based on user interaction
                if isTextClicked {
                    TextField("age", text: $age)  // Active text field for age input
                        .frame(width: 150)
                        .foregroundStyle(Color("primary"))
                        .fontWeight(.bold)
                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                        .cornerRadius(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(lineWidth: 1.0)
                        )
                        .offset(x: -35)
                        .autocorrectionDisabled(true)
                        .keyboardType(.numberPad)  // Ensures numeric input

                } else {
                    Button(role: .none) {
                        withAnimation { isTextClicked.toggle() }  // Animates the transition to the text field
                    } label: {
                        Text("age ?")  // Placeholder button for age input
                            .foregroundColor(Color("primary"))
                            .bold()
                    }
                    .offset(x: -78)
                }

                Spacer()

                // Navigation link to the next view, visible only when the age input is not empty
                if (!age.isEmpty) {
                    NavigationLink(destination: SetupSuccessView(), label: {
                        Text("Next")
                            .foregroundStyle(Color("secondary"))
                            .font(.system(size: 35))
                            .padding()

                        Image(systemName: "arrow.right.circle")
                            .font(.system(size: 35))
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30)
                            .foregroundStyle(Color("primary"))
                            .opacity(age.isEmpty ? 0.4 : 1.0)  // Adjusts opacity based on age input
                            .transition(.scale)
                    })
                }
            }
            .font(.largeTitle)
        }
    }
}

 #Preview {
     AgeAskingView()
 }
