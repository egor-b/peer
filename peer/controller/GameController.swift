//
//  GameController.swift
//  peer
//
//  Created by Bryzgalov, Egor (A.) on 5/16/23.
//

import SwiftUI

struct GameController: View {
    
    @ObservedObject var gameService: GameService
    @State private var showingAlert = false
    @State private var name = ""
    @Binding var isActive: Bool
    var type: GameType
//    var gs: GameService
    @State var cards = [Card]()
    
    /// Return the CardViews width for the given offset in the array
    /// - Parameters:
    ///   - geometry: The geometry proxy of the parent
    ///   - id: The ID of the current user
    private func getCardWidth(_ geometry: GeometryProxy, id: Int) -> CGFloat {
        let offset: CGFloat = CGFloat(cards.count - 1) * 10
        return geometry.size.width
    }
    
    /// Return the CardViews frame offset for the given offset in the array
    /// - Parameters:
    ///   - geometry: The geometry proxy of the parent
    ///   - id: The ID of the current user
    private func getCardOffset(_ geometry: GeometryProxy, id: Int) -> CGFloat {
        return CGFloat(cards.count - 1 - id) * 20
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
//                        Spacer()
                        HStack {
                            Spacer()
                            ProgressBar(progress: $gameService.time)
                                .frame(width: 80.0, height: 80)
                                .padding()
                            
                            Spacer()
                        }
                        Text(name)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .padding(.top, 20)
                            .padding(.bottom, 50)
                        ZStack {
                            ForEach(self.cards, id: \.self) { card in
                                Group {
                                    // Range Operator
                                    if (self.maxID - 4)...self.maxID ~= card.id {
                                        CardView(card: card, onRemove: { removeCard in
                                            gameService.resetTimer()
                                            self.cards.removeAll { $0.id == removeCard.id }
                                            if cards.count == 0 {
                                                showingAlert = true
                                            }
                                            name = gameService.getRandomeName()
                                        })
                                        .frame(width: self.getCardWidth(geometry, id: card.id))
                                        .animation(.spring())
                                        .offset(x: 0, y: self.getCardOffset(geometry, id: card.id))
//                                        .background(.black)
                                    }
                                }.frame(height: UIScreen.screenHeight * 0.19)
                            }
                        }
                        Spacer()
                        Button {
                            gameService.removeTimer()
                            isActive = false
                        } label: {
                            Text("Finish")
                                .foregroundColor(.background)
                                .frame(minWidth: 0, maxWidth: UIScreen.screenWidth * 0.75)
//                                .bold()
                                .padding()
                        }
                            .background(.white)
                            .cornerRadius(25)
                            .padding()
//                        Spacer()
                    }
                }.onAppear {
                    gameService.startTimer()
                    cards = gameService.getQuestions(for: type)
                    name = gameService.getRandomeName()
                }
                
            }.padding()
        }
        .alert("Cards are over", isPresented: $showingAlert, actions: {
            Button("OK", role: .cancel) { showingAlert = false; isActive = false }
        }) {
            Text("Start new game")
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
        GameController(gameService: GameService(), isActive: .constant(false), type: .hobbies)
    }
}
