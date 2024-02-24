import Foundation

extension Date {
    func formattedAsShortMonthDay() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd (hh:mm)"
        return formatter.string(from: self)
    }
}
