/*  Author: Bui Minh Nhat
    Email: s3878174@rmit.edu.vn
    Created date: 12/2/2023
    Last modified: 25/2/2023
    Acknowledgement:
        - The UI designs are inspired from:
            “Children Learning App,” Dribbble,
            https://dribbble.com/shots/7265955-Children-Learning-App/attachments/222641?mode=media
            (accessed Feb. 24, 2023).
        - "Apple Documentation", Apple, https://developer.apple.com/documentation/swiftui/
            (accessed Feb. 22, 2023).
        - "Hacking With Swift", Hacking With Swift, https://www.hackingwithswift.com/
            (accessed Feb. 22, 2023).
*/
import SwiftUI
struct WelcomeView: View {
    @State private var showSheet: Bool = false  // Controls the presentation of the AppInfoView
    @State private var animatingButton: Bool = false  // Controls the animation state of the navigation button

    var body: some View {
        NavigationStack {
            VStack {
                // Information button at the top right corner
                HStack {
                    Spacer()
                    Button {
                        showSheet.toggle()  // Toggle the state to show or hide the AppInfoView
                    } label: {
                        Image(systemName: "info.circle")
                            .font(.system(size: 30))
                            .padding(.horizontal)
                            .foregroundStyle(Color("primary"))
                    }
                    .sheet(isPresented: $showSheet) {
                        AppInfoView()  // Presents additional information about the app
                    }
                }
                
                Spacer()
                
                // Main image in the Welcome view
                Image("welcome_view_image")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)
                    .transition(.move(edge: .bottom))  // Animation for the image appearance
                
                // Main welcome message
                Text("It's time to stop children from being sexually abused")
                    .font(.system(size: 24))
                    .fontWeight(.heavy)
                    .padding()
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color("primary"))
                    .transition(.move(edge: .bottom))  // Animation for the text appearance

                // Additional information about the app's purpose
                Text("Empathy is key when addressing child sexual abuse in any form, whether physical or emotional")
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color("caption_color"))
                    .font(.callout)
                    .fontWeight(.semibold)
                    .transition(.move(edge: .bottom))  // Animation for the text appearance
            }
            
            Spacer(minLength: 130)
            
            NavigationLink(destination: SetupSwitcher(), label: {
                Image(systemName: "arrow.right.circle")
                    .font(.system(size: 40))
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30)
                    .foregroundStyle(Color("primary"))
                    .opacity(animatingButton ? 1.0 : 0.7)  // Adjusts opacity based on animation state
                    .scaleEffect(animatingButton ? 1.5 : 1.0)  // Adjusts size based on animation state
            })
            .onAppear() {
                withAnimation(.easeInOut(duration: 1).repeatForever()) {
                    animatingButton.toggle()  // Triggers the button animation
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

 #Preview {
     WelcomeView()
 }

