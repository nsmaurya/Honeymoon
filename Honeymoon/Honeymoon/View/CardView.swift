//
//  CardView.swift
//  Honeymoon
//
//  Created by Sunil Maurya on 15/01/24.
//

import SwiftUI

struct CardView: View, Identifiable {
    
    let id = UUID()
    let honeymoon: Destination
    
    var body: some View {
        Image(honeymoon.image)
            .resizable()
            .cornerRadius(24)
            .scaledToFit()
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity)
            .overlay (
                VStack(alignment: .center, spacing: 12){
                    
                    Text(honeymoon.place.uppercased())
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .shadow(radius: 1)
                        .padding(.horizontal, 18)
                        .padding(.vertical, 4)
                        .overlay(
                            Rectangle()
                                .fill(.white)
                                .frame(height: 1),
                            alignment: .bottom
                        )
                    
                    Text(honeymoon.country.uppercased())
                        .foregroundStyle(Color.black)
                        .font(.footnote)
                        .fontWeight(.bold)
                        .frame(minWidth: 85)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(
                            Capsule()
                                .fill(Color.white)
                        )
                    
                }
                    .frame(minWidth: 280)
                    .padding(.bottom, 80),
                alignment: .bottom
            )
    }
}

#Preview {
    CardView(honeymoon: honeymoonData[1])
}
