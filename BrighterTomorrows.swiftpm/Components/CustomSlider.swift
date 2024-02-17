import SwiftUI

struct CustomSlider: View {
    @Binding var value: Double
    
    var body: some View {
        Slider(value: $value, in: 0...100)
            .accentColor(.orange)
            .padding([.leading, .trailing],10)
      
    }
}

struct SliderView: View {
    @State private var sliderValue: Double = 50
    
    var body: some View {
        VStack {
            CustomSlider(value: $sliderValue)
            HStack {
                Text("Whisper")
                Spacer()
                Text("Roar")
            }
            .padding()
        }
    }
}

struct SliderVie_Previews: PreviewProvider {
    static var previews: some View {
        SliderView()
    }
}
