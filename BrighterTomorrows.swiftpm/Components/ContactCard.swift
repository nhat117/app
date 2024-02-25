import SwiftUI

struct ContactCard: View {
    var name: String?
    var image: String?
    var address: String?
    var desc: String?
    var contactNumber: String?
    @State private var isExpanded: Bool = false // State to track card expansion


    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(name!).font(.system(size: 23, weight: .bold))
                    
                    HStack {
                        Image(systemName: "phone.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.green)
                        Text(contactNumber!)
                            .font(.system(size: 16))
                    }
                    HStack {
                        Image(systemName: "house.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.gray)
                        Text(address!)
                            .font(.system(size: 14))
                    }
                }
                Spacer()
                
                Image(image!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 100)
                    .foregroundColor(.white)
                    .padding(10)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .padding(3)
            }
            .padding()

            if isExpanded {
                Text(desc!)
                    .font(.system(size: 18))
                    .padding()
                    .transition(.slide) // Adds a transition effect when the description is shown/hidden
            }
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .onTapGesture {
            withAnimation {
                isExpanded.toggle() // Toggle the expanded state when the card is tapped
            }
        }
    }
}


#Preview {
    ContactCard(name: "RMIT University", image: "rmit_university", address: "701 Nguyen Van Linh", desc: "Lorem ipsum dolor sit amet", contactNumber: "12435235")
}
