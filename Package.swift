// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "Feiertage",
    products: [
        .library(
            name: "Feiertage",
            targets: ["Feiertage"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Feiertage",
            dependencies: []),
        .testTarget(
            name: "FeiertageTests",
            dependencies: ["Feiertage"]),
    ]
)
