//
//  LightView.swift
//  Traffic-Light_SwiftUI
//
//  Created by Артём Веселов on 10.06.2023.
//

import SwiftUI

struct LightView: View {
    let color: Color
    let opacity: Double
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(color)
                .frame(width: 120, height: 120)
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                .opacity(opacity)
                .shadow(color: color, radius: 20)
        }
    }
}

struct LightView_Previews: PreviewProvider {
    static var previews: some View {
        LightView(color: .blue, opacity: 1)
    }
}

