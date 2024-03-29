// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Logger",
    products: [
        .library(
            name: "Logger",
            type: .static,
            targets: ["Logger"]),
    ],
    targets: [
        .target(
            name: "Logger"),
    ]
)
