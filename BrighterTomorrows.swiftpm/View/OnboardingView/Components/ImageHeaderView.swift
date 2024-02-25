/*
    Author: Bui Minh Nhat
    Email: s3878174@rmit.edu.vn
    Created date: 12/2/2023
    Last modified: 25/2/2023
    Acknowledgements:
        - Inspired by “Children Learning App” from Dribbble,
          https://dribbble.com/shots/7265955-Children-Learning-App/attachments/222641?mode=media (accessed Feb. 24, 2023).
        - Utilized "Apple Documentation" for SwiftUI guidance,
          https://developer.apple.com/documentation/swiftui/ (accessed Feb. 22, 2023).
        - Incorporated best practices from "Hacking With Swift",
          https://www.hackingwithswift.com/ (accessed Feb. 22, 2023).
*/

import SwiftUI


struct ImageHeaderView: View {
    @State private var isAnimatingImage: Bool = false  // Controls the state of the image animation
    private var width = UIScreen.main.bounds.width  // Dynamically calculates the width of the screen for responsive design

    var body: some View {
        ZStack {
            Image("header_img_sheet_view")  // Specifies the image to be displayed
                .resizable()  // Allows the image to be resized
                .scaledToFit()  // Ensures the entire image fits within the given dimensions while maintaining its aspect ratio
                .scaleEffect(isAnimatingImage ? 1.0 : 0.6)  // Animates the scale of the image for a dynamic entrance effect
        }
        .frame(width: (width) - 20)  // Sets the frame width of the ZStack, subtracting 20 for padding
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))  // Clips the ZStack to a rounded rectangle shape
        .onAppear() {
            withAnimation(.easeInOut(duration: 0.5)) {  // Defines the animation to be applied when the view appears
                isAnimatingImage = true  // Triggers the animation
            }
        }
    }
}

 #Preview {
     ImageHeaderView()
         .previewLayout(.fixed(width: 375, height: 200))
 }
