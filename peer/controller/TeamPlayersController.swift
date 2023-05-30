//
//  TeamPlayersController.swift
//  peer
//
//  Created by Bryzgalov, Egor (A.) on 5/18/23.
//

import SwiftUI

struct TeamPlayersController: View {
    
    @State private var t = ""
    @State private var totalPlayers = 3
    @State private var name: [String] = ["Jack"]
    
    var type: GameType
    
   
    
    
    var body: some View {
        NavigationView {
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
                    HStack {
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
                        TextField("\(index) Player name", text: $t)
                            .tag(index)
                            .padding(.horizontal)
                            .padding(.vertical, 3)
                            .background()
                            .cornerRadius(5)
                            .frame(width: UIScreen.screenWidth * 0.7)
                    }.padding(.horizontal)
                    
                    Spacer()
                    NavigationLink {
                        GameplayController()
                            .navigationBarTitle("")
                            .navigationBarHidden(true)
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
        }.navigationBarHidden(true)
    }
}

struct TeamPlayersController_Previews: PreviewProvider {
    static var previews: some View {
        TeamPlayersController(type: .hobbies)
    }
}