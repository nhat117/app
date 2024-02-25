import SwiftUI

struct ContactGroupCard: View {
    @State var contactList: [Contact]
    @State var contactGroupName: String?
            
    var body: some View {
        VStack(alignment: .leading) {
            Text(contactGroupName?.uppercased() ?? "")
                .font(.system(size: 24, weight: .heavy))
                .foregroundStyle(Color("text_color"))
                .padding()
            
            ForEach(contactList) { item in
                CustomContactCard(imageIcon: item.image, contactName: item.name, contactInfo: item.path)
            }
        }
        .frame(width: UIScreen.main.bounds.width - 50)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        .padding(.bottom, 20)
        .shadow(radius: 10, x: 0, y: 10)
    }
}

struct CustomContactCard: View {
    @State var imageIcon: String
    var useSystemImage: Bool = false
    @State var contactName: String
    @State var contactInfo: String
    
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                if useSystemImage {
                    Image(systemName: imageIcon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 35)
                        .padding(.leading, 30)
                    
                } else {
                    Image(imageIcon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 35)
                        .padding(.leading, 30)
                }
                
                VStack(alignment: .leading, spacing: 6) {
                    Text(contactName)
                        .font(.system(size: 18, weight: .bold))
                        .foregroundStyle(Color("text_color"))

                    Text("[Click here](\(contactInfo))")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundStyle(Color("text_color_secondary"))
                }
                
                Spacer()
            }
            
            Divider()
             .frame(height: 4)
             .padding(.horizontal, 10)
        }
    }
}

#Preview {
    ContactGroupCard(contactList: myContact, contactGroupName: "Social Media")
}
