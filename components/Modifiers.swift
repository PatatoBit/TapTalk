//
//  Modifiers.swift
//  TapTalk
//
//  Created by Pat on 30/10/2567 BE.
//

import SwiftUI

struct FullFrameCentered: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .center
            )
    }
}

extension View {
    func fullFrameCentered() -> some View {
        self.modifier(FullFrameCentered())
    }
}
