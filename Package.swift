// swift-tools-version:5.10

import PackageDescription

let package = Package(
    name: "LitecoinKit",
    platforms: [
        .iOS(.v14),
        .macOS(.v12)
    ],
    products: [
        .library(
            name: "LitecoinKit",
            targets: ["LitecoinKit"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/greymass/swift-scrypt.git", from: "1.0.2"),
        .package(url: "https://github.com/sunimp/BitcoinCore.git", .upToNextMajor(from: "1.0.0")),
        .package(url: "https://github.com/sunimp/SWToolKit.git", .upToNextMajor(from: "1.0.0")),
        .package(url: "https://github.com/nicklockwood/SwiftFormat.git", from: "0.54.6"),
    ],
    targets: [
        .target(
            name: "LitecoinKit",
            dependencies: [
                .product(name: "Scrypt", package: "swift-scrypt"),
                "BitcoinCore",
                "SWToolKit",
            ]
        ),
    ]
)
