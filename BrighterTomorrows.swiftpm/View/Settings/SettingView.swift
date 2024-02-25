import SwiftUI

struct SettingView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    @AppStorage("username") private var username: String?
    @AppStorage("age") private var age: String?
    @AppStorage("login_state") var loginSession: Bool = false
    
    @State private var emotionEntries: [EmotionEntry] = []

    var backButton: some View {
        Button(action: {
            withAnimation() {
                presentationMode.wrappedValue.dismiss()
            }
        }) {
            Image(systemName: "arrow.left")
                .font(.system(size: 22))
                .foregroundColor(.black)
                .padding(.all, 8)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 2)
                )
                .shadow(radius: 3)
        }
        .padding(.vertical)
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    // Background
                    Image("profile_background")
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width, height: 300)
                        .blur(radius: 0.7)
                        .clipShape(UnevenRoundedRectangle(cornerRadii: .init(
                            bottomLeading: 40.0, bottomTrailing: 40.0)))
                    
                    VStack {
                        // Avatar
                        Image("default_user_avatar")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                        
                        // Username
                        Text(username ?? "John Doe")
                            .font(.title)
                        
                        Divider()
                         .frame(height: 1)
                         .padding(.horizontal, 10)
                        
                        // User details
                        HStack(spacing: 40) {
                            VStack {
                                Text(age ?? "N/A")
                                    .font(.system(size: 30, weight: .bold))
                                                    
                                Text("years old")
                                    .font(.system(size: 20, weight: .light))
                                    .foregroundStyle(Color("caption_color"))
                            }
                            
                            Divider().frame(width: 1, height: 60)

                            VStack {
                                Text(String(emotionEntries.count) )
                                    .font(.system(size: 30, weight: .bold))
                                                    
                                Text("emotion entries")
                                    .font(.system(size: 20, weight: .light))
                                    .foregroundStyle(Color("caption_color"))
                            }
                        }
                        
                        Spacer(minLength: 40)
                                        
                        // Contact Us
                        NavigationLink(destination: ContactUsView()) {
                            SettingItem(imageIcon: "headphones", useSystemImage: true, contactName: "Contact us")
                        }
                        
                        // About Us
                        NavigationLink(destination: AboutUsView()) {
                            SettingItem(imageIcon: "questionmark.circle", useSystemImage: true, contactName: "About us")
                        }        
                        
                        // Logout
                        NavigationLink(destination: LogoutSuccessView()) {
                            SettingItem(imageIcon: "rectangle.portrait.and.arrow.right", useSystemImage: true, contactName: "Logout", role: "logout")
                        }
                        .simultaneousGesture(TapGesture().onEnded {
                            self.username = nil
                            self.age = nil
                            self.loginSession = false
                        })
                    }
                    .offset(y: -60)
                } // VStack
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        HStack(spacing: 20) {
                            backButton
                        }
                    }
                }
            } // ScrollView
        } // NavigationStack
        .onAppear {
            loadEmotionHistory()
        }
    }
    
    private func loadEmotionHistory() {
        emotionEntries = EmotionHistoryManager.shared.loadEmotionHistory()
    }
}

struct SettingItem: View {
    @State var imageIcon: String
    var useSystemImage: Bool = false
    @State var contactName: String
    var role: String?
    
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                if useSystemImage {
                    Image(systemName: imageIcon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 35)
                        .padding(.leading, (role?.lowercased() != "logout") ? 20 : 22)

                } else {
                    Image(imageIcon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 35)
                        .padding(.leading, (role?.lowercased() != "logout") ? 20 : 22)
                }
                
                Text(contactName)
                    .font(.system(size: 18, weight: .bold))

                Spacer()
                
                if role?.lowercased() != "logout" {
                    Image(systemName: "arrow.right.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 35)
                        .padding(.trailing, 30)
                }
            }
            .foregroundStyle((role != "logout") ? Color("text_color") : .red)
            .padding(.horizontal, (role?.lowercased() != "logout") ? 20 : 25)
            
            Divider()
             .frame(height: 4)
             .padding(.horizontal, 40)
        }
    }
}


#Preview {
    SettingView()
}

#Preview {
    SettingItem(imageIcon: "questionmark.circle", useSystemImage: true, contactName: "About")
}
