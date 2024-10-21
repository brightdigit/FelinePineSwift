// swift-tools-version: 6.0
// swiftlint:disable explicit_acl explicit_top_level_acl

import PackageDescription

let swiftSettings: [SwiftSetting] = [
  SwiftSetting.enableExperimentalFeature("AccessLevelOnImport"),
  SwiftSetting.enableExperimentalFeature("BitwiseCopyable"),
  SwiftSetting.enableExperimentalFeature("GlobalActorIsolatedTypesUsability"),
  SwiftSetting.enableExperimentalFeature("IsolatedAny"),
  SwiftSetting.enableExperimentalFeature("MoveOnlyPartialConsumption"),
  SwiftSetting.enableExperimentalFeature("NestedProtocols"),
  SwiftSetting.enableExperimentalFeature("NoncopyableGenerics"),
  SwiftSetting.enableExperimentalFeature("RegionBasedIsolation"),
  SwiftSetting.enableExperimentalFeature("TransferringArgsAndResults"),
  SwiftSetting.enableExperimentalFeature("VariadicGenerics"),

  SwiftSetting.enableUpcomingFeature("FullTypedThrows"),
  SwiftSetting.enableUpcomingFeature("InternalImportsByDefault")

//  SwiftSetting.unsafeFlags([
//    "-Xfrontend",
//    "-warn-long-function-bodies=100"
//  ]),
//  SwiftSetting.unsafeFlags([
//    "-Xfrontend",
//    "-warn-long-expression-type-checking=100"
//  ])
]

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
  .package(path: "../FelinePine"),
    .package(url: "https://github.com/apple/swift-log.git", from: "1.0.0")
  ],
  targets: [
    .target(
      name: "FelinePineLogging",
      dependencies: [
          "FelinePine",
          .product(name: "Logging", package: "swift-log")
      ],
      swiftSettings: swiftSettings
    ),
    .testTarget(
      name: "FelinePineLoggingTests",
      dependencies: ["FelinePineLogging"]
    )
  ]
)
// swiftlint:enable explicit_acl explicit_top_level_acl