//
//  TDDinUIDemo.swift
//  TDDinUIDemo
//
//  Created by esimini on 8/13/25.
//

import SwiftUI
import Combine

public struct TextView: View {
    @Binding var text: AttributedString
        
    public var body: some View {
        HStack {
            Text(text)
                .frame(maxWidth: .infinity, maxHeight: 100)
                .padding(1)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                )
        }
        .padding()

    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        let text: AttributedString = {
            var attr = AttributedString("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
            if let range = attr.range(of: "ipsum") {
                attr[range].backgroundColor = .yellow
            }

            return attr
        }()
        TextView(text: .constant(text))
    }
}
public class BundleToken {}
