// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "FridayWar",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .executable(
            name: "FridayWar",
            targets: ["FridayWar"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/danielgindi/Charts.git", from: "5.0.0"),
        .package(url: "https://github.com/SnapKit/SnapKit.git", from: "5.0.0")
    ],
    targets: [
        .executableTarget(
            name: "FridayWar",
            dependencies: [
                .product(name: "DGCharts", package: "Charts"),
                "SnapKit"
            ],
            path: "FridayWar",
            exclude: [
                "FridayWar-Bridging-Header.h",
                "Info.plist"
            ],
            resources: [
                .process("Assets.xcassets"),
                .process("FridayWar.xcdatamodeld")
            ]
        )
    ]
)
