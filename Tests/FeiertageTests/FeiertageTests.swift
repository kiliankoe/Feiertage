import XCTest
@testable import Feiertage

final class FeiertageTests: XCTestCase {
    func testFederalHolidays() {
        for holiday in GermanHoliday.federalHolidays {
            XCTAssertTrue(holiday.date(in: 2020)!.isGermanFederalHoliday)
        }
    }

    func testNonFederalHolidays() {
        for holiday in GermanHoliday.nonFederalHolidays {
            XCTAssertFalse(holiday.date(in: 2020)!.isGermanFederalHoliday)
        }
    }

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

    func testAssumptionDay() {
        let assumptionDay2020 = DateComponents(2020, 8, 15).date!
        XCTAssertFalse(assumptionDay2020.isGermanFederalHoliday)
        XCTAssertTrue(assumptionDay2020.isGermanHoliday(in: .sl))
        XCTAssertFalse(assumptionDay2020.isGermanHoliday(in: .sn))
    }
}

fileprivate extension DateComponents {
    init(_ year: Int, _ month: Int, _ day: Int) {
        self.init(calendar: .init(identifier: .gregorian), year: year, month: month, day: day)
    }
}
