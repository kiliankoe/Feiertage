# Feiertage

*WIP*

Check if a date is a german holiday (nation-wide or in a specific state). This is currently nowhere near complete. And yes, I know that I've gotten myself into an [impossibly large rabbit-hole](https://de.wikipedia.org/wiki/Osterdatum).

Hoping for the best the API is supposed to look like this. Check the tests to see how that's turning it out.

```swift
let newYears = DateComponents(calendar: .init(identifier: .gregorian),
                              year: 2020,
                              month: 1,
                              day: 1)
                              
newYears.date!.isGermanFederalHoliday // true
newYears.date!.isGermanHoliday(in: .sn) // true
```
