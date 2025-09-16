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

    @Test("a TextView on iPhone - light Mode - Portrait")
    func textView_iPhone() async throws {
        
        let text: AttributedString = {
            var attr = AttributedString("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
            if let range = attr.range(of: "ipsum") {
                attr[range].backgroundColor = .yellow
            }

            return attr
        }()
        
        let controller = UIHostingController(rootView: TextView(text: .constant(text)))
        // Light Mode
        controller.overrideUserInterfaceStyle = .light
        
        assertSnapshot(of: controller,
                       as: .image(on: .iPhone13Pro(.portrait)),
                       named: "portrait-lightMode",
                       record: true
        
        )
    }

}

