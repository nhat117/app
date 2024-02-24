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
            return "Age should larger than 10."
        }
    }
}
