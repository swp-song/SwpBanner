// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwpBanner",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "SwpBanner", targets: ["SwpBanner"]),
    ],
    dependencies: [
        .package(url: "https://github.com/SDWebImage/SDWebImage.git", .upToNextMajor(from: "5.0.0"))

    ],
    targets: [
        .target(
            name: "SwpBanner",
            dependencies: ["SDWebImage"],
            path: "SwpBanner",
            sources: ["Code/Core", "Code/Private"],
            resources: [
                .process("Resources/SwpBanner.bundle")
            ],
            publicHeadersPath: "Code/Core/",
            cSettings: [
                .headerSearchPath("Code/Core"),
                .headerSearchPath("Code/Private"),
            ]
            
        )
    ]
)
