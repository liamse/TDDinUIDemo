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

    @Test("a TextView on iPhone - light/dark Mode - Portrait/Landscape")
    func textView_iPhone() async throws {
        
            let controller = UIHostingController(rootView: TextView(text: .constant(AttributedString(""))))
            // Light Mode
            controller.overrideUserInterfaceStyle = .light
            
            assertSnapshot(of: controller,
                           as: .image(on: .iPhone13Pro(.portrait)),
                           named: "portrait_lightMode",
                           record: true
            
            )
        
            // Portrait - Dark Mode
            controller.overrideUserInterfaceStyle = .dark
            assertSnapshot(of: controller,
                           as: .image(on: .iPhone13Pro(.portrait)),
                           named: "portrait_darkMode",
                           record: true
            
            )
            
            // Landscape - LightMode
            controller.overrideUserInterfaceStyle = .light

            assertSnapshot(of: controller,
                           as: .image(on: .iPhone13Pro(.landscape)),
                           named: "landscape_lightMode",
                           record: true
            
            )
            
            // Landscape - DarkMode
            controller.overrideUserInterfaceStyle = .dark

            assertSnapshot(of: controller,
                           as: .image(on: .iPhone13Pro(.landscape)),
                           named: "landscape_darkMode",
                           record: true
            
            )
        }

}

