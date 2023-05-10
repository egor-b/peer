//
//  OnboardHandler.swift
//  peer
//
//  Created by Bryzgalov, Egor (A.) on 5/10/23.
//

import Foundation

class OnboardHandler: ObservableObject {
    
    @Published var onboarding = Onboarding()
    
    func handleOnboardScreen(isNext: Bool) {
        
        if isNext {
            onboarding.progress += 0.20
        } else {
            onboarding.progress -= 0.20
        }
    }
    
    func viewSwitch(first: Bool = false, second: Bool = false, third: Bool = false) {
        onboarding.first = first
        onboarding.second = second
        onboarding.third = third
    }
    
}
