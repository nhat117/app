/*
    Author: Bui Minh Nhat
    Email: s3878174@rmit.edu.vn
    Created date: 12/2/2023
    Last modified: 25/2/2023
    Acknowledgements:
        - The UI designs are inspired by “Children Learning App” from Dribbble,
          https://dribbble.com/shots/7265955-Children-Learning-App/attachments/222641?mode=media
          (accessed Feb. 24, 2023).
        - "Expandable Text" feature implemented using code from GitHub,
          https://github.com/NuPlay/ExpandableText.git (accessed Feb. 22, 2023).
        - "SDWebImageSwiftUI" for efficient image handling, from GitHub,
          https://github.com/SDWebImage/SDWebImageSwiftUI (accessed Feb. 22, 2023).
*/

import SwiftUI
import SDWebImageSwiftUI

struct SplashView: View {
    @Binding var isPresented: Bool  // Determines whether the splash screen is displayed
    
    @State private var scale = CGSize(width: 0.8, height: 0.8)  // Initial scale for the logo animation
    @State private var imageOpacity = 1.0  // Controls the opacity of the colored app logo
    @State private var systemImageOpacity = 0.0  // Controls the opacity of the white app logo
    @StateObject var audioPlayerViewModel = SoundManager(with: SoundManager.Sound.crystal)  // Manages sound playback

    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea(.all)  // Black background covering the entire screen
            
            ZStack {
                // White app logo, initially hidden, becomes visible as part of the animation
                Image("app_icon_white")
                    .resizable()
                    .scaledToFit()
                    .font(.system(size: 105))
                    .foregroundStyle(.white)
                    .frame(width: 100, height: 100)
                    .opacity(systemImageOpacity)

                // Colored app logo, visible from the start, participates in the splash animation
                Image("app_icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .opacity(imageOpacity)
                    .offset(x: 1)  // Slight offset to create depth
            }
            .scaleEffect(scale)  // Apply scaling animation to both logos
        }
        .onAppear {
            // Animation sequence for the splash screen
            withAnimation(.easeInOut(duration: 1.5)) {
                scale = CGSize(width: 1, height: 1)  // Scale up logos to their full size
                systemImageOpacity = 1  // Fade in the white logo
                audioPlayerViewModel.playSound()  // Play opening sound effect
            }
            
            // Flicker effect for the colored app logo
            for i in 0..<7 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5 + Double(i) * 0.1) {
                    imageOpacity = (imageOpacity == 0.0) ? 1.0 : 0.0
                }
            }
            
            // "Blow up" animation for the white logo, creating a transition effect
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation(.easeIn(duration: 0.25)) {
                    scale = CGSize(width: 220, height: 220)  // Dramatically increase the scale
                }
            }
            
            // Transition to the Welcome view after the splash animations complete
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.9) {
                withAnimation(.easeIn(duration: 0.2)) {
                    isPresented.toggle()  // Hide the splash screen
                }
            }
        }
    }
}
