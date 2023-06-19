//
//  ContentView.swift
//  Part 6
//
//  Created by Delon Devin Allen on 5/11/23.
//

import SwiftUI

struct MainMenuController: View {
    
    @State private var isActive: Bool = false
    @Binding var path: NavigationPath
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            VStack() {
                Spacer()
                Text("Discussions")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
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
                    GridRow {
                        NavigationLink(destination: {
                            TeamPlayersController(path: $path, type: .petPeeves)
                        }, label: {
                            MainMenuButton(image: "flame", textLabel: "Pet Peeves")
                        })
                        .buttonStyle(.plain)
                        .navigationBarHidden(true)
                        NavigationLink(destination: {
                            TeamPlayersController(path: $path, type: .ideas)
                        }, label: {
                            MainMenuButton(image: "heart", textLabel: "Ideas")
                        })
                        .buttonStyle(.plain)
                        .navigationBarHidden(true)
                    }
                    
                    GridRow {
                        NavigationLink(destination: {
                            TeamPlayersController(path: $path, type: .hobbies)
                        }, label: {
                            MainMenuButton(image: "heart", textLabel: "Hobbies")
                        })
                        .buttonStyle(.plain)
                        .navigationBarHidden(true)
                        NavigationLink(destination: {
                            TeamPlayersController(path: $path, type: .joke)
                        }, label: {
                            MainMenuButton(image: "smile", textLabel: "Jokes")
                        })
                        .buttonStyle(.plain)
                        .navigationBarHidden(true)
                    }
                }
                Spacer()
            }
        }
        .onAppear {
            print("main \(path)")
        }
    }
}


struct MainMenuController_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuController(path: .constant(NavigationPath()))
    }
}
