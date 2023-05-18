//
//  ThirdOnboardingController.swift
//  peer
//
//  Created by Bryzgalov, Egor (A.) on 5/11/23.
//

import SwiftUI

struct ThirdOnboardingController: View {
    
    @StateObject var onboardHandler: OnboardHandler

    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            VStack {
                HStack {
                    Button {
                        withAnimation {
                            onboardHandler.onboarding.second.toggle()
                            onboardHandler.onboarding.third.toggle()
                            onboardHandler.handleOnboardScreen(isNext: false)
                        }
                    } label: {
                        Image(systemName: "arrow.backward.square")
                            .foregroundColor(.white)
                            .font(.system(size: 40))
                    }.padding()
                        .padding(.leading, 10)
                    Spacer()
                }
//                Spacer()
                Text("Pair with your team!")
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: UIScreen.screenWidth)
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding()
                
                Spacer()
                ZStack {
                    
                    Rectangle()
                        .fill(Color.dark)
                        .frame(width: UIScreen.screenWidth * 0.75, height: UIScreen.screenHeight * 0.2)
                        .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                    VStack {
                        Text("Share this code:")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                        Text("code 3131")
                            .foregroundColor(.white)
                        Button {
                            
                        } label: {
                            Text("Share")
                        }
                    }
                    
                }
                
                
                Text("OR")
                    .fontWeight(.bold)
                    .frame(width: 30, height: 30, alignment: .center)
                    .padding()
                    .background(Color.highRiseWhite)
                    .cornerRadius(30)
                    .overlay(
                        Circle()
                            .stroke(Color.black, lineWidth: 7)
//                            .padding(6)
                    )
//                }
                .frame(width: 40, height: 40)
//                Button {
//                    print("YOU ARE MEMBER")
//                } label: {
//                    Text("Extrovert")
//                        .foregroundColor(.background)
//                        .bold()
//                        .padding()
//                }.frame(minWidth: 30, maxWidth: UIScreen.screenWidth * 0.75)
//                    .background(.white)
//                    .cornerRadius(25)
//                    .padding()
                ZStack {
                    
                    Rectangle()
                        .fill(Color.dark)
                        .frame(width: UIScreen.screenWidth * 0.75, height: UIScreen.screenHeight * 0.2)
                        .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)

                    VStack {
                        Text("I have my team's code:")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                        Text("code 3131")
                            .foregroundColor(.white)
                    }
                }
                Spacer()
            }
        }
    }
}

struct ThirdOnboardingController_Previews: PreviewProvider {
    static var previews: some View {
        ThirdOnboardingController(onboardHandler: OnboardHandler())
    }
}
