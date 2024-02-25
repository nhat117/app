import SwiftUI

struct NameAskingView: View {
    @State private var username: String = ""
    @State private var isTextClicked: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Text("Hi 👋\n") +
                Text("Please tell us a little bit about ")
                if isTextClicked {
                    TextField("name", text: $username)
                        .frame(width: 150)
                        .foregroundStyle(Color("primary"))
                        .fontWeight(.bold)
                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                        .cornerRadius(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(lineWidth: 1.0)
                        )
                        .offset(x: 73,y: -66)
                        .autocorrectionDisabled(true)
                        .textContentType(.name)

                } else {
                    Button(role: .none) {
                        withAnimation { isTextClicked.toggle() }
                    } label: {
                        Text("your name")
                            .foregroundColor(Color("primary"))
                            .bold()
                    }
                    .offset(x: 73,y: -43)
                }
                
                Spacer()

                if (!username.isEmpty) {
                    NavigationLink(destination: AgeAskingView(), label: {
                        Text("Next")
                            .foregroundStyle(Color("secondary"))
                            .font(.system(size: 35))
                            .padding()
                        Image(systemName: "arrow.right.circle")
                            .font(.system(size: 35))
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24)
                            .foregroundStyle(Color("secondary"))
                            .opacity(username.isEmpty ? 0.4 : 1.0)
                            .transition(.scale)
                    })
                }
            } 
            .font(.largeTitle)
        }
    }
}

#Preview {
    NameAskingView()
}
