/*  Author: Bui Minh Nhat
    Email: s3878174@rmit.edu.vn
    Created  date: 12/2/2023
    Last modified: 25/2/2023
    Acknowledgement:
        - The UI designs are inspired from:
            “Children Learning App,” Drible,
 https://dribbble.com/shots/7265955-Children-Learning-App/attachments/222641?mode=media
    (accessed Feb. 24, 2023).
        - "Apple Documentation", Apple ,https://developer.apple.com/documentation/swiftui/     (accessed Feb. 22, 2023).
        - "Hacking With Swift", Hacking With Swift, https://www.hackingwithswift.com/
     (accessed Feb. 22, 2023).
*/
import SwiftUI

struct AppInfoView: View {
    @Environment(\.dismiss) var dismiss
    @State var isAnimatingImage = false
    
    var body: some View {
        VStack {
            HStack {
                Button("Dismiss") {
                    dismiss()
                }
                .padding()
                .tint(Color("primary"))
                
                Spacer()

            }
            
            ImageHeaderView()
            Form {
                Section {
                    Text("""
                        The app is designed to educate children in protecting themselves from maltreatments.
                        """)
                    Text("\"I once was a victim, now I am a survivor!\"")
                        .italic()
                        .font(.subheadline)
                } header: {
                    HStack {
                        Image(systemName: "hand.wave.fill")
                        Text("Brief introduction")
                    }
                }
                
                Section {
                    // App name
                    HStack {
                        Text("App name")
                        Spacer()
                        Text("Brighter Tomorrow")
                    } // HStack: App name
                    
                    // Event
                    HStack {
                        Text("Event")
                        Spacer()
                        Text("Swift Student Challenge")
                    }
                    HStack {
                        Text("Category")
                        Spacer()
                        Text("Education")
                    }
                    HStack {
                        Text("Author")
                        Spacer()
                        Text("Nhat Bui")
                    }
                    
                } header: {
                    HStack {
                        Image(systemName: "info.circle.fill")
                        Text("Application Information")
                    }
                }
            }
            
            VStack {
                Text("Copyright © 2024 Brighter Tomorrow. \nAll rights reserved.")
                    .foregroundColor(.gray)
                    .font(.footnote)
                    .multilineTextAlignment(.center)
            }
        }
    }
}

#Preview {
    AppInfoView()
}
