import SwiftUI

struct PlaygroundMapView: View {
    @State private var selectedFeature: PlaygroundFeature?
    @State private var messageText: String = "" // Empty initial message
    @State private var showMessage: Bool = false // Controls the visibility of the message and bubble

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Background image of the playground map
                Image("playground_map")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .onTapGesture {
                        // Hide the message and bubble when the background is tapped
                        self.showMessage = false
                    }

                // Interactive pins
                // Example pin for the sandbox feature
                Image("map_pin")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .position(x: geometry.size.width * 0.3, y: geometry.size.height * 0.2)
                    .onTapGesture {
                        self.selectedFeature = .sandbox
                        self.messageText = "This is the sandbox where kids can build castles."
                        self.showMessage = true
                    }
                
                Image("map_pin")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .position(x: geometry.size.width * 0.6, y: geometry.size.height * 0.4)
                    .onTapGesture {
                        self.selectedFeature = .sandbox
                        self.messageText = "This is the sandbox where kids can build castles."
                        self.showMessage = true
                    }
                Image("map_pin")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .position(x: geometry.size.width * 0.3, y: geometry.size.height * 0.2)
                    .onTapGesture {
                        self.selectedFeature = .sandbox
                        self.messageText = "This is the sandbox where kids can build castles."
                        self.showMessage = true
                    }
                Image("map_pin")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .position(x: geometry.size.width * 0.3, y: geometry.size.height * 0.2)
                    .onTapGesture {
                        self.selectedFeature = .sandbox
                        self.messageText = "This is the sandbox where kids can build castles."
                        self.showMessage = true
                    }
                Image("map_pin")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .position(x: geometry.size.width * 0.3, y: geometry.size.height * 0.2)
                    .onTapGesture {
                        self.selectedFeature = .sandbox
                        self.messageText = "This is the sandbox where kids can build castles."
                        self.showMessage = true
                    }
                
                // Add other pin images for different features here, with appropriate x and y multipliers

                // Mascot image in the bottom right corner
                Image("mascot") // Replace "mascot" with your mascot image file name
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .position(x: geometry.size.width - 60, y: geometry.size.height - 90 )

                if showMessage {
                    // Chat bubble image near the mascot
                    Image("bubble") // Replace "bubble" with your chat bubble image file name
                        .resizable()
                        .scaledToFit()
                        .frame(width: 160)
                        .position(x: geometry.size.width - 150, y: geometry.size.height - 140)

                    // Text inside the chat bubble
                    Text(messageText)
                        .font(.caption)
                        .padding(10)
                        .frame(width: 120) // Fixed width for the text
                        .multilineTextAlignment(.center) // Center-aligned text
                        .background(Color.white)
                        .cornerRadius(10)
                        .foregroundColor(Color.black)
                        .position(x: geometry.size.width - 150, y: geometry.size.height - 140)
                }
            }
        }
    }
}

// Enum to represent different features on the playground map
enum PlaygroundFeature {
    case sandbox
    case swings
    case pond
    case parking
    case storm
    case island
    // Add other features as needed
}

// Preview provider for SwiftUI canvas
struct PlaygroundMapView_Previews: PreviewProvider {
    static var previews: some View {
        PlaygroundMapView()
    }
}
