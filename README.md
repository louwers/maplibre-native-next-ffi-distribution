# MapLibre Native FFI on maplibre-native-next

The Swift package of [MapLibre Native FFI](https://github.com/maplibre/maplibre-native-ffi)'s
C API on [maplibre-native-next](https://github.com/louwers/maplibre-native-next),
a port of MapLibre Native's core to Rust. It mirrors
[maplibre-native-ffi-distribution](https://github.com/maplibre/maplibre-native-ffi-distribution)'s
package, with the same products: `MaplibreNativeC`, the C API, and
`MaplibreNativeFFI`, the Swift binding over it.

```swift
.package(url: "https://github.com/louwers/maplibre-native-next-ffi-distribution", exact: "0.0.6")
```

On a Mac, `MaplibreNativeC` is an XCFramework for macOS, iOS, Mac Catalyst,
tvOS and visionOS, from a release of
[louwers/maplibre-native-ffi](https://github.com/louwers/maplibre-native-ffi/releases)
(branch `implementation-switch`). maplibre-native-next implements part of the C
API so far: the runtime and its events, logging, delivery queues, maps with
their style and camera, and offscreen render sessions with texture readback,
which render through wgpu on Metal. The rest, such as Metal texture and surface
sessions, returns `MLN_STATUS_UNSUPPORTED`.

Each release replaces this repository's contents, so report issues to
[louwers/maplibre-native-ffi](https://github.com/louwers/maplibre-native-ffi).
