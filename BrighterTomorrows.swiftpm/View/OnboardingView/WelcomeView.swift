import SwiftUI

struct WelcomeView: View {
    @State private var showSheet: Bool = false
    @State private var animatingButton: Bool = false

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Spacer()
                    Button {
                        showSheet.toggle()
                    } label: {
                        Image(systemName: "info.circle")
                            .padding(.horizontal)
                            .foregroundStyle(Color("primary"))
                    }
                    .sheet(isPresented: $showSheet) {
                        AppInfoView()
                    }
                }
                
                Spacer()
                
                Image("welcome_view_image")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)
                    .transition(.move(edge: .bottom))
                
                Text("It's time to stop hiding child abuse")
                    .font(.title3)
                    .fontWeight(.heavy)
                    .padding()
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color("primary"))
                    .transition(.move(edge: .bottom))

                Text("Empathy is key when addressing domestic violence in any form, whether physical or emotional")
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color("caption_color"))
                    .font(.callout)
                    .fontWeight(.semibold)
                    .transition(.move(edge: .bottom))
            }
            
            Spacer(minLength: 130)
            
            NavigationLink(destination: SetupSwitcher(loginSession: false, currentUserName: nil, currentUserAge: nil), label: {
                Image(systemName: "arrow.right.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30)
                    .foregroundStyle(Color("primary"))
                    .opacity(animatingButton ? 1.0 : 0.7)
                    .scaleEffect(animatingButton ? 1.5 : 1.0)
            })
            .onAppear() {
                withAnimation(.easeInOut(duration: 1).repeatForever()) {
                    animatingButton.toggle()
                }
            }
        }
    }
}

#Preview {
    WelcomeView()
}
