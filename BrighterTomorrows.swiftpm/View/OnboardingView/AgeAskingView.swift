import SwiftUI

struct AgeAskingView: View {
    @State private var age: String = ""
    @State private var isTextClicked: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()

                // Greeting message
                Text("How about your ")
                
                // Check tappable text to show text field
                if isTextClicked {
                    TextField("age", text: $age)
                        .frame(width: 150)
                        .foregroundStyle(Color("primary"))
                        .fontWeight(.bold)
                        .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
                        .cornerRadius(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(lineWidth: 1.0)
                        )
                        .offset(x: -35)
                        .autocorrectionDisabled(true)
                        .textContentType(.name)
                        .keyboardType(.numberPad)
                    
                } else {
                    // Show tappable text by default
                    Button(role: .none) {
                        withAnimation {
                            isTextClicked.toggle()
                        }
                    } label: {
                        Text("age ?")
                            .foregroundColor(Color("primary"))
                            .bold()
                    }
                    .offset(x: -78)
                }
                
                Spacer()
                
                // Check text field is fullfilled to move to next screen
                if (!age.isEmpty) {
                    NavigationLink(destination: SetupSuccessView(), label: {
                        Text("Next")
                            .foregroundStyle(Color("secondary"))
                            .font(.system(size: 28))

                        Image(systemName: "arrow.right.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30)
                            .foregroundStyle(Color("primary"))
                            .opacity(age.isEmpty ? 0.4 : 1.0)
                            .transition(.scale)
                    })
                }
            } // VStack
            .font(.largeTitle)
        } // NavigationStack
    }
}

#Preview {
    AgeAskingView()
}
