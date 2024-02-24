import Foundation

extension Date {
    func formattedAsShortMonthDay() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd" // "Sep 12"
        return formatter.string(from: self).uppercased() // "SEP 12"
    }
}
