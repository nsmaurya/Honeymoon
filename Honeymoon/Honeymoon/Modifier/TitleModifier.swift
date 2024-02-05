//
//  TitleModifier.swift
//  Honeymoon
//
//  Created by Sunil Maurya on 24/01/24.
//

import SwiftUI

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.pink)
    }
}


