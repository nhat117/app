import SwiftUI
extension Image {
    func navigationButtonStyle() -> some View {
        self
            .font(.system(size: 22))
            .foregroundColor(.black)
            .padding(.all, 8)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 2))
            .shadow(radius: 3)
            .frame(width: 44, height: 44)
    }
}
