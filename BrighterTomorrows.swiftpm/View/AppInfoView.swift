//
//  SwiftUIView.swift
//  
//
//  Created by Trí Lai on 20/02/2024.
//

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
                .tint(.secondary)
                
                Spacer()

            }
            
            ImageHeaderView()
            
            // Body
            Form {
                Section {
                    Text("""
                        The app is designed to educate children about domestic violence and also raise awareness in protecting themselves from maltreatments.
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
                    } // HStack: Event
                    
                    // Category
                    HStack {
                        Text("Category")
                        Spacer()
                        Text("Education")
                    } // HStack: Category
                    
                    // Author
                    HStack {
                        Text("Author")
                        Spacer()
                        Text("Nhat Bui")
                    } // HStack: Author
                    
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
