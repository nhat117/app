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

struct SetupSwitcher: View {
    @AppStorage("login_state") var loginSession: Bool = false  // Stores the user's login state
    @AppStorage("username") var currentUserName: String?  // Optional storage for the user's name
    @AppStorage("age") var currentUserAge: String?  // Optional storage for the user's age
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)  // Sets the background color to white for the entire view
            
            if loginSession {
                HomeView()
            } else {
                OnboardingView()  // Otherwise, displays the onboarding view
            }
        }
    }
}
