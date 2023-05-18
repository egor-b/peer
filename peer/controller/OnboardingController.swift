//
//  OnboardingController.swift
//  peer
//
//  Created by Bryzgalov, Egor (A.) on 5/9/23.
//

import SwiftUI

struct OnboardingController: View {
    
    @ObservedObject var onboardHandler = OnboardHandler()

//    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            VStack {
                ProgressBarView(value: $onboardHandler.onboarding.progress)
                    .frame(height: 5)
                    .padding()
                if onboardHandler.onboarding.first {
                    FirstOnboardingController(onboardHandler: onboardHandler)
                        .transition(.opacity)
                } else if onboardHandler.onboarding.second {
                        SecondOnboardingController(onboardHandler: onboardHandler)
                        .transition(.opacity)
                } else if onboardHandler.onboarding.third {
                    ThirdOnboardingController(onboardHandler: onboardHandler)
                        .transition(.opacity)
                }
                
            }
        }
    }
    
    struct DescribeOnboardingController_Previews: PreviewProvider {
        static var previews: some View {
            OnboardingController()
        }
    }
}
