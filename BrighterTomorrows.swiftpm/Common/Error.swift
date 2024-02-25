/*  Author: Bui Minh Nhat
    Email: s3878174@rmit.edu.vn
    Created  date: 12/2/2023
    Last modified: 25/2/2023
    Acknowledgement:
        - The UI designs are inspired from:
            “Children Learning App,” Dribbble,
 https://dribbble.com/shots/7265955-Children-Learning-App/attachments/222641?mode=media
    (accessed Feb. 24, 2023).
        - "Apple Documentation", Apple ,https://developer.apple.com/documentation/swiftui/     (accessed Feb. 22, 2023).
        - "Hacking With Swift", Hacking With Swift, https://www.hackingwithswift.com/
     (accessed Feb. 22, 2023).
*/
import Foundation

enum CustomError: Error, LocalizedError {
    case nameTooShort
    case nameTooLong
    case ageTooOld
    case ageTooYoung
    
    var failureReason: String? {
        switch self {
        case .nameTooLong:
            return "Your name is too long."
        
        case .nameTooShort:
            return "Your name is too short"
            
        case .ageTooOld:
            return "Your age is too old"
        
        case .ageTooYoung:
            return "Your age is too young"
        }
    }
    
    var suggestion: String? {
        switch self {
        case .nameTooLong:
            return "Name should not be more than 20 characters."
        
        case .nameTooShort:
            return "Name should be at least 2 characters."
            
        case .ageTooOld:
            return "Age should less than 25."
        
        case .ageTooYoung:
            return "Age should larger than 6."
        }
    }
}
