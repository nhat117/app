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
