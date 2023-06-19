//
//  GameplayController.swift
//  peer
//
//  Created by Bryzgalov, Egor (A.) on 5/16/23.
//

import SwiftUI

struct GameplayController: View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var path: NavigationPath
    var type: GameType
    var gameSevice: GameService
    
    var body: some View {
//        NavigationStack(path: $path) {
            ZStack {
                Color.background.ignoresSafeArea()
                VStack {
                    Spacer()
                    Text("Gameplay Instructions")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                    Spacer()
                    Image("bulb")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.screenWidth * 0.25, height:.infinity)
                        .clipped()
                    Spacer()
                    Text("You or a team member will be randomly selected to stand up and verbally answer the given prompt.")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding()
                    //            Spacer()
                    Text("All players will score the response of the selected player based on their communication skill and creativity.")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding()
                    //            Spacer()
                    Text("Stand up, speak up and have fun!")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding()
                    Spacer()
                    HStack {
//                        Spacer()
//                        Button {
////                            path.removeLast()
//                            dismiss()
//                        } label: {
//                            Image(systemName: "arrow.left.circle")
//                                .foregroundColor(Color.white)
//                                .font(.system(size: 30))
//                        }.padding()
//                        Spacer(minLength: UIScreen.screenWidth * 0.5)
                        
                        NavigationLink {
                            GameController(gameService: gameSevice, path: $path, type: type)
                                .navigationBarTitle("")
                                .navigationBarHidden(true)
                        } label: {
                            Text("Continue")
                                .foregroundColor(.background)
                                .bold()
                                .padding()
//                            Image(systemName: "arrow.right.circle")
//                                .foregroundColor(Color.white)
//                                .font(.system(size: 30))
                        }.frame(minWidth: 0, maxWidth: UIScreen.screenWidth * 0.75)
                            .background(.white)
                            .cornerRadius(25)
                        .padding()
//                        Spacer()
                    }
                }
            }
//        }.navigationBarHidden(true)
    }
}

struct GameplayController_Previews: PreviewProvider {
    static var previews: some View {
        GameplayController(path: .constant(NavigationPath()), type: .hobbies, gameSevice: GameService())
    }
}
