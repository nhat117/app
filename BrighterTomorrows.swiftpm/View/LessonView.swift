import SwiftUI

struct PlaygroundMapView: View {
    @State private var selectedFeature: PlaygroundFeature?
    @State private var messageText: String = "" // Message for the chat bubble
    @State private var showMessage: Bool = false // Controls visibility of the message and bubble
    @State private var titleText: String = "Tap on a pin to learn more!" // Default title text

    // Define a data structure for map pin information
    struct MapPin {
        var feature: PlaygroundFeature
        var xMultiplier: CGFloat
        var yMultiplier: CGFloat
    }

    // Create an array of map pins
    let mapPins: [MapPin] = [
        MapPin(feature: .sandbox, xMultiplier: 0.2, yMultiplier: 0.33),
        MapPin(feature: .sandbox, xMultiplier: 0.23, yMultiplier: 0.46),
        MapPin(feature: .sandbox, xMultiplier: 0.4, yMultiplier: 0.67),
        MapPin(feature: .sandbox, xMultiplier: 0.5, yMultiplier: 0.6),
        MapPin(feature: .sandbox, xMultiplier: 0.5, yMultiplier: 0.5),
        MapPin(feature: .sandbox, xMultiplier: 0.6, yMultiplier: 0.3)
        // Add more pins as needed
    ]

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("playground_map") // Background image of the playground map
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .padding() // Add padding around the map for more space
                    .onTapGesture {
                        self.showMessage = false
                        self.titleText = "Tap on a pin to learn more!"
                    }

                Text(titleText) // Title Text
                    .font(.title)
                    .padding([.top, .leading, .trailing], 20)
                    .background(Color.white.opacity(0.85))
                    .cornerRadius(10)
                    .foregroundColor(Color.black)
                    .position(x: geometry.size.width / 2, y: geometry.safeAreaInsets.top + 35)

                ForEach(mapPins.indices, id: \.self) { index in // Iterate over the map pins
                    let pin = mapPins[index]
                    Image("map_pin")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .position(x: geometry.size.width * pin.xMultiplier, y: geometry.size.height * pin.yMultiplier)
                        .onTapGesture {
                            self.selectedFeature = pin.feature
                            self.messageText = "This is the \(pin.feature.description) where kids can build castles."
                            self.showMessage = true
                            self.updateTitle(for: pin.feature)
                        }
                }

                Image("mascot") // Mascot image in the bottom right corner
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .position(x: geometry.size.width - 60, y: geometry.size.height - 90)

                if showMessage { // Chat bubble and message
                    Image("bubble")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 190)
                        .position(x: geometry.size.width - 150, y: geometry.size.height - 180)

                    Text(messageText)
                        .font(.caption)
                        .padding(10)
                        .frame(width: 120)
                        .multilineTextAlignment(.center)
                        .background(Color.white)
                        .cornerRadius(10)
                        .foregroundColor(Color.black)
                        .position(x: geometry.size.width - 150, y: geometry.size.height - 180)
                }

                Button(action: { // Back Button
                    // Action for the back button
                }) {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 24))
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 2))
                        .shadow(radius: 3)
                }
                .padding([.top, .leading], 30)
                .position(x: geometry.safeAreaInsets.leading + 40, y: geometry.safeAreaInsets.top + 35)

                Button(action: { // New button with green background and airplane icon
                    // Define the action for your button here
                }) {
                    Image(systemName: "airplane.departure")
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .clipShape(Circle())
                        .shadow(radius: 3)
                }
                .position(x: geometry.size.width - 40, y: geometry.safeAreaInsets.top + 35) // Positioned opposite to the back button
            }
        }
    }

    private func updateTitle(for feature: PlaygroundFeature) { // Function to update the title text
        switch feature {
        case .sandbox:
            titleText = "Sandbox: Let's build some castles!"
        // Add cases for other features with appropriate messages
        default:
            titleText = "Explore the playground!"
        }
    }
}

enum PlaygroundFeature: CustomStringConvertible { // Enum to represent different features
    case sandbox, swings, pond, parking, slide, picnicArea

    var description: String {
        switch self {
        case .sandbox: return "sandbox"
        // Add descriptions for other features
        default: return "feature"
        }
    }
}

struct PlaygroundMapView_Previews: PreviewProvider { // Preview provider
    static var previews: some View {
        PlaygroundMapView()
    }
}
