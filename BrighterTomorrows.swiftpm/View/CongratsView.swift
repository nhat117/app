/*
    Author: Bui Minh Nhat
    Email: s3878174@rmit.edu.vn
    Created date: 12/2/2023
    Last modified: 25/2/2023
    Acknowledgements:
        - Inspired by “Children Learning App” on Dribbble,
          https://dribbble.com/shots/7265955-Children-Learning-App/attachments/222641?mode=media (accessed Feb. 24, 2023).
        - Utilized "Apple Documentation" for SwiftUI guidance,
          https://developer.apple.com/documentation/swiftui/ (accessed Feb. 22, 2023).
        - Incorporated best practices from "Hacking With Swift",
          https://www.hackingwithswift.com/ (accessed Feb. 22, 2023).
*/
import SwiftUI

struct CongratsView: View {
    @Environment(\.dismiss) var dismiss  // Environment property for dismissing the view
    @Binding var isPresenting: Bool  // Binding to control the presentation state
    @AppStorage("username") var username: String?  // Stored username for personalization
    @AppStorage("srcView") var srcView: String = "1"  // Source view identifier for get the view data from others view
    let backgroundColor = CustomColor().backgroundColor  // Custom background color

    var body: some View {
        ZStack(alignment: .topLeading) {
            backgroundColor
                .edgesIgnoringSafeArea(.all)

            VStack {
                Spacer().frame(height: 180)  // Spacing for layout adjustment
                
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.white)
                        .frame(height: 450)
                        .shadow(radius: 5)  // White card with shadow for the main content
                    
                    VStack {
                        Text("Good job, \(username ?? "John Doe")!")
                            .font(.system(size: 30))
                            .padding(.top)  // Personalized congratulatory message
                        
                        Image("congrats")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300)  // Congratulatory image
                        
                        CustomButton(title: "YAY, OK !", action: {
                            dismiss()  // Dismisses the view
                            isPresenting = false  // Updates the presentation state
                        }).padding()
                    }
                    
                    Image("ribbon")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                        .offset(y: -220)  // Decorative ribbon image at the top
                    
                    Image("stars")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150)
                        .offset(y: -300)  // Decorative stars image at the top
                }
                .padding(.horizontal)
            }
        }
        .navigationBarBackButtonHidden(true)  // Hides the default navigation bar back button
    }
}

 #Preview {
     CongratsView(isPresenting: .constant(true))
 }
