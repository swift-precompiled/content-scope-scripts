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
            resources: [
                .process("dist/contentScope.js"),
                .process("dist/contentScopeIsolated.js"),
                .process("dist/duckAiDataClearing.js"),
                .process("dist/duckAiChatHistory.js"),
                .copy("dist/pages")
            ],
            packageAccess: false,
            swiftSettings: [.define("SCIPIO_PRECOMPILED_BINARY_WRAPPER")]
        ),
        .binaryTarget(
            name: "ContentScopeScripts",
            url: "https://github.com/swift-precompiled/content-scope-scripts/releases/download/16.6.0/ContentScopeScripts-11f5ccb411625f96014b6eaa2173b4bbd7c1655eafe7ac6d871ae040e036b131.xcframework.zip",
            checksum: "11f5ccb411625f96014b6eaa2173b4bbd7c1655eafe7ac6d871ae040e036b131"
        ),
        .target(
            name: "ContentScopeScripts_PrecompiledProduct",
            dependencies: ["ContentScopeScripts_Aggregation"],
            packageAccess: false
        )
    ]
)