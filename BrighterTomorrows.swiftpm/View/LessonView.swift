import SwiftUI

struct PlaygroundMapView: View {
    @State private var selectedFeature: PlaygroundFeature?
    @State private var messageText: String = "" // Message for the chat bubble
    @State private var showMessage: Bool = false // Controls visibility of the message and bubble
    @State private var titleText: String = "Tap on a pin to explore!" // Default title text
 
    let lesson = ScenarioData().scenarios1
    // Define a data structure for map pin information
    struct MapPin {
        var feature: PlaygroundFeature
        var xMultiplier: CGFloat
        var yMultiplier: CGFloat
    }

    // Create an array of map pins
    let mapPins: [MapPin] = [
        MapPin(feature: .sandbox, xMultiplier: 0.2, yMultiplier: 0.33),
        MapPin(feature: .swings, xMultiplier: 0.23, yMultiplier: 0.46),
        MapPin(feature: .picnicArea, xMultiplier: 0.4, yMultiplier: 0.67),
        MapPin(feature: .slide, xMultiplier: 0.5, yMultiplier: 0.6),
        MapPin(feature: .parking, xMultiplier: 0.5, yMultiplier: 0.5),
//        MapPin(feature: ., xMultiplier: 0.6, yMultiplier: 0.3)
        // Add more pins as needed
    ]

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color("primary") // Use a semi-transparent primary color for the background
                              .edgesIgnoringSafeArea(.all) // Extend the color to the edges of the screen
                Image("playground_map") // Background image of the playground map
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width - 50, height: geometry.size.height)
                    .padding() // Add padding around the map for more space
                    .onTapGesture {
                        self.showMessage = false
                        self.titleText = "Tap on a pin to explore"
                    }

                Text(titleText) // Title Text
                    .font(.title)
                    .padding([.top, .leading, .trailing], 20)
                    .foregroundColor(Color.black)
                    .position(x: geometry.size.width / 2, y: geometry.safeAreaInsets.top + 50)

                ForEach(mapPins.indices, id: \.self) { index in // Iterate over the map pins
                    let pin = mapPins[index]
                    Image("map_pin")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .position(x: geometry.size.width * pin.xMultiplier, y: geometry.size.height * pin.yMultiplier)
                        .onTapGesture {
                            self.selectedFeature = pin.feature
                                       self.updateContent(for: pin.feature)
                        }
                }

                Image("mascot") // Mascot image in the bottom right corner
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .position(x: geometry.size.width - 80, y: geometry.size.height - 100)

                if showMessage { // Chat bubble and message
                    Image("bubble")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 190)
                        .position(x: geometry.size.width - 160, y: geometry.size.height - 200)

                    Text(messageText)
                        .font(.caption)
                        .padding(10)
                        .frame(width: 120)
                        .multilineTextAlignment(.center)
                        .background(Color.white)
                        .cornerRadius(10)
                        .foregroundColor(Color.black)
                        .position(x: geometry.size.width - 160, y: geometry.size.height - 200)
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
                .position(x: geometry.safeAreaInsets.leading + 40, y: geometry.safeAreaInsets.top - 40)

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
    
    private func updateContent(for feature: PlaygroundFeature) {
            if let scenario = lesson.first(where: { $0.id == feature.rawValue }) {
                self.titleText = scenario.description
                self.messageText = scenario.choices
                self.showMessage = true
            } else {
                self.titleText = "Explore the playground!"
                self.showMessage = false
            }
        }
}

enum PlaygroundFeature: Int, CustomStringConvertible {
    case sandbox = 1, swings, pond, parking, slide, picnicArea

    var description: String {
        switch self {
        case .sandbox: return "sandbox"
        case .swings: return "swings"
        case .pond: return "pond"
        case .parking: return "parking"
        case .slide: return "slide"
        case .picnicArea: return "picnic area"
        }
    }
}


struct PlaygroundMapView_Previews: PreviewProvider { // Preview provider
    static var previews: some View {
        PlaygroundMapView()
    }
}
