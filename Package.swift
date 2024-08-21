// swift-tools-version:5.10

import PackageDescription

let package = Package(
    name: "LitecoinKit",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "LitecoinKit",
            targets: ["LitecoinKit"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/sunimp/BitcoinCore.Swift.git", .upToNextMajor(from: "3.0.3")),
        .package(url: "https://github.com/greymass/swift-scrypt.git", from: "1.0.0"),
        .package(url: "https://github.com/sunimp/WWToolKit.Swift.git", .upToNextMajor(from: "2.0.7")),
    ],
    targets: [
        .target(
            name: "LitecoinKit",
            dependencies: [
                .product(name: "Scrypt", package: "swift-scrypt"),
                .product(name: "BitcoinCore", package: "BitcoinCore.Swift"),
                .product(name: "WWToolKit", package: "WWToolKit.Swift"),
            ]
        ),
    ]
)
