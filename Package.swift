// swift-tools-version: 6.2

// Each maplibre-native-next release of
// https://github.com/louwers/maplibre-native-ffi generates this package and
// replaces this repository's contents with it.

import PackageDescription

// SwiftPM evaluates the manifest on the build host, so a Mac takes the
// XCFramework for every Apple platform. Linux builds against an installed C
// library that pkg-config finds.
#if os(macOS)
  let native: Target = .binaryTarget(
    name: "MaplibreNativeC",
    url: "https://github.com/louwers/maplibre-native-ffi/releases/download/maplibre-native-next-v0.0.6-d7c504e/MaplibreNativeC-next.xcframework.zip",
    checksum: "e78e1d2b6022ea9100e2247ab18721a54170b4ccf07d6f8f90762abb29de80f8"
  )
#else
  let native: Target = .systemLibrary(
    name: "MaplibreNativeC",
    path: "Sources/MaplibreNativeC",
    pkgConfig: "maplibre-native-c"
  )
#endif

let targets: [Target] = [
  native,
  .target(
    name: "MaplibreNativeFFI",
    dependencies: ["MaplibreNativeC"],
    path: "Sources/MaplibreNativeFFI",
    // An async operation runs on its caller's executor until it first
    // suspends, which is after it submits to native, so operations that one
    // actor starts in order reach native in that order.
    swiftSettings: [.enableUpcomingFeature("NonisolatedNonsendingByDefault")]
  ),
]

let package = Package(
  name: "maplibre-native-next-ffi",
  platforms: [
    .macOS("14.3"),
    .iOS("15.0"),
    .macCatalyst("15.0"),
    .tvOS("15.0"),
    .visionOS("1.0"),
  ],
  products: [
    .library(name: "MaplibreNativeFFI", targets: ["MaplibreNativeFFI"]),
    .library(name: "MaplibreNativeC", targets: ["MaplibreNativeC"]),
  ],
  targets: targets
)
