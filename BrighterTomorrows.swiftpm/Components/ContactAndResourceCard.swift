import SwiftUI
import ExpandableText

struct ContactAndResourceCard: View {
    @State var name: String?
    @State var image: String?
    @State var address: String?
    @State var desc: String?
    @State var contactNumber: String?
    
    
    var body: some View {
        VStack {
            Image(image ?? "rmit_university")
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 25.0))
                .padding()
                .frame(width: 300, height: 300)
                        
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    Image(systemName: "person.crop.square.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.purple)
                        .frame(width: 32)

                    VStack(alignment: .leading) {
                        Text(name ?? "RMIT University")
                            .font(.system(size: 20, weight: .semibold))
                        
                        Text(address ?? "702 Nguyen Van Linh")
                            .font(.system(size: 14))
                            .foregroundStyle(Color("caption_color"))      
                        
                        HStack {
                            Image(systemName: "phone.fill")
                                .resizable()
                                .scaledToFit()
                                .foregroundStyle(.red)
                                .frame(width: 10)
                            
                            Text(contactNumber ?? "028 3776 1300")
                                .font(.system(size: 14))
                                .foregroundStyle(.red)
                        }
                    }
                }
                
                Divider()
                 .frame(height: 1)
                 .padding(.horizontal, 10)
                
                ExpandableText(text: desc ?? "RMIT University Vietnam is the Vietnamese branch of the Australian research university the Royal Melbourne Institute of Technology, known in Australia as RMIT University. It has three campuses located in Ho Chi Minh City, Hanoi and Danang.")
                    .font(.system(size: 14))
                    .lineLimit(4)
                    .foregroundStyle(Color("text_color"))
            }
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10.0))
            
            Spacer()
        }
        .frame(width: 300, height: UIScreen.main.bounds.height - 150)
    }
}

#Preview {
    ContactAndResourceCard()
}
