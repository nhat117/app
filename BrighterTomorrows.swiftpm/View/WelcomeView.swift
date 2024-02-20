import SwiftUI

struct WelcomeView: View {
    @State private var showSheet: Bool = false

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
                    }
                    .sheet(isPresented: $showSheet) {
                        AppInfoView()
                    }
                }
                
                Spacer()
                                
                Image("welcome_view_image")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300)
                
                Text("It's time to stop hiding child abuse")
                    .font(.title3)
                    .fontWeight(.heavy)
                    .padding()
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color("primary"))
                
                Text("Empathy is key when addressing domestic violence in any form, whether physical or emotional")
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color("caption_color"))
                    .font(.callout)
                    .fontWeight(.semibold)
            }
            
            Spacer(minLength: 130)
            
            NavigationLink(destination: HomeView(), label: {
                Image(systemName: "arrow.right.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30)
                    .foregroundStyle(Color("primary"))
            })
        }
    }
}

#Preview {
    WelcomeView()
}
