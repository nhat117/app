import SwiftUI

struct CongratsView: View {
    @Environment(\.dismiss) var dismiss
    @AppStorage("username") var username: String = "Anonymous"
    @Binding var isPresenting: Bool
    let backgroundColor = CustomColor().backgroundColor
    var body: some View {
        ZStack(alignment: .topLeading) {
            backgroundColor
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer().frame(height: 180)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.white)
                        .frame(height: 450)
                        .shadow(radius: 5)
                
                    VStack {
                        Text("Good job, \(username)!")
                            .font(.system(size: 30))
                            .padding(.top)
                        Image("congrats") 
  
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300)
                        CustomButton(action: {
                          dismiss()
                            isPresenting = false
                        }).padding()
                    }
                
                    Image("ribbon")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                        .offset(y: -220)
                    
                
                    Image("stars")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150)
                        .offset(y: -300)
                }
                .padding(.horizontal)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct CongratsView_Previews: PreviewProvider {
    static var previews: some View {
        CongratsView(isPresenting: .constant(true))
    }
}
