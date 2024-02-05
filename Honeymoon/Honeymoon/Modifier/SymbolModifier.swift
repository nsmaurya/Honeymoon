//
//  SymbolModifier.swift
//  Honeymoon
//
//  Created by Sunil Maurya on 25/01/24.
//

import SwiftUI

struct SymbolModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.white)
            .font(.system(size: 128))
            .shadow(color: Color(UIColor.black.withAlphaComponent(0.2)), radius: 12, x: 0, y: 0)
    }
}

