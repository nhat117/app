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


struct NameAskingView: View {
    @State private var username: String = ""  // State variable to store the user's input
    @State private var isTextClicked: Bool = false  // State variable to toggle the text field's active state
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                // Greeting text with an interactive part for the user's name input
                Text("Hi 👋\n") +
                Text("Please tell us a little bit about ")
                
                // Conditionally displayed TextField or Button based on the user's interaction
                if isTextClicked {
                    TextField("name", text: $username)  // Active text field for name input
                        .frame(width: 150)
                        .foregroundStyle(Color("primary"))
                        .fontWeight(.bold)
                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                        .cornerRadius(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(lineWidth: 1.0)
                        )
                        .offset(x: 73, y: -66)
                        .autocorrectionDisabled(true)
                        .textContentType(.name)

                } else {
                    Button(role: .none) {
                        withAnimation { isTextClicked.toggle() }  // Animates the transition to the text field
                    } label: {
                        Text("your name")  // Placeholder button for name input
                            .foregroundColor(Color("primary"))
                            .bold()
                    }
                    .offset(x: 73, y: -43)
                }
                
                Spacer()

                // Navigation link to the next view, visible only when the username is not empty
                if (!username.isEmpty) {
                    NavigationLink(destination: AgeAskingView(), label: {
                        Text("Next")
                            .foregroundStyle(Color("secondary"))
                            .font(.system(size: 35))
                            .padding()
                        Image(systemName: "arrow.right.circle")
                            .font(.system(size: 35))
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24)
                            .foregroundStyle(Color("secondary"))
                            .opacity(username.isEmpty ? 0.4 : 1.0)  // Adjusts opacity based on username input
                            .transition(.scale)
                    })
                }
            }
            .font(.largeTitle)
        }
    }
}

 #Preview {
     NameAskingView()
 }
