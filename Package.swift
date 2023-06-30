// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "swift-server",
    platforms: [
        .macOS(.v12),
    ],
    products: [
        .executable(name: "swift-server", targets: ["App"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.2.0"),
        .package(url: "https://github.com/hummingbird-project/hummingbird", from: "1.6.0"),
    ],
    targets: [
        .executableTarget(
            name: "App",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "Hummingbird", package: "hummingbird"),
                .product(name: "HummingbirdFoundation", package: "hummingbird"),
            ],
            swiftSettings: [
                .unsafeFlags(["-cross-module-optimization"], .when(configuration: .release)),
            ]
        ),
        .testTarget(
            name: "AppTests",
            dependencies: [
                .byName(name: "App"),
                .product(name: "HummingbirdXCT", package: "hummingbird"),
            ]
        ),
    ]
)
