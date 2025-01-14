// swift-tools-version: 5.8
// swiftlint:disable explicit_acl explicit_top_level_acl

import PackageDescription

let package = Package(
  name: "FelinePineSwift",
  platforms: [.iOS(.v14), .watchOS(.v7), .macOS(.v11)],
  products: [
    .library(
      name: "FelinePineSwift",
      targets: ["FelinePineSwift"]
    )
  ],
  dependencies: [
    .package(url: "https://github.com/brightdigit/FelinePine.git", from: "1.0.0"),
    .package(url: "https://github.com/apple/swift-log.git", from: "1.0.0")
  ],
  targets: [
    .target(
      name: "FelinePineSwift",
      dependencies: [
        "FelinePine",
        .product(name: "Logging", package: "swift-log")
      ],
      swiftSettings: [
        SwiftSetting.enableUpcomingFeature("BareSlashRegexLiterals"),
        SwiftSetting.enableUpcomingFeature("ConciseMagicFile"),
        SwiftSetting.enableUpcomingFeature("ExistentialAny"),
        SwiftSetting.enableUpcomingFeature("ForwardTrailingClosures"),
        SwiftSetting.enableUpcomingFeature("ImplicitOpenExistentials"),
        SwiftSetting.enableUpcomingFeature("StrictConcurrency"),
        SwiftSetting.enableUpcomingFeature("DisableOutwardActorInference"),
        SwiftSetting.enableExperimentalFeature("StrictConcurrency"),
        SwiftSetting.enableExperimentalFeature("AccessLevelOnImport")
      ]
    ),
    .testTarget(
      name: "FelinePineSwiftTests",
      dependencies: ["FelinePineSwift"]
    )
  ]
)
// swiftlint:enable explicit_acl explicit_top_level_acl
