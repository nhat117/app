/*  Author: Bui Minh Nhat
    Email: s3878174@rmit.edu.vn
    Created  date: 12/2/2023
    Last modified: 25/2/2023
    Acknowledgement:
        - The UI designs are inspired from:
            “Children Learning App,” Drible,
 https://dribbble.com/shots/7265955-Children-Learning-App/attachments/222641?mode=media
    (accessed Feb. 24, 2023).
        - "Apple Documentation", Apple ,https://developer.apple.com/documentation/swiftui/     (accessed Feb. 22, 2023).
        - "Hacking With Swift", Hacking With Swift, https://www.hackingwithswift.com/
     (accessed Feb. 22, 2023).
*/
import SwiftUI

struct ContentView: View {
    @State private var isSplashViewPresented: Bool = true

    var body: some View {
        Group {
            if !isSplashViewPresented {
                WelcomeView()
            } else {
                SplashView(isPresented: $isSplashViewPresented)
            }
        }
    }
}

#Preview {
    ContentView()
}
