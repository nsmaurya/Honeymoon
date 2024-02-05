//
//  ContentView.swift
//  Honeymoon
//
//  Created by Sunil Maurya on 15/01/24.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: - Properties
    @State private var showAlert = false
    @State private var showGuideView = false
    @State private var showInfoView = false
    @GestureState private var dragState: DragState = .inactive
    private var dragAreaThreshold: CGFloat = 65.0
    @State private var lastCardIndex = 1
    @State private var cardRemovalTransition = AnyTransition.trailingBottom
    
    //MARK: - CardViewes
    @State var cardViews: [CardView] = {
        var views = [CardView]()
        for index in 0..<2 {
            views.append(CardView(honeymoon: honeymoonData[index]))
        }
        return views
    }()

    private func isTopCard(_ cardView: CardView) -> Bool {
        guard let index = cardViews.firstIndex(where: { $0.id == cardView.id
        }) else {
            return false
        }
        return index == 0
    }
    
    //MARK: - Move cards
    private func moveCards() {
        cardViews.removeFirst()
        self.lastCardIndex += 1
        let honeymoon = honeymoonData[lastCardIndex % honeymoonData.count]
        let newCardView = CardView(honeymoon: honeymoon)
        cardViews.append(newCardView)
    }
    
    //MARK: - Drag State
    enum DragState {
        case inactive
        case pressing
        case dragging(translation: CGSize)
        
        var translation: CGSize {
            switch self {
            case .inactive, .pressing:
                    return .zero
            case .dragging(let translation):
                return translation
            }
        }
        
        var isDragging: Bool {
            switch self {
            case .inactive, .pressing:
                return false
            case .dragging:
                return true
            }
        }

        var isPressing: Bool {
            switch self {
            case .pressing:
                return true
            case .dragging, .inactive:
                return false
            }
        }
    }
    
    //MARK: - Body
    var body: some View {
        VStack {
            //MARK: - Header
            HeaderView(showGuideView: $showGuideView, showInfoView: $showInfoView)
                .opacity(dragState.isDragging ? 0 : 1)
                .animation(.default)
            Spacer()
            
            //MARK: - Cards
            ZStack {
                ForEach(cardViews) { cardView in
                    cardView
                        .zIndex(isTopCard(cardView) ? 1 : 0)
                        .overlay(
                            ZStack {
                                // X symbol
                                Image(systemName: "x.circle")
                                    .modifier(SymbolModifier())
                                    .opacity(self.dragState.translation.width < -self.dragAreaThreshold && self.isTopCard(cardView) ? 1.0 : 0.0)
                                
                                // Heart symbol
                                Image(systemName: "heart.circle")
                                    .modifier(SymbolModifier())
                                    .opacity(self.dragState.translation.width > self.dragAreaThreshold && self.isTopCard(cardView) ? 1.0 : 0.0)
                            }
                        )
                        .offset(x: isTopCard(cardView) ? self.dragState.translation.width : 0, y: isTopCard(cardView) ? self.dragState.translation.height : 0)
                        .scaleEffect(self.dragState.isDragging && isTopCard(cardView) ? 0.85 : 1.0)
                        .rotationEffect(Angle(degrees: isTopCard(cardView) ? dragState.translation.width / 12 : 0))
                        .animation(.interpolatingSpring(stiffness: 120, damping: 120))
                        .gesture(LongPressGesture(minimumDuration: 0.01)
                            .sequenced(before: DragGesture())
                            .updating(self.$dragState, body: { value, state, transaction in
                                switch value {
                                case .first(true):
                                    state = .pressing
                                case .second(true, let drag):
                                    state = .dragging(translation: drag?.translation ?? .zero)
                                default: break
                                }
                            })
                                .onChanged({ value in
                                    guard case .second(true, let drag?) = value else {
                                        return
                                    }
                                    if drag.translation.width < -self.dragAreaThreshold {
                                        self.cardRemovalTransition = .leadingBottom
                                    }
                                    if drag.translation.width > self.dragAreaThreshold {
                                        self.cardRemovalTransition = .trailingBottom
                                    }
                                })
                                .onEnded({ value in
                                    guard case .second(true, let drag?) = value else {
                                        return
                                    }
                                    if drag.translation.width < -self.dragAreaThreshold || drag.translation.width > self.dragAreaThreshold {
                                        self.moveCards()
                                        playSound(sound: "sound-rise", type: "mp3")
                                    }
                                })
                        ).transition(self.cardRemovalTransition)
                }
            }
            .padding(.horizontal)
            
            Spacer()
            
            //MARK: - Footer
            FooterView(showBookingAlert: $showAlert)
                .opacity(dragState.isDragging ? 0 : 1)
                .animation(.default)
        }
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text("Success!"), message: Text("Wishing a lovely and most precious of the times together"), dismissButton: .default(Text("Happy Honeymoon!")))
        })
        
    }
}

#Preview {
    ContentView()
}
