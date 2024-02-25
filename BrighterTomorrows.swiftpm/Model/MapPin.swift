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
import Foundation

struct MapPin {
       var feature: PlaygroundFeatureEnum  // The playground feature the pin represents
       var xMultiplier: CGFloat  // X position as a multiplier of the view's width
       var yMultiplier: CGFloat  // Y position as a multiplier of the view's height
   }
