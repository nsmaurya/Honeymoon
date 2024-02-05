//
//  HeaderView.swift
//  Honeymoon
//
//  Created by Sunil Maurya on 23/01/24.
//

import SwiftUI

struct HeaderView: View {
    
    //MARK: - Properties
    @Binding var showGuideView: Bool
    @Binding var showInfoView: Bool
    let haptics = UINotificationFeedbackGenerator()

    var body: some View {
        HStack {
            Button {
                showInfoView.toggle()
                playSound(sound: "sound-click", type: "mp3")
                self.haptics.notificationOccurred(.success)
            } label: {
                Image(systemName: "info.circle")
                    .font(.system(size: 24, weight: .regular))
            }
            .accentColor(.primary)
            
            Spacer()

            Image("logo-honeymoon-pink")
                .resizable()
                .scaledToFit()
                .frame(height: 28)
            
            Spacer()
            
            Button {
                showGuideView.toggle()
                playSound(sound: "sound-click", type: "mp3")
                self.haptics.notificationOccurred(.success)
            } label: {
                Image(systemName: "questionmark.circle")
                    .font(.system(size: 24, weight: .regular))
            }
            .accentColor(.primary)
        }
        .padding()
        .sheet(isPresented: $showGuideView, content: {
            GuideView()
        })
        .sheet(isPresented: $showInfoView, content: {
            InfoView()
        })
    }
}

#Preview {
    HeaderView(showGuideView: .constant(false), showInfoView: .constant(false))
}

