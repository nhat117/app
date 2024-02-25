/*  Author: Bui Minh Nhat
    Email: s3878174@rmit.edu.vn
    Created  date: 12/2/2023
    Last modified: 25/2/2023
    Acknowledgement:
        - The UI designs are inspired from:
            “Children Learning App,” Drible,
 https://dribbble.com/shots/7265955-Children-Learning-App/attachments/222641?mode=media
    (accessed Feb. 24, 2023).
        - "Apple Documentation", Apple ,https://developer.apple.com/documentation/swiftui/     (accessed Feb. 22, 2023).
        - "Hacking With Swift", Hacking With Swift, https://www.hackingwithswift.com/
     (accessed Feb. 22, 2023).
*/

import SwiftUI

struct ImageHeaderView: View {
    @State private var isAnimatingImage: Bool = false
    private var width = UIScreen.main.bounds.width

    var body: some View {
        ZStack {
            Image("header_img_sheet_view")
                .resizable()
                .scaledToFit()
                .scaleEffect(isAnimatingImage ? 1.0 : 0.6)
        }
        .frame(width: (width) - 20)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .onAppear() {
            withAnimation(.easeInOut(duration: 0.5)) {
                isAnimatingImage = true
            }
        }
    }
}

#Preview {
    ImageHeaderView()
        .previewLayout(.fixed(width: 375, height: 200))
}
