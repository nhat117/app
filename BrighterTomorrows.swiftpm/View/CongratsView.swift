import SwiftUI

struct CongratsView: View {
    @Environment(\.dismiss) var dismiss
    @AppStorage("username") var username: String = "Anonymous"
    @AppStorage("srcView") var srcView: String = "1"
    @Binding var isPresenting: Bool
    let backgroundColor = CustomColor().backgroundColor
    var body: some View {
        ZStack(alignment: .topLeading) {
            // Background color
            backgroundColor
                .edgesIgnoringSafeArea(.all)
            
            Button(action: {
                // Action for the back button
                
            }) {
                Image(systemName: "arrow.left") // Use a system image for the back arrow
                    .font(.system(size: 24)) // Set the font size to make the arrow larger
                    .foregroundColor(.black)
                    .padding()
                    .background(Color.white) // Semi-transparent background
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 2))
                    .shadow(radius: 3)
            }
            .padding() // Add padding to move the button a bit from the edges

            VStack {
                Spacer().frame(height: 180) // Add a spacer to push content down a bit
                
                ZStack {
                    // Rounded rectangle background
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.white)
                        .frame(height: 450)
                        .shadow(radius: 5)
                    
                    // Text and image inside the rounded rectangle
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
                
                    Image("ribbon") // Use the correct image name here
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                        .offset(y: -220) // Adjust the offset to position the bottom part of the image over the rectangle
                    
                    // Stars image overlaying the top of the rounded rectangle
                    Image("stars") // Use the correct image name here
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150)
                        .offset(y: -300) // Adjust the offset to position the bottom part of the image over the rectangle
                    Text("\(srcView)").bold().font(.system(size: 30)).offset(y:-250)
                }
                .padding(.horizontal)
            }
        }
    }
}

// Preview provider for SwiftUI previews in Xcode
struct CongratsView_Previews: PreviewProvider {
    static var previews: some View {
        CongratsView(isPresenting: .constant(true))
    }
}
