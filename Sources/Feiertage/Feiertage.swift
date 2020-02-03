import Foundation

extension Date {
    /// Check if the date is a nation-wide holiday.
    /// - Warning: This does not accurately account for historical data, especially before 1990.
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
    /// - Warning: This does not accurately account for historical data, especially before 1990.
    public func isGermanHoliday(in state: GermanState) -> Bool {
        guard !self.isGermanFederalHoliday else { return true }

        guard let year = self.gregorianComponents.year else { return false }
        for holiday in GermanHoliday.nonFederalHolidays {
            guard
                holiday.isHoliday(in: state),
                let holidayDate = holiday.date(in: year)
            else { continue }

            if self.hasSameDateComponents(as: holidayDate) {
                return true
            }
        }
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
    /// Neujahr
    case newYears
    /// Heilige Drei Könige
    case epiphany
    /// Frauentag
    case womensDay

    public static var federalHolidays: [GermanHoliday] {
        [
            .newYears
        ]
    }

    public static var nonFederalHolidays: [GermanHoliday] {
        [
            .epiphany,
            .womensDay
        ]
    }

    public func isHoliday(in state: GermanState) -> Bool {
        switch self {
        case .newYears:
            return true
        case .epiphany:
            return [.bw, .by, .st].contains(state)
        case .womensDay:
            return state == .be
        }
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
        case .epiphany:
            components.day = 6
            components.month = 1
            return components.date
        case .womensDay:
            components.day = 8
            components.month = 3
            return components.date
        }
    }
}
