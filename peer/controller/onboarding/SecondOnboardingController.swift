//
//  SecondOnboardingController.swift
//  peer
//
//  Created by Bryzgalov, Egor (A.) on 5/10/23.
//

import SwiftUI

struct SecondOnboardingController: View {
    
    @StateObject var onboardHandler: OnboardHandler
    @State private var isShowingPopover = false

    var body: some View {
        
        ZStack {
            Color.background.ignoresSafeArea()
            VStack {
                HStack {
                    Button {
                        withAnimation {
                            onboardHandler.onboarding.first.toggle()
                            onboardHandler.onboarding.second.toggle()
                            onboardHandler.handleOnboardScreen(isNext: false)
                        }
                    } label: {
                        Image(systemName: "arrow.backward.square")
                            .foregroundColor(.white)
                            .font(.system(size: 40))
                    }.padding()
                        .padding(.leading, 10)
                    Spacer()
                    Button {
                        isShowingPopover.toggle()
                    } label: {
                        Image(systemName: "questionmark.app")
                            .foregroundColor(.white)
                            .font(.system(size: 40))
                    }.popover(isPresented: $isShowingPopover, attachmentAnchor: .point(.center)) {
                        PopoverView()
                            .frame(width: UIScreen.screenWidth * 0.8)
                            .presentationCompactAdaptation(.popover)
                    }
                    .padding()
                    .padding(.trailing, 10)
                }
                Spacer()
                Text("What skill?")
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: UIScreen.screenWidth)
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding()
                
                Spacer()
                Button {
                    onboardHandler.onboarding.second.toggle()
                    onboardHandler.onboarding.third.toggle()
                    onboardHandler.handleOnboardScreen(isNext: true)

                } label: {
                    Text("Introvert")
                        .foregroundColor(.background)
                        .bold()
                        .padding()
                }.frame(minWidth: 0, maxWidth: UIScreen.screenWidth * 0.75)
                    .background(.white)
                    .cornerRadius(25)
                    .padding()
                Button {
                    print("YOU ARE MEMBER")
                } label: {
                    Text("Introvert")
                        .foregroundColor(.background)
                        .bold()
                        .padding()
                }.frame(minWidth: 0, maxWidth: UIScreen.screenWidth * 0.75)
                    .background(.white)
                    .cornerRadius(25)
                    .padding()
                Button {
                    print("YOU ARE MEMBER")
                } label: {
                    Text("Ambient")
                        .foregroundColor(.background)
                        .bold()
                        .padding()
                }.frame(minWidth: 0, maxWidth: UIScreen.screenWidth * 0.75)
                    .background(.white)
                    .cornerRadius(25)
                    .padding()
                
                Button {
                    print("YOU ARE MEMBER")
                } label: {
                    Text("Extrovert")
                        .foregroundColor(.background)
                        .bold()
                        .padding()
                }.frame(minWidth: 0, maxWidth: UIScreen.screenWidth * 0.75)
                    .background(.white)
                    .cornerRadius(25)
                    .padding()
            }
        }
    }
}

struct SecondOnboardingController_Previews: PreviewProvider {
    static var previews: some View {
        SecondOnboardingController(onboardHandler: OnboardHandler())
    }
}
