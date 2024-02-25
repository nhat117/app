import SwiftUI

struct SetupSwitcher: View {
    @AppStorage("login_state") var loginSession: Bool = false
    @AppStorage("username") var currentUserName: String?
    @AppStorage("age") var currentUserAge: String?
    
    var body: some View {
        ZStack {
            Color.white
            
            if loginSession {
                HomeView()
            } else {
                OnboardingView()
            }
        }
    }
}
