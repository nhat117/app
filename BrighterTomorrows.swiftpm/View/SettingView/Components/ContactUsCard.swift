import SwiftUI

struct ContactUsCard: View {
    @State var imageIcon: String
    var useSystemImage: Bool = false
    @State var contactName: String
    @State var contactInfo: String
    
    var body: some View {
        HStack(spacing: 20) {
            if useSystemImage {
                Image(systemName: imageIcon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30)
                    .foregroundStyle(Color("text_color_secondary"))
                    .padding(.leading, 30)

            } else {
                Image(imageIcon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30)
                    .foregroundStyle(Color("text_color_secondary"))
                    .padding(.leading, 30)
            }
            
            VStack(alignment: .leading, spacing: 6) {
                Text(contactName)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundStyle(Color("text_color"))

                Text(contactInfo)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(Color("text_color_secondary"))

            }
            
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width - 50, height: 70)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        .shadow(radius: 10, x: 0, y: 10)
    }
}

#Preview {
    ContactUsCard(imageIcon: "phone.fill", useSystemImage: true, contactName: "Phone number", contactInfo: "(+84) 069 123 456")
}
