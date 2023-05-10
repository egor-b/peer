//
//  ContentView.swift
//  peer
//
//  Created by Bryzgalov, Egor (A.) on 5/9/23.
//

import SwiftUI

struct WelcomeController: View {
    var body: some View {
        NavigationView {
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
                    Text("Please chose your role to begin.")
                        .font(.body)
                        .foregroundColor(.white)
                        .padding(.bottom, 30)
                    
                    NavigationLink {
                        OnboardingController(progressValue: 0.25).navigationBarTitle("")
                            .navigationBarHidden(true)
                    } label: {
                        Text("Team Member")
                            .foregroundColor(.white)
                            .padding()
                    }
                    .frame(minWidth: 0, maxWidth: UIScreen.screenWidth * 0.75)
                    .background(.black)
                    .cornerRadius(25)
                    .padding()
                    
                    NavigationLink {
                        OnboardingController(progressValue: 0.25)
                    } label: {
                        Text("Team Admin")
                            .foregroundColor(.white)
                            .padding()
                    }.frame(minWidth: 0, maxWidth: UIScreen.screenWidth * 0.75)
                        .background(.black)
                        .cornerRadius(25)
                        .padding()
                        .padding(.bottom, 40)
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeController()
    }
}
