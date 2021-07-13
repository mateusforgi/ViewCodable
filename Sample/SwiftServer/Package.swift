// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftServer",
    platforms: [
        .macOS(.v10_15)
    ],
    dependencies: [
        .package(url: "https://github.com/amzn/smoke-framework.git", .upToNextMajor(from: "2.0.0")),
        .package(url: "https://github.com/mateusforgi/ViewCodable", .branch("main")),
    ],
    targets: [
        .target(
            name: "SwiftServer",
            dependencies: [
                .product(name: "SmokeOperationsHTTP1Server", package: "smoke-framework"),
                .product(name: "ViewCodable", package: "ViewCodable")
            ]),
        .testTarget(
            name: "SwiftServerTests",
            dependencies: ["SwiftServer"]),
    ],
    swiftLanguageVersions: [.v5]
)
