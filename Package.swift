// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "sqlite-kit",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13)
    ],
    products: [
        .library(name: "SQLiteKit", targets: ["SQLiteKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/sqlite-nio.git", from: "1.2.0"),
        .package(url: "https://github.com/vapor/sql-kit.git", from: "3.19.0"),
        .package(url: "https://github.com/mteep/async-kit.git", branch: "xcode-on-big-sur"),
    ],
    targets: [
        .target(name: "SQLiteKit", dependencies: [
            .product(name: "AsyncKit", package: "async-kit"),
            .product(name: "SQLiteNIO", package: "sqlite-nio"),
            .product(name: "SQLKit", package: "sql-kit"),
        ]),
        .testTarget(name: "SQLiteKitTests", dependencies: [
            .product(name: "SQLKitBenchmark", package: "sql-kit"),
            .target(name: "SQLiteKit"),
        ]),
    ]
)
