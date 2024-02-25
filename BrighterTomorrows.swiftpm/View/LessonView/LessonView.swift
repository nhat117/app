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

struct PlaygroundMapView: View {
    @State private var selectedFeature: PlaygroundFeatureEnum?  // Tracks the currently selected playground feature
    @State private var messageText: String = ""  // Text content for the message bubble
    @State private var showMessage: Bool = false  // Controls the visibility of the message bubble
    @State private var titleText: String = "Tap on a pin to explore!"  // Title text displayed at the top
    @State private var tappedFeatures: Set<PlaygroundFeatureEnum> = []  // Tracks explored features
    @State private var showCongratsView: Bool = false  // Controls the presentation of the congratulatory view
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var isPresenting :Bool  // Binding to control the presentation state of this view
    let lesson = ScenarioData().scenarios1  // Data model containing scenarios for each playground feature

    // Array of MapPin objects representing pins on the playground map
    let mapPins: [MapPin] = [
        MapPin(feature: .sandbox, xMultiplier: 0.2, yMultiplier: 0.33),
        MapPin(feature: .swings, xMultiplier: 0.23, yMultiplier: 0.46),
        MapPin(feature: .picnicArea, xMultiplier: 0.4, yMultiplier: 0.67),
        MapPin(feature: .slide, xMultiplier: 0.5, yMultiplier: 0.6),
        MapPin(feature: .parking, xMultiplier: 0.5, yMultiplier: 0.5),
    ]

    // Back button UI component
    var backButton: some View {
        Button(action: {
            withAnimation() {
                presentationMode.wrappedValue.dismiss()  // Dismisses the current view
            }
        }) {
            Image(systemName: "arrow.left")
                .font(.system(size: 22))
                .foregroundColor(.black)
                .padding(.all, 8)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 2)
                )
                .shadow(radius: 3)
        }
        .frame(width: 44, height: 44)
        .padding(.vertical)
    }

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color("primary")
                    .edgesIgnoringSafeArea(.all)
                Image("playground_map")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width - 50, height: geometry.size.height)
                    .padding()
                    .onTapGesture {
                        self.showMessage = false
                        self.titleText = "Tap on a pin to explore!"
                    }
                
                // Title text displaying current exploration status or instructions
                Text(titleText)
                    .font(.title)
                    .padding([.top, .leading, .trailing], 20)
                    .foregroundColor(Color.black)
                    .position(x: geometry.size.width / 2, y: geometry.safeAreaInsets.top + 50)
                
                // Pins placed on the map for each feature
                ForEach(mapPins.indices, id: \.self) { index in
                    let pin = mapPins[index]
                    Image("map_pin")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .position(x: geometry.size.width * pin.xMultiplier, y: geometry.size.height * pin.yMultiplier)
                        .onTapGesture {
                            self.selectedFeature = pin.feature
                            self.updateContent(for: pin.feature)  // Updates the view content based on the selected feature
                            self.tappedFeatures.insert(pin.feature)  // Marks the feature as explored
                            if self.tappedFeatures.count == self.mapPins.count {
                                self.showCongratsView = true  // All features explored, show congrats view
                            }
                        }
                }
                
                // Mascot image positioned at the bottom right
                Image("mascot")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .position(x: geometry.size.width - 80, y: geometry.size.height - 100)
                
                // Message bubble and text shown when a feature is tapped
                if showMessage {
                    Image("bubble")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 208)
                        .position(x: geometry.size.width - 160, y: geometry.size.height - 200)
                    
                    Text(messageText)
                        .font(.caption)
                        .padding(10)
                        .frame(width: 118)
                        .multilineTextAlignment(.center)
                        .background(Color.white)
                        .cornerRadius(10)
                        .foregroundColor(Color.black)
                        .position(x: geometry.size.width - 160, y: geometry.size.height - 200)
                }
                
                // Presents the congratulatory view once all features have been explored
                if showCongratsView {
                    CongratsView(isPresenting: $isPresenting)
                }
            }
        }
    }
    
    // Updates the view content based on the selected playground feature
    private func updateContent(for feature: PlaygroundFeatureEnum) {
        if let scenario = lesson.first(where: { $0.id == feature.rawValue }) {
            self.titleText = scenario.description  // Updates the title text with the feature's description
            self.messageText = scenario.choices  // Updates the message text with the feature's associated information
            self.showMessage = true  // Shows the message bubble
        } else {
            self.titleText = "Explore the playground!"  // Default title text if the feature is not found
            self.showMessage = false  // Hides the message bubble
        }
    }
}



 #Preview {
     PlaygroundMapView(isPresenting: .constant(true))
 }
