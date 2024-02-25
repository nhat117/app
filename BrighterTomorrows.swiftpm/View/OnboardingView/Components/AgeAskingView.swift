import SwiftUI

struct AgeAskingView: View {
    @State private var age: String = ""
    @State private var isTextClicked: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Text("How about your ")
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
                if (!age.isEmpty) {
                    NavigationLink(destination: SetupSuccessView(), label: {
                        Text("Next")
                            .foregroundStyle(Color("secondary"))
                            .font(.system(size: 35))
                            .padding()

                        Image(systemName: "arrow.right.circle")
                            .font(.system(size: 35))
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
