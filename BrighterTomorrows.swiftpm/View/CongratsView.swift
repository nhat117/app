/*  Author: Bui Minh Nhat
    Email: s3878174@rmit.edu.vn
    Created  date: 12/2/2023
    Last modified: 25/2/2023
    Acknowledgement:
        - The UI designs are inspired from:
            “Children Learning App,” Dribbble,
 https://dribbble.com/shots/7265955-Children-Learning-App/attachments/222641?mode=media
    (accessed Feb. 24, 2023).
        - "Apple Documentation", Apple ,https://developer.apple.com/documentation/swiftui/     (accessed Feb. 22, 2023).
        - "Hacking With Swift", Hacking With Swift, https://www.hackingwithswift.com/
     (accessed Feb. 22, 2023).
*/
import SwiftUI

struct CongratsView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var isPresenting: Bool
    //Storage
    @AppStorage("username") var username: String?
    @AppStorage("srcView") var srcView: String = "1"
    //Body
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
                        Text("Good job, \(username ?? "John Doe")!")
                            .font(.system(size: 30))
                            .padding(.top)
                        Image("congrats") 
  
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300)
                        CustomButton(title: "YAY, OK !",action: {
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

#Preview{
        CongratsView(isPresenting: .constant(true))
}

