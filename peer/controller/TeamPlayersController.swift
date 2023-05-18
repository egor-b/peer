//
//  TeamPlayersController.swift
//  peer
//
//  Created by Bryzgalov, Egor (A.) on 5/18/23.
//

import SwiftUI

struct TeamPlayersController: View {
    
    @State private var t = ""
    private var name: [String] = []
    @State private var totalPlayers = 3
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            VStack {
                Spacer()
                Text("Input Players Names")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                Spacer()
                Text("Name's will randomly pick for the game ")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
//                Spacer()
                HStack {
//                    withAnimation {
//                        Stepper("Enter your age", value: $totalPlayers, in: 3...15)
//                    }
                    
                    Spacer()
                    Menu {
                        ForEach(3...10, id: \.self) { index in
                            Button {
                                withAnimation {
                                    totalPlayers = index
                                }
                            } label: {
                                Text("\(index) players")
                                Image(systemName: "person.fill")
                            }
                        }
                        
                    } label: {
                        
//                        Image(systemName: "person.3.fill")
//                            .foregroundColor(.highRiseWhite)
                        Text("\(totalPlayers) players")
                            .foregroundColor(.highRiseWhite)
                            .bold()
                        Image(systemName: "arrowtriangle.down")
                            .foregroundColor(.highRiseWhite)
                         
                    }
                        .padding()
                        .padding(.trailing, 20)
                }
                Spacer()
                ForEach(1...totalPlayers, id: \.self) { index in
                    TextField("Player name", text: $t)
                        .tag(index)
                        .padding(.horizontal)
                        .padding(.vertical, 3)
                        .background()
                }.padding(.horizontal)
                    
                Spacer()
                Button {
                    
                } label: {
                    Text("Continue")
                        .foregroundColor(.background)
                        .bold()
                        .padding()
                }.frame(minWidth: 0, maxWidth: UIScreen.screenWidth * 0.75)
                    .background(.white)
                    .cornerRadius(25)
                    .padding()
                Spacer()
            }
        }
    }
}

struct TeamPlayersController_Previews: PreviewProvider {
    static var previews: some View {
        TeamPlayersController()
    }
}
