//
//  GuideView.swift
//  Honeymoon
//
//  Created by Sunil Maurya on 24/01/24.
//

import SwiftUI

struct GuideView: View {
    //MARK: - Properties
    @Environment(\.presentationMode) var presentationMode
    
    //MARK: - Body
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .center, spacing: 20, content: {
                HeaderComponent()
                
                Spacer(minLength: 10)
                
                Text("Get Started")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                
                Text("Discover and pick the perfect destination for your romantic Honeymoon!")
                    .lineLimit(nil)
                    .multilineTextAlignment(.center)
                
                Spacer(minLength: 10)
                
                VStack(alignment: .leading, spacing: 25, content: {
                    GuideComponent(title: "Like", subtitle: "Swipe Right", description: "Do you like this destination? Touch the screen and swipe right. It will be saved to the favourites", icon: "heart.circle")
                    
                    GuideComponent(title: "Dismiss", subtitle: "Swipe Left", description: "Would you rather skip this place? Touch the screen and swipe left. You will no longer see this.", icon: "xmark.circle")
                    
                    GuideComponent(title: "Book", subtitle: "Tap the button", description: "Our selection of honeymoon resorts is perfect for you to embark your life together." , icon: "checkmark.square")
                    
                })
                
                Spacer(minLength: 10)
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Continue".uppercased())
                        .modifier(ButtonModifier())
                })

            })
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.top, 15)
            .padding(.bottom, 25)
            .padding(.horizontal, 25)
        }
    }
}

#Preview {
    GuideView()
}
