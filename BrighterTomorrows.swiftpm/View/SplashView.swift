import SwiftUI
import SDWebImageSwiftUI

struct SplashView: View { 
    @Binding var isPresented: Bool
    
    @State private var scale = CGSize(width: 0.8, height: 0.8)
    @State private var imageOpacity = 1.0
    @State private var systemImageOpacity = 0.0
    @StateObject var audioPlayerViewModel = SoundManager(with: SoundManager.Sound.crystal)

    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea(.all)
            
            ZStack {
                // White app logo
                Image("app_icon_white")
                    .resizable()
                    .scaledToFit()
                    .font(.system(size: 105))
                    .foregroundStyle(.white)
                    .frame(width: 100, height: 100)
                    .opacity(systemImageOpacity)

                // Colored app logo
                Image("app_icon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .opacity(imageOpacity)
                    .offset(x: 1)
            }
            .scaleEffect(scale)
        }
        .opacity(1.0)
        .onAppear {
            // Scale up colored icon and unhidden white icon
            withAnimation(.easeInOut(duration: 1.5)) {
                scale = CGSize(width: 1, height: 1)
                systemImageOpacity = 1
                audioPlayerViewModel.playSound() // play openning sound
            }
            
            // Make a splash effect
            for i in 0..<7 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5 + Double(i) * 0.1, execute: {
                    imageOpacity = (imageOpacity == 0.0) ? 1.0 : 0.0
                })
            }
            
            // Blow up white icon animation
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5, execute: {
                withAnimation(.easeIn(duration: 0.25)) {
                  scale = CGSize(width: 220, height: 220)
                }
            })
            
            // Move to Welcome view after 3s
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.9, execute: {
                withAnimation(.easeIn(duration: 0.2)) {
                    isPresented.toggle()
                }
            })
        }
    }
}
