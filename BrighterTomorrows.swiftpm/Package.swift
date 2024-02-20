// swift-tools-version: 5.8

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "BrighterTomorrows",
    platforms: [
        .iOS("16.0")
    ],
    products: [
        .iOSApplication(
            name: "BrighterTomorrows",
            targets: ["AppModule"],
            bundleIdentifier: "com.rmit.BrighterTomorrows",
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .placeholder(icon: .running),
            accentColor: .presetColor(.brown),
            supportedDeviceFamilies: [
                .pad,
                .phone
            ],
            supportedInterfaceOrientations: [
                .portrait,
                .landscapeRight,
                .landscapeLeft,
                .portraitUpsideDown(.when(deviceFamilies: [.pad]))
            ]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/SDWebImage/SDWebImageSwiftUI", "2.2.6"..<"3.0.0")
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            dependencies: [
                .product(name: "SDWebImageSwiftUI", package: "sdwebimageswiftui")
            ],
            path: "."
        )
    ]
)