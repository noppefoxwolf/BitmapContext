// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BitmapContext",
    platforms: [.iOS(.v13), .macOS(.v11), .tvOS(.v11), .watchOS(.v4)],
    products: [
        .library(
            name: "BitmapContext",
            targets: ["BitmapContext"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "BitmapContext"
        ),
        .testTarget(
            name: "BitmapContextTests",
            dependencies: ["BitmapContext"],
            resources: [
                .copy("Resource")
            ]
        ),
    ]
)
