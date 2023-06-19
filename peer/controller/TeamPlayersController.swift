//
//  TeamPlayersController.swift
//  peer
//
//  Created by Bryzgalov, Egor (A.) on 5/18/23.
//

import SwiftUI

struct TeamPlayersController: View {
    
//    @Environment(\.dismiss) var dismiss
//    @Environment(\.presentationMode) var presentationMode
    @ObservedObject private var gameService = GameService()
    @State private var totalPlayers = 3
    @Binding var path: NavigationPath
    let type: GameType
    
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
                HStack {
                    Spacer()
                    Menu {
                        ForEach(3...10, id: \.self) { index in
                            Button {
                                gameService.changeAmountElements(new: index)
                                //                                    withAnimation {
                                totalPlayers = index
                                //                                    }
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
                    TextField("\(index) Player name", text: Binding(
                        get: {
                            return gameService.team[index - 1]
                        },
                        set: { newValue in
                            return gameService.changeElemnt(at: index - 1, element: newValue)
                        }))
                    .tag(index)
                    .padding(.horizontal)
                    .padding(.vertical, 3)
                    .background()
                    .cornerRadius(5)
                    .frame(width: UIScreen.screenWidth * 0.7)
                }.padding(.horizontal)
                
                Spacer()
                
                HStack {
//                    Button{
//                        presentationMode.wrappedValue.dismiss()
//
//                    } label: {
//                        Text("Back")
//                            .foregroundColor(.background)
//                            .bold()
//                            .padding()
//                    }.frame(minWidth: 0, maxWidth: UIScreen.screenWidth * 0.75)
//                        .background(.white)
//                        .cornerRadius(25)
                    NavigationLink {
                        GameplayController(path: $path, type: type, gameSevice: gameService)
                    } label: {
                        Text("Continue")
                            .foregroundColor(.background)
                            .bold()
                            .padding()
                    }
//                    NavigationLink(value: type, label: {
//                        Text("Continue")
//                            .foregroundColor(.background)
//                            .bold()
//                            .padding()
//                    })
                    .frame(minWidth: 0, maxWidth: UIScreen.screenWidth * 0.75)
                        .background(.white)
                        .cornerRadius(25)
                    
                }.padding(.horizontal)
                Spacer()
            }
        }
        .onAppear {
            print("team \(path)")
            path.append(type)
        }
    }
}

struct TeamPlayersController_Previews: PreviewProvider {
    static var previews: some View {
        TeamPlayersController(path: .constant(NavigationPath()), type: .hobbies)
    }
}
