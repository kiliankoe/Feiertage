import XCTest
@testable import Feiertage

final class FeiertageTests: XCTestCase {
    func testNewYears() {
        let newYears2020 = DateComponents(2020, 1, 1).date!
        XCTAssertTrue(newYears2020.isGermanFederalHoliday)
        XCTAssertTrue(newYears2020.isGermanHoliday(in: .sn))
    }

    func testEpiphany() {
        let epiphany2020 = DateComponents(2020, 1, 6).date!
        XCTAssertFalse(epiphany2020.isGermanFederalHoliday)
        XCTAssertTrue(epiphany2020.isGermanHoliday(in: .by))
        XCTAssertFalse(epiphany2020.isGermanHoliday(in: .sn))
    }
}

fileprivate extension DateComponents {
    init(_ year: Int, _ month: Int, _ day: Int) {
        self.init(calendar: .init(identifier: .gregorian), year: year, month: month, day: day)
    }
}
