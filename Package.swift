// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "GoogleInteractiveMediaAds",
    platforms: [
        .iOS(.v14),
        .tvOS(.v14),
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
