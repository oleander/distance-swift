# Distance

[![Build Status](https://travis-ci.org/oleander/distance-swift.svg?branch=master)](https://travis-ci.org/oleander/distance-swift)

A Swift library for handling metric distances.

## Example

``` swift
Distance(km: 5.0) == Distance(meter: 5000) // => true
Distance(meter: 400) != Distance(km: 1) // => true
Distance(km: 5) > Distance(km: 2) // true
Distance(km: 4) < Distance(km: 9) // false

Distance(km: 5) + Distance(meter: 500) // => 5.5km
Distance(km: 2) - Distance(meter: 1000) // => 1km

Distance(km: 5) * 5 // 25km
Distance(km: 16) / 4 // 4km
```

## Install

``` swift
// swift-tools-version: 4.2
import PackageDescription

let package = Package(
  name: "YOUR_PROJECT_NAME",
  dependencies: [
    .package(
      url: "https://github.com/oleander/distance-swift.git", .branch("master")
    )
  ]
)
```
