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

    func testWomensDay() {
        let womensDay2020 = DateComponents(2020, 3, 8).date!
        XCTAssertFalse(womensDay2020.isGermanFederalHoliday)
        XCTAssertTrue(womensDay2020.isGermanHoliday(in: .be))
        XCTAssertFalse(womensDay2020.isGermanHoliday(in: .sn))
    }
}

fileprivate extension DateComponents {
    init(_ year: Int, _ month: Int, _ day: Int) {
        self.init(calendar: .init(identifier: .gregorian), year: year, month: month, day: day)
    }
}
