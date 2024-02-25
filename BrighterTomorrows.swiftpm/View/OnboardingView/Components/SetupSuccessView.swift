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
import Vortex

struct SetupSuccessView: View {
    @State private var offset: CGFloat = (-UIScreen.main.bounds.height) // Initial animation position
    @AppStorage("username") var currentUserName: String? // Username from AppStorage
    @AppStorage("age") var currentUserAge: String? // User age from AppStorage
    @AppStorage("login_state") var signedInSession: Bool = false // Login state from AppStorage
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background color
                Color.black.ignoresSafeArea(.all)
                
                // Circle animation
                Circle()
                    .strokeBorder(Color("secondary"), lineWidth: 50)
                    .background(Circle().fill(Color("primary")))
                    .frame(width: UIScreen.main.bounds.width + 500)
                    .offset(y: offset)
                    .onAppear {
                        withAnimation(.easeOut(duration: 1)) {
                            offset += 600.0 // Animate the circle up
                        }
                    }
                
                // Content body
                VStack {
                    Spacer()
                    
                    // Avatar and welcome message
                    VStack(spacing: 20) {
                        // Two circle images
                        HStack(spacing: 4) {
                            Image("default_user_avatar")
                                .resizable()
                                .scaledToFit()
                                .clipShape(Circle())
                                .frame(width: 70)
                                .overlay(Circle().stroke(.white, lineWidth: 4))
                                .shadow(radius: 1, y: 8)
                            
                            Image(systemName: "checkmark.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 70)
                                .overlay(Circle().stroke(.white, lineWidth: 4))
                                .shadow(radius: 1, y: 8)
                        }
                        
                        // Greeting message
                        VStack {
                            Text("Happy journey with")
                                .font(.system(size: 25, weight: .light))
                                .foregroundStyle(.white)
                            
                            Text("Brighter Tomorrow")
                                .font(.system(size: 30, weight: .bold))
                                .foregroundStyle(.white)
                        }
                    }
                    
                    Spacer()
                    
                    // Welcome user text
                    VStack {
                        Text("Welcome")
                            .font(.title2)
                            .foregroundStyle(.white)
                        
                        Text(currentUserName ?? "John Doe")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                    }
                    
                    // Go to homepage button
                    NavigationLink(destination: HomeView(), label: {
                        Text("Next")
                            .foregroundStyle(Color("secondary"))
                            .font(.system(size: 28))
                        
                        Image(systemName: "arrow.right.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30)
                            .foregroundStyle(Color("secondary"))
                            .transition(.scale)
                    })
                }
                
                // Firework effect
                VortexView(.fireworks) {
                    Circle()
                        .fill(.white)
                        .blendMode(.plusLighter)
                        .frame(width: 30)
                        .tag("circle")
                }
                .offset(y: -120)
            }
        }
    }
}

#Preview {
  SetupSuccessView()
}
