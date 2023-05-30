//
//  ContentView.swift
//  Part 6
//
//  Created by Delon Devin Allen on 5/11/23.
//

import SwiftUI

struct MainMenuController: View {
    
    @State private var Discussion = "Categories"
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background.ignoresSafeArea()
                VStack() {
                    Spacer()
                    Text("Discussions")
                        .multilineTextAlignment(.center)
                        .bold()
                        .font(.title)
                        .frame(width: UIScreen.screenWidth)
                    
                    Text("Categories")
                        .fontWeight(.light)
                    Spacer()
                    Image("team")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.screenWidth * 0.8)
                    Spacer(minLength: 30)
                    Grid() {
                        GridRow  {
                            NavigationLink {
                                TeamPlayersController(type: .petPeeves)
                                    .navigationBarTitle("")
                                    .navigationBarHidden(true)
                            } label: {
                                MainMenuButton(image: "flame", textLabel: "Pet Peeves")
                            }
                            .buttonStyle(.plain)
                            .navigationBarHidden(true)
                            NavigationLink {
                                TeamPlayersController(type: .ideas)
                                    .navigationBarTitle("")
                                    .navigationBarHidden(true)
                            } label: {
                                MainMenuButton(image: "bulb", textLabel: "Ideas")
                            }.buttonStyle(.plain)
                            
                        }
                        
                        GridRow {
                            NavigationLink {
                                TeamPlayersController(type: .hobbies)
                                    .navigationBarTitle("")
                                    .navigationBarHidden(true)
                            } label: {
                                MainMenuButton(image: "heart", textLabel: "Hobbies")
                            }.buttonStyle(.plain)
                            
                            NavigationLink {
                                TeamPlayersController(type: .joke)
                                    .navigationBarTitle("")
                                    .navigationBarHidden(true)
                            } label: {
                                MainMenuButton(image: "smile", textLabel: "Jokes")
                            }.buttonStyle(.plain)
                            
                            
                        }
//                        Text("Select A Category To Begin")
//                            .fontWeight(.thin)
                    }
                    Spacer()
                }
            }
        }
    }
}




struct MainMenuController_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuController()
    }
}
