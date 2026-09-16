// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "Mapp-Engage-iOS-SDK-Geotargeting-AddOn",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "Mapp-Engage-iOS-SDK-Geotargeting-AddOn",
            targets: ["MappSDKGeotargeting"]
        ),
        .library(
            name: "MappSDKGeotargeting",
            targets: ["MappSDKGeotargeting"]
        )
    ],
    targets: [
        .target(
            name: "MappSDKGeotargeting",
            dependencies: ["AppoxeeGeoWrapper"],
            path: "Sources/Mapp-Engage-iOS-SDK-Geotargeting-AddOn"
        ),
        .target(
            name: "AppoxeeGeoWrapper",
            dependencies: ["AppoxeeGeoSDK"],
            path: "AppoxeeGeoWrapper/AppoxeeGeoWrapper",
            linkerSettings: [
                .linkedFramework("CoreLocation"),
                .linkedFramework("UIKit"),
                .linkedLibrary("sqlite3")
            ]
        ),
        .binaryTarget(
            name: "AppoxeeGeoSDK",
            path: "./SDK/AppoxeeLocationServices.xcframework"
        )
    ]
)
