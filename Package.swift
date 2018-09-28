// swift-tools-version:4.2

import PackageDescription

let package = Package(
  name: "Distance",
  products: [
    .library(
      name: "Distance",
      targets: ["Distance"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/Quick/Nimble.git", from: "7.0.2"),
    .package(url: "https://github.com/Quick/Quick.git", from: "1.2.0"),
  ],
  targets: [
    .target(
      name: "Distance",
      dependencies: []),
    .testTarget(
      name: "DistanceTests",
      dependencies: ["Distance", "Quick", "Nimble"]
    ),
  ]
)
