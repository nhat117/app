import SwiftUI

struct CustomButton: View {
    var body: some View {
        Button(action: {
            // Define the action for the button here
        }) {
            Text("YAY, OK!")
                .font(.system(size: 24, weight: .bold)) // Customize the font size and weight as needed
                .foregroundColor(.white) // Set the text color to white
                .frame(minWidth: 0, maxWidth: .infinity) // Make the button expand to the width of its container
                .padding() // Add some padding around the text
                .background(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.orange]), startPoint: .leading, endPoint: .trailing)) // Apply a gradient background
                .cornerRadius(30) // Apply a corner radius to round the corners
                .shadow(color: .gray, radius: 2, x: 0, y: 2) // Apply a shadow effect
        }
    }
}


// Preview provider for SwiftUI previews in Xcode
struct CustomButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton()
            .padding() // Add padding around the button
    }
}
