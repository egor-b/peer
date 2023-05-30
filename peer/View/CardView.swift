//
//  CardView.swift
//  peer
//
//  Created by Bryzgalov, Egor (A.) on 5/16/23.
//

import SwiftUI

struct CardView: View {
    @State private var translation: CGSize = .zero
    @State private var swipeStatus: LikeDislike = .none

    private var card: Card
    private var onRemove: (_ card: Card) -> Void
    
    private var thresholdPercentage: CGFloat = 0.5 // when the user has draged 50% the width of the screen in either direction
    
    private enum LikeDislike: Int {
        case done, skip, none
    }
    
    init(card: Card, onRemove: @escaping (_ card: Card) -> Void) {
        self.card = card
        self.onRemove = onRemove
    }
    
    /// What percentage of our own width have we swipped
    /// - Parameters:
    ///   - geometry: The geometry
    ///   - gesture: The current gesture translation value
    private func getGesturePercentage(_ geometry: GeometryProxy, from gesture: DragGesture.Value) -> CGFloat {
        gesture.translation.width / geometry.size.width
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
//                 ZStack(alignment: self.swipeStatus == .done ? .topLeading : .topTrailing) {
//                    if self.swipeStatus == .done {
//                        Text("DONE")
//                            .font(.headline)
//                            .padding()
//                            .cornerRadius(10)
//                            .foregroundColor(Color.green)
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 10)
//                                    .stroke(Color.green, lineWidth: 3.0)
//                        ).padding(24)
//                            .rotationEffect(Angle.degrees(-45))
//                    } else if self.swipeStatus == .skip {
//                        Text("SKIPED")
//                            .font(.headline)
//                            .padding()
//                            .cornerRadius(10)
//                            .foregroundColor(Color.red)
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 10)
//                                    .stroke(Color.red, lineWidth: 3.0)
//                        ).padding(.top, 45)
//                            .rotationEffect(Angle.degrees(45))
//                    }
//                }
                
                HStack {
                    VStack(alignment: .leading, spacing: 6) {
                        Text(self.card.text)
                            .font(.subheadline)
                            .bold()
                            .padding(.vertical, 5)
                    }
                    Spacer()
                }
                .padding(.horizontal)
            }
            .padding(.bottom)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
            .animation(.interactiveSpring())
            .offset(x: self.translation.width, y: 0)
            .rotationEffect(.degrees(Double(self.translation.width / geometry.size.width) * 25), anchor: .bottom)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        self.translation = value.translation
                        
                        if (self.getGesturePercentage(geometry, from: value)) >= self.thresholdPercentage {
                            self.swipeStatus = .done
                        } else if self.getGesturePercentage(geometry, from: value) <= -self.thresholdPercentage {
                            self.swipeStatus = .skip
                        } else {
                            self.swipeStatus = .none
                        }
                        
                }.onEnded { value in
                    // determine snap distance > 0.5 aka half the width of the screen
                        if abs(self.getGesturePercentage(geometry, from: value)) > self.thresholdPercentage {
                            self.onRemove(self.card)
                        } else {
                            self.translation = .zero
                        }
                    }
            )
        }
    }
}

// 7
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card(id: 1, text: "Etiam eu elit ipsum. Aenean iaculis odio eu tellus lobortis lobortis. In hac habitasse platea dictumst. Fusce lacus nisl, iaculis a viverra ut, aliquet non arcu. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed porta aliquam massa sed commodo. Nunc ultrices commodo rutrum. Nam vehicula condimentum nibh, ac fermentum sapien ultrices quis. Nullam sit amet odio dui. Aliquam est dui, dapibus ut nisi pellentesque, malesuada egestas justo."),
                 onRemove: { _ in
                    // do nothing
            })
            .frame(height: 400)
            .padding()
    }
}
