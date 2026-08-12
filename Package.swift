// swift-tools-version:5.9.0

import PackageDescription
import Foundation

let package = Package(
    name: "content-scope-scripts",
    products: [
        .library(
            name: "ContentScopeScripts",
            targets: ["ContentScopeScripts_PrecompiledProduct"]
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
            url: "https://github.com/swift-precompiled/content-scope-scripts/releases/download/16.6.0/ContentScopeScripts-0df639416d72d53cf222e7d29311bd0ea8db4d371fcb9ec9e05eb8acc42a381d.xcframework.zip",
            checksum: "0df639416d72d53cf222e7d29311bd0ea8db4d371fcb9ec9e05eb8acc42a381d"
        ),
        .target(
            name: "ContentScopeScripts_PrecompiledProduct",
            dependencies: ["ContentScopeScripts_Aggregation"]
        )
    ]
)