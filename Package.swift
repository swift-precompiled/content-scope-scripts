// swift-tools-version:5.9.0

import PackageDescription
import Foundation

let package = Package(
    name: "content-scope-scripts",
    products: [
        .library(
            name: "ContentScopeScripts",
            targets: ["ContentScopeScripts", "ContentScopeScripts_PrecompiledProduct"]
        )
    ],
    targets: [
        .target(
            name: "ContentScopeScripts_Aggregation",
            dependencies: ["ContentScopeScripts"],
            swiftSettings: [.define("SCIPIO_PRECOMPILED_BINARY_WRAPPER")]
        ),
        .binaryTarget(
            name: "ContentScopeScripts",
            url: "https://github.com/swift-precompiled/content-scope-scripts/releases/download/16.6.0/ContentScopeScripts-c48c5bb364612aae362ca4db09729c6f247cfe8c03b279b9cc51c973143f18f1.xcframework.zip",
            checksum: "c48c5bb364612aae362ca4db09729c6f247cfe8c03b279b9cc51c973143f18f1"
        ),
        .target(
            name: "ContentScopeScripts_PrecompiledProduct",
            dependencies: ["ContentScopeScripts_Aggregation"]
        )
    ]
)