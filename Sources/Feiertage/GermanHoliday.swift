import Foundation

public enum GermanHoliday: CaseIterable {
    /// Neujahr
    case newYears
    /// Heilige Drei Könige
    case epiphany
    /// Frauentag
    case womensDay
    /// 1. Mai / Tag der Arbeit
    case labourDay
    /// Mariä Himmelfahrt
    case assumptionDay

    public static var federalHolidays: [GermanHoliday] {
        [
            .newYears,
            .labourDay
        ]
    }

    public static var nonFederalHolidays: [GermanHoliday] {
        [
            .epiphany,
            .womensDay,
            .assumptionDay
        ]
    }

    public func isHoliday(in state: GermanState) -> Bool {
        guard !Self.federalHolidays.contains(self) else { return true }
        switch self {
        case .epiphany:
            return [.bw, .by, .st].contains(state)
        case .womensDay:
            return state == .be
        case .assumptionDay:
            return state == .sl
        default:
            fatalError("Holidays should either be federal or state-based. This one is neither.")
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
        case .labourDay:
            components.day = 1
            components.month = 5
            return components.date
        case .assumptionDay:
            components.day = 15
            components.month = 8
            return components.date
        }
    }
}
