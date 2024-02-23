import SwiftUI

struct SetupSwitcher: View {
    @AppStorage("login_state") var loginSession: Bool = false
    @AppStorage("username") var currentUserName: String?
    @AppStorage("age") var currentUserAge: String?
    
    init(loginSession: Bool, currentUserName: String? = nil, currentUserAge: String? = nil) {
        self.loginSession = loginSession
        self.currentUserName = currentUserName
        self.currentUserAge = currentUserAge
    }
    
    var body: some View {
        ZStack {
            Color.white
            
            if loginSession {
                SetupSuccessView()
            } else {
                OnboardingView()
            }
        }
    }
}

#Preview {
    SetupSwitcher(loginSession: false, currentUserName: nil, currentUserAge: nil)
}
