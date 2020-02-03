import Foundation

extension Date {
    /// Check if the date is a nation-wide holiday.
    /// - Warning: This does not accurately account for historical data!
    public var isGermanFederalHoliday: Bool {
        guard let year = self.gregorianComponents.year else { return false }
        for holiday in GermanHoliday.federalHolidays {
            guard let holidayDate = holiday.date(in: year) else { continue }
            if self.hasSameDateComponents(as: holidayDate) { return true }
        }
        return false
    }

    /// Check if the date is a holiday in the given state.
    /// - Parameter state: A German state.
    /// - Warning: This does not accurately account for historical data!
    public func isGermanHoliday(in state: GermanState) -> Bool {
        guard !self.isGermanFederalHoliday else { return true }
        return false
    }

    private func hasSameDateComponents(as other: Date) -> Bool {
        self.gregorianComponents == other.gregorianComponents
    }

    private var gregorianComponents: DateComponents {
        Calendar(identifier: .gregorian).dateComponents([.day, .month, .year], from: self)
    }
}

public enum GermanHoliday: CaseIterable {
    case newYears

    public static var federalHolidays: [GermanHoliday] {
        [
            .newYears
        ]
    }

    public func date(in year: Int) -> Date? {
        var components = DateComponents()
        components.calendar = .init(identifier: .gregorian)
        components.year = year
        switch self {
        case .newYears:
            components.day = 1
            components.month = 1
            return components.date
        }
    }
}
