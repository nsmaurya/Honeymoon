//
//  FooterView.swift
//  Honeymoon
//
//  Created by Sunil Maurya on 23/01/24.
//

import SwiftUI

struct FooterView: View {
    //MARK: - Properties
    @Environment(\.presentationMode) var presentationMode
    @Binding var showBookingAlert: Bool
    let haptics = UINotificationFeedbackGenerator()
    
    var body: some View {
        HStack {
            Image(systemName: "xmark.circle")
                .font(.system(size: 42, weight: .light))
            Spacer()
            
            Button(action: {
                self.showBookingAlert.toggle()
                playSound(sound: "sound-click", type: "mp3")
                self.haptics.notificationOccurred(.success)
            }, label: {
                Text("BOOK DESTINATION")
                    .font(.system(.subheadline, design: .rounded))
                    .fontWeight(.bold)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .accentColor(.pink)
                    .background(
                        Capsule()
                            .stroke(.pink, lineWidth: 2)
                    )
            })
            
            Spacer()
            Image(systemName: "heart.circle")
                .font(.system(size: 42, weight: .light))
        }
        .padding()
    }
}

