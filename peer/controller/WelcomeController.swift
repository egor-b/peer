//
//  ContentView.swift
//  peer
//
//  Created by Bryzgalov, Egor (A.) on 5/9/23.
//

import SwiftUI

struct WelcomeController: View {
    @State private var path: NavigationPath = .init()

    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                Color.background.ignoresSafeArea()
                VStack {
                    Text("Peer Soft")
                        .font(.largeTitle)
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding(.bottom)
                    
                    Spacer()
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.screenWidth * 0.5, height:.infinity)
                        .clipped()
                    
                    Spacer()
                    
                    Text("Welcome!")
                        .font(.title)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding()
                    Text("An app to encourage and facilitate \n in-person team communication.")
                        .font(.body)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                        .padding()
                    Spacer()
                    NavigationLink {
                        MainMenuController(path: $path)
                    } label: {
                        Text("Begin")
                            .foregroundColor(.white)
                            .padding()
                    }

//                    NavigationLink(value: GameType.welcome, label: {
//                        Text("Begin")
//                            .foregroundColor(.white)
//                            .padding()
//                    })
                    .frame(minWidth: 0, maxWidth: UIScreen.screenWidth * 0.75)
                    .background(.black)
                    .cornerRadius(25)
                    .padding()
                    Spacer()
                }
//                .navigationDestination(for: GameType.self) { _ in
//                    MainMenuController(path: $path)
//                }
            }
        }.navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeController()
    }
}
