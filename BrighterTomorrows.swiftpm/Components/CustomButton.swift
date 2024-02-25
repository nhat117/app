import SwiftUI

struct CustomButton: View {
    var title : String
    var action: () -> Void
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.white)
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .background(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.orange]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(30)
                .shadow(color: .gray, radius: 2, x: 0, y: 2)
        }
    }
}


#Preview{
    CustomButton(title: "YAY, OK!", action: {})
            .padding()
}

