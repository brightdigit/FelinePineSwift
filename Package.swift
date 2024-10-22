// swift-tools-version: 5.8
// swiftlint:disable explicit_acl explicit_top_level_acl

import PackageDescription

let package = Package(
  name: "FelinePineLogging",
  platforms: [.iOS(.v14), .watchOS(.v7), .macOS(.v11)],
  products: [
    .library(
      name: "FelinePineLogging",
      targets: ["FelinePineLogging"]
    )
  ],
  dependencies: [
    .package(url: "https://github.com/brightdigit/FelinePine.git", branch: "v1.0.0-beta.5"),
    .package(url: "https://github.com/apple/swift-log.git", from: "1.0.0")
  ],
  targets: [
    .target(
      name: "FelinePineLogging",
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
      name: "FelinePineLoggingTests",
      dependencies: ["FelinePineLogging"]
    )
  ]
)
// swiftlint:enable explicit_acl explicit_top_level_acl
