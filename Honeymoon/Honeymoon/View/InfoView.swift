//
//  InfoView.swift
//  Honeymoon
//
//  Created by Sunil Maurya on 24/01/24.
//

import SwiftUI

struct InfoView: View {
    //MARK: - Properties
    @Environment(\.presentationMode) var presentationMode

    //MARK: - Body
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .center, spacing: 20, content: {
                HeaderComponent()
                Spacer(minLength: 10)
                
                Text("App Info")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                
                InfoSubView()
                
                Text("Credits")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                
                CreditInfoView()
                
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
    InfoView()
}

struct InfoSubView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10, content: {
            RowInfoView(item1: "Application", item2: "Honeymoon")
            RowInfoView(item1: "Compatibility", item2: "iPhone, iPad")
            RowInfoView(item1: "Developer", item2: "Sunil Maurya")
            RowInfoView(item1: "App version", item2: "1.0.0")
        })
    }
}

struct RowInfoView: View {
    //MARK: - Properties
    var item1: String
    var item2: String
    var body: some View {
        VStack {
            HStack {
                Text(item1)
                    .foregroundStyle(.gray)
                Spacer()
                Text(item2)
            }
            Divider()
        }
    }
}

struct CreditInfoView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10, content: {
            HStack {
                Text("Photos")
                    .foregroundStyle(.gray)
                Spacer()
                Text("Unsplash")
            }
            
            Divider()
            
            Text("Photographer").foregroundStyle(.gray)
            Text("Neha, Anil, Ajay, Aarav, Ayaan, Rekha, Jay, Prakash, Abhay and Vijay")
                .multilineTextAlignment(.leading)
                .font(.footnote)

        })
        
    }
}
