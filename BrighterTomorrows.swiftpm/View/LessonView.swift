import SwiftUI

struct PlaygroundMapView: View {
    @State private var selectedFeature: PlaygroundFeature?
    @State private var messageText: String = ""
    @State private var showMessage: Bool = false
    @State private var titleText: String = "Tap on a pin to explore!"
    @State private var tappedFeatures: Set<PlaygroundFeature> = []
    @State private var showCongratsView: Bool = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var isPresenting :Bool
    let lesson = ScenarioData().scenarios1

    struct MapPin {
        var feature: PlaygroundFeature
        var xMultiplier: CGFloat
        var yMultiplier: CGFloat
    }

    let mapPins: [MapPin] = [
        MapPin(feature: .sandbox, xMultiplier: 0.2, yMultiplier: 0.33),
        MapPin(feature: .swings, xMultiplier: 0.23, yMultiplier: 0.46),
        MapPin(feature: .picnicArea, xMultiplier: 0.4, yMultiplier: 0.67),
        MapPin(feature: .slide, xMultiplier: 0.5, yMultiplier: 0.6),
        MapPin(feature: .parking, xMultiplier: 0.5, yMultiplier: 0.5),
    ]

    var backButton: some View {
        Button(action: {
            withAnimation() {
                presentationMode.wrappedValue.dismiss()
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
                        self.titleText = "Tap on a pin to explore"
                    }
                
                Text(titleText)
                    .font(.title)
                    .padding([.top, .leading, .trailing], 20)
                    .foregroundColor(Color.black)
                    .position(x: geometry.size.width / 2, y: geometry.safeAreaInsets.top + 50)
                
                ForEach(mapPins.indices, id: \.self) { index in
                    let pin = mapPins[index]
                    Image("map_pin")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .position(x: geometry.size.width * pin.xMultiplier, y: geometry.size.height * pin.yMultiplier)
                        .onTapGesture {
                            self.selectedFeature = pin.feature
                            self.updateContent(for: pin.feature)
                            self.tappedFeatures.insert(pin.feature)
                            if self.tappedFeatures.count == self.mapPins.count {
                                self.showCongratsView = true
                            }
                        }
                }
                
                Image("mascot")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .position(x: geometry.size.width - 80, y: geometry.size.height - 100)
                
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
                
                if showCongratsView {
                    CongratsView(isPresenting: $isPresenting)
                }
                
            }
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

// Your CongratsView code should be here

struct PlaygroundMapView_Previews: PreviewProvider {
    static var previews: some View {
        PlaygroundMapView(isPresenting: .constant(true))
    }
}
