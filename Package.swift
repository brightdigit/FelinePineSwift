// swift-tools-version: 5.8
// swiftlint:disable explicit_acl explicit_top_level_acl

import PackageDescription

let package = Package(
  name: "FelinePineLogging",
  platforms: [.iOS(.v14), .watchOS(.v7), .macOS(.v11)],
  dependencies: [
    .package(path: "../FelinePine"),
    .package(url: "https://github.com/apple/swift-log.git", from: "1.0.0")
  ],
  products: [
    .library(
      name: "FelinePineLogging",
      targets: ["FelinePineLogging"]
    )
  ],
  targets: [
    .target(
      name: "FelinePineLogging",
      swiftSettings: [
        SwiftSetting.enableUpcomingFeature("BareSlashRegexLiterals"),
        SwiftSetting.enableUpcomingFeature("ConciseMagicFile"),
        SwiftSetting.enableUpcomingFeature("ExistentialAny"),
        SwiftSetting.enableUpcomingFeature("ForwardTrailingClosures"),
        SwiftSetting.enableUpcomingFeature("ImplicitOpenExistentials"),
        SwiftSetting.enableUpcomingFeature("StrictConcurrency"),
        SwiftSetting.enableUpcomingFeature("DisableOutwardActorInference"),
        SwiftSetting.enableExperimentalFeature("StrictConcurrency")
      ],
      dependencies: [
          "FelinePine",
          .product(name: "Logging", package: "swift-log")
      ]
    ),
    .testTarget(
      name: "FelinePineLoggingTests",
      dependencies: ["FelinePineLogging"]
    )
  ]
)
// swiftlint:enable explicit_acl explicit_top_level_acl
