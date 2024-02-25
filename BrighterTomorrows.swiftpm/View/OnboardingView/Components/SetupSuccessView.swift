import SwiftUI
import Vortex

struct SetupSuccessView: View {
    @State private var offset: CGFloat = (-UIScreen.main.bounds.height)
    
    // Storage
    @AppStorage("username") var currentUserName: String?
    @AppStorage("age") var currentUserAge: String?
    @AppStorage("login_state") var signedInSession: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea(.all)
                
                // Blue circle background
                Circle()
                    .strokeBorder(Color("secondary"), lineWidth: 50)
                    .background(Circle().fill(Color("primary")))
                    .frame(width: UIScreen.main.bounds.width + 500)
                    .offset(y: offset)
                    .onAppear() {
                        offset += 600.0
                    }
                    .animation(Animation.easeOut(duration: 1), value: offset)
                
                // Content body
                VStack {
                    Spacer()
                     
                    // Avatar and welcome message
                    VStack(spacing: 20)  {
                        
                        // Two cirle images
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
                                .font(.system(size: 14, weight: .light))
                                .foregroundStyle(.white)
                            
                            Text("Brighter Tomorrow")
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                    } // VStack: Avatar and welcome message
                    
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
                    } // VStack: Welcome user text
                    
                    // Go to homepage
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
            } // ZStack
        } // NavigationStack
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SetupSuccessView()
}
