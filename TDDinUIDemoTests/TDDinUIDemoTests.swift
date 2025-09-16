//
//  TDDinUIDemoTests.swift
//  TDDinUIDemoTests
//
//  Created by esimini on 8/13/25.
//

import Testing
import SnapshotTesting
@testable import TDDinUIDemo
import SwiftUI

@MainActor
struct TDDinUIDemoTests {

    // Prepare an attributed string with highlighted text
    let text: AttributedString = {
        var attr = AttributedString("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
        if let range = attr.range(of: "ipsum") {
            // Highlight the word "ipsum" with a Highlight background color
            let bundle = Bundle(for: BundleToken.self)
            attr[range].backgroundColor = UIColor(named: "HighlightBackground", in: bundle, compatibleWith: nil)
        }
        return attr
    }()
    
    @Test("a TextView on iPhone - light/dark Mode - Portrait/Landscape", arguments: Device.iPhone13Pro.config)
    func textView_iPhone(_ config: (name: String, device: ViewImageConfig, theme: UIUserInterfaceStyle)) async throws {
        
        // Create hosting controller for the SwiftUI view
        let controller = UIHostingController(rootView: TextView(text: .constant(text)))
        
        // Apply the UI theme (light/dark)
        controller.overrideUserInterfaceStyle = config.theme

        // Run snapshot test with given device configuration
        assertSnapshot(
            of: controller,
            as: .image(on: config.device),
            named: config.name,
            record: true
        )
    }

}

enum Device {
    case iPhone13Pro
    case iPadPro11

    var config: [(name: String, device: ViewImageConfig, theme: UIUserInterfaceStyle)] {
        switch self {
        case .iPhone13Pro:
            return [
                ("portrait_light",  .iPhone13Pro(.portrait),  .light),
                ("portrait_dark",   .iPhone13Pro(.portrait),  .dark),
                ("landscape_light", .iPhone13Pro(.landscape), .light),
                ("landscape_dark",  .iPhone13Pro(.landscape), .dark)
            ]
        case .iPadPro11:
            return [
                ("portrait_light",  .iPadPro11(.portrait),  .light),
                ("portrait_dark",   .iPadPro11(.portrait),  .dark),
                ("landscape_light", .iPadPro11(.landscape), .light),
                ("landscape_dark",  .iPadPro11(.landscape), .dark)
            ]
        }
    }
}
