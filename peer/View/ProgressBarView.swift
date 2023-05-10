//
//  ProgressBarView.swift
//  peer
//
//  Created by Bryzgalov, Egor (A.) on 5/9/23.
//

import SwiftUI

struct ProgressBarView: View {
    @Binding var value: Float
        
        var body: some View {
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                        .opacity(0.3)
                        .foregroundColor(Color.indigo)
                    
                    Rectangle().frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                        .foregroundColor(Color.progress)
                        .animation((.linear))
                }.cornerRadius(45.0)
            }
        }
}

//struct ProgressBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProgressBarView(value: 0.25)
//    }
//}
