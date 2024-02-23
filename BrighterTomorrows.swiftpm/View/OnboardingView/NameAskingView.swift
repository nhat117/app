import SwiftUI

struct NameAskingView: View {
    @State private var username: String = ""
    @State private var isTextClicked: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                // Greeting message
                Text("Hi 👋\n") +
                Text("Please tell us a little bit about ")
                
                // Check tappable text to show text field
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
                    // Show tappable text by default
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
                
                // Check text field is fullfilled to move to next screen
                if (!username.isEmpty) {
                    NavigationLink(destination: AgeAskingView(), label: {
                        Text("Next")
                            .foregroundStyle(Color("secondary"))
                            .font(.system(size: 28))
                        
                        Image(systemName: "arrow.right.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24)
                            .foregroundStyle(Color("secondary"))
                            .opacity(username.isEmpty ? 0.4 : 1.0)
                            .transition(.scale)
                    })
                }
            } // VStack
            .font(.largeTitle)
        } // NavigationStack
    }
}

#Preview {
    NameAskingView()
}
