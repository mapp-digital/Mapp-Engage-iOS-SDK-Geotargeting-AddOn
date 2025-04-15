// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Mapp-Engage-iOS-SDK-Geotargeting-AddOn",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Mapp-Engage-iOS-SDK-Geotargeting-AddOn",
            targets: ["Mapp-Engage-iOS-SDK-Geotargeting-AddOn"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Mapp-Engage-iOS-SDK-Geotargeting-AddOn",
            dependencies: ["AppoxeeGeoWrapper"]),
        .target(name: "AppoxeeGeoWrapper",
                dependencies: ["AppoxeeGeoSDK"],
                path: "AppoxeeGeoWrapper/AppoxeeGeoWrapper"),
        .binaryTarget(name: "AppoxeeGeoSDK",
                      path: "./SDK/AppoxeeLocationServices.xcframework"
                     )

    ]
)
