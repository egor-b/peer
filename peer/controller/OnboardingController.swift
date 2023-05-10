//
//  DescribeOnboardingController.swift
//  peer
//
//  Created by Bryzgalov, Egor (A.) on 5/9/23.
//

import SwiftUI

struct OnboardingController: View {
    @State var progressValue: Float = 0.20
//    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            VStack {
                ProgressBarView(value: $progressValue).frame(height: 10)
                    .padding()
                
                FirstOnboardingController()
            }
        }
    }
    
    struct DescribeOnboardingController_Previews: PreviewProvider {
        static var previews: some View {
            OnboardingController()
        }
    }
}
