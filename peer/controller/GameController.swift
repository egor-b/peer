//
//  GameController.swift
//  peer
//
//  Created by Bryzgalov, Egor (A.) on 5/16/23.
//

import SwiftUI

struct GameController: View {
    
    @ObservedObject var gameService = GameService()
//    @State var progressValue: Float = 0.0
    
    @State var cards: [Card] = [
        Card(id: 0, text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
        Card(id: 1, text: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. "),
        Card(id: 2, text: "Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32."),
        Card(id: 3, text: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.")
        ]
    
    /// Return the CardViews width for the given offset in the array
    /// - Parameters:
    ///   - geometry: The geometry proxy of the parent
    ///   - id: The ID of the current user
    private func getCardWidth(_ geometry: GeometryProxy, id: Int) -> CGFloat {
        let offset: CGFloat = CGFloat(cards.count - 1 - id) * 10
        return geometry.size.width - offset
    }
    
    /// Return the CardViews frame offset for the given offset in the array
    /// - Parameters:
    ///   - geometry: The geometry proxy of the parent
    ///   - id: The ID of the current user
    private func getCardOffset(_ geometry: GeometryProxy, id: Int) -> CGFloat {
        return  CGFloat(cards.count - 1 - id) * 10
    }
    
    private var maxID: Int {
        return self.cards.map { $0.id }.max() ?? 0
    }
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            VStack {
                
                GeometryReader { geometry in
                    
                    VStack() {
                        HStack {
                            Spacer()
                            ProgressBar(progress: $gameService.time)
                                .frame(width: 80.0, height: 80)
                                .padding()
                            
                            Spacer()
                        }
                        Spacer()
                        ZStack {
                            ForEach(self.cards, id: \.self) { card in
                                Group {
                                    // Range Operator
                                    if (self.maxID - 3)...self.maxID ~= card.id {
                                        CardView(card: card, onRemove: { removeCard in
                                            // Remove that user from our array
                                            self.cards.removeAll { $0.id == removeCard.id }
                                        })
                                        .animation(.spring())
                                        .frame(width: self.getCardWidth(geometry, id: card.id), height: UIScreen.screenHeight * 0.5)
                                        .offset(x: 0, y: self.getCardOffset(geometry, id: card.id))
                                    }
                                }
                            }
                        }
//                        Spacer()
                        Button {
                        } label: {
                            Text("Finish")
                                .foregroundColor(.background)
                                .bold()
                                .padding()
                        }.frame(minWidth: 0, maxWidth: UIScreen.screenWidth * 0.75)
                            .background(.white)
                            .cornerRadius(25)
                            .padding()
                        Spacer()
                    }
                }.onAppear { gameService.startTimer() }
                
            }.padding()
        }
    }
}

struct ProgressBar: View {
    @Binding var progress: Float
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 5.0)
                .opacity(0.2)
                .foregroundColor(Color.progress)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress/30, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 5.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color.progress)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear)

            Text(String(format: "%.0f %", min(self.progress, 30.0)*1.0))
                .font(.title)
                .foregroundColor(.white)
                .bold()
        }
    }
}

struct GameController_Previews: PreviewProvider {
    static var previews: some View {
        GameController()
    }
}
