// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "APSSPMediationAppLovinMax",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "APSSPMediationAppLovinMax", targets: ["APSSPMediationAppLovinMax"]),
    ],
    dependencies: [
        .package(url: "https://github.com/IGAWorksDev/ap-APSSPSDK-SPM.git", from: "3.4.4"),
        .package(url: "https://github.com/AppLovin/AppLovin-MAX-Swift-Package.git", exact: "13.6.4"),
    ],
    targets: [
        .target(name: "APSSPMediationAppLovinMax",
                dependencies: [
                    .product(name: "APSSPSDK", package: "ap-APSSPSDK-SPM"),
                    .product(name: "AppLovinSDK", package: "AppLovin-MAX-Swift-Package"),
                ],
                path: "Sources/MediationAppLovinMax"),
    ]
)
