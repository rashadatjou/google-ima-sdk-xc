// swift-tools-version: 5.4

import PackageDescription

let package = Package(
    name: "GoogleInteractiveMediaAds",
    platforms: [
        .iOS(.v11),
        .tvOS(.v11),
    ],
    products: [
        .library(
            name: "GoogleInteractiveMediaAds",
            targets: ["GoogleInteractiveMediaAds"]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "GoogleInteractiveMediaAds",
            path: "./Resources/GoogleInteractiveMediaAds.zip"
        ),
    ]
)
