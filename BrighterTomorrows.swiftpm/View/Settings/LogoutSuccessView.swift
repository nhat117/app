import SwiftUI

struct LogoutSuccessView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                Image("waving_hand")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)
                    .transition(.move(edge: .bottom))
                
                Text("COME BACK SOON")
                    .font(.system(size: 24))
                    .fontWeight(.heavy)
                    .padding()
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color("primary"))
                    .transition(.move(edge: .bottom))

                Text("It's sad to see you leave but we hope that you have meaningful journey with us.")
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color("caption_color"))
                    .font(.callout)
                    .fontWeight(.semibold)
                    .transition(.move(edge: .bottom))
            }
            
            Spacer(minLength: 130)
            
            NavigationLink(destination: WelcomeView(), label: {
                Image(systemName: "arrow.right.circle")
                    .font(.system(size: 40))
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30)
                    .foregroundStyle(Color("primary"))
            })
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    LogoutSuccessView()
}
