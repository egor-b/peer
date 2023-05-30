//
//  MainMenuButton.swift
//  peer
//
//  Created by Bryzgalov, Egor (A.) on 5/29/23.
//

import SwiftUI

struct MainMenuButton: View {
    
    var image: String
    var textLabel: String
    
    var body: some View {
        
        VStack {
            Rectangle()
                .frame(width: UIScreen.screenWidth * 0.4, height: UIScreen.screenWidth * 0.5)
                .cornerRadius(20)
                .overlay {
                    VStack {
                        Spacer()
                        Image(image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.screenWidth * 0.22)
                        Spacer()
                        Text(textLabel)
                            .font(.title2)
                            .fontWeight(.medium)
                            .foregroundColor(Color.white)
                        Spacer()
                    }
                }
        }
    }
}

struct MainMenuButton_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuButton(image: "smile", textLabel: "Jokes")
    }
}
