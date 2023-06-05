//
//  ContentView.swift
//  Part 6
//
//  Created by Delon Devin Allen on 5/11/23.
//

import SwiftUI

struct MainMenuController: View {
    
    @State private var isActive: Bool = false
    
    var body: some View {
        NavigationView {
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
                        GridRow  {
                            
                            NavigationLink(
                                destination: TeamPlayersController(isActive: $isActive, type: .petPeeves).navigationBarTitle("").navigationBarHidden(true),
                                isActive: $isActive,
                                label: { MainMenuButton(image: "flame", textLabel: "Pet Peeves") })
                            .buttonStyle(.plain)
                            .navigationBarHidden(true)
                            
                            NavigationLink(
                                destination: TeamPlayersController(isActive: $isActive, type: .ideas).navigationBarTitle("").navigationBarHidden(true),
                                isActive: $isActive,
                                label: {  MainMenuButton(image: "bulb", textLabel: "Ideas") })
                            .buttonStyle(.plain)
                            .navigationBarHidden(true)
                        }
                        
                        GridRow {
                            NavigationLink(
                                destination: TeamPlayersController(isActive: $isActive, type: .hobbies).navigationBarTitle("").navigationBarHidden(true),
                                isActive: $isActive,
                                label: {  MainMenuButton(image: "heart", textLabel: "Hobbies") })
                            .buttonStyle(.plain)
                            .navigationBarHidden(true)
                            NavigationLink(
                                destination: TeamPlayersController(isActive: $isActive, type: .joke).navigationBarTitle("").navigationBarHidden(true),
                                isActive: $isActive,
                                label: {  MainMenuButton(image: "smile", textLabel: "Jokes") })
                            .buttonStyle(.plain)
                            .navigationBarHidden(true)
                            
                            
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
