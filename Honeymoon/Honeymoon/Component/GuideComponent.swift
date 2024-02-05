//
//  GuideComponent.swift
//  Honeymoon
//
//  Created by Sunil Maurya on 24/01/24.
//

import SwiftUI

struct GuideComponent: View {
    //MARK: - Properties
    var title: String
    var subtitle: String
    var description: String
    var icon: String
    
    //MARK: - Body
    var body: some View {
        HStack(alignment: .center, spacing: 20, content: {
           Image(systemName: icon)
                .font(.largeTitle)
                .foregroundStyle(.pink)
            
            VStack(alignment: .leading, spacing: 4, content: {
                HStack {
                    Text(title.uppercased())
                        .font(.title)
                        .fontWeight(.heavy)
                    Spacer()
                    Text(subtitle.uppercased())
                        .font(.footnote)
                        .fontWeight(.heavy)
                        .foregroundStyle(.pink)
                }
                Divider()
                    .padding(.bottom, 4)
                
                Text(description)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            })
        })
    }
}

#Preview {
    GuideComponent(title: "A", subtitle: "ABC", description: "Hello Hello Hello Hello Hello Hello Hello fafdadsfads sdfsdafa sadfasdf fadfa ", icon: "heart.circle")
}
