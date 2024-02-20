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
