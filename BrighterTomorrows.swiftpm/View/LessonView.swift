import SwiftUI

struct PlaygroundMapView: View {
    @State private var showDetails: Bool = false
    @State private var selectedFeature: PlaygroundFeature?

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Background image of the playground map
                Image("playground_map") // Replace with your map image file name
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                
                // Interactive pins
                // Example pin for the sandbox feature
                Image("Map Pin") // Replace with your map pin image file name
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30) // Adjust size as needed
                    .position(x: geometry.size.width * 0.3, y: geometry.size.height * 0.2) // Position your pin accordingly
                    .onTapGesture {
                        self.selectedFeature = .sandbox
                        self.showDetails = true
                    }
                
                // Add other pin images for different features here, with appropriate x and y multipliers
            }
        }
        .sheet(isPresented: $showDetails) {
            // Present the view for the selected feature
            if let feature = selectedFeature {
                FeatureDetailView(feature: feature)
            }
        }
    }
}

// Enum to represent different features on the playground map
enum PlaygroundFeature {
    case sandbox
    case swings
    case pond
    // Add other features as needed
}

// A detail view that is presented when a feature is tapped
struct FeatureDetailView: View {
    let feature: PlaygroundFeature

    var body: some View {
        // You can customize this view to present detailed information about each feature
        switch feature {
        case .sandbox:
            Text("This is the sandbox where kids can build castles.")
        case .swings:
            Text("Swings can be found here, a favorite for many kids.")
        case .pond:
            Text("The pond is home to ducks and provides a calm area to relax.")
        // Add other cases for different features
        }
    }
}

// Preview provider for SwiftUI canvas
struct PlaygroundMapView_Previews: PreviewProvider {
    static var previews: some View {
        PlaygroundMapView()
    }
}
