//
//  ContentView.swift
//  Traffic-Light_SwiftUI
//
//  Created by Артём Веселов on 10.06.2023.
//

import SwiftUI

enum CurrentLight {
    case red, yellow, green
}

struct ContentView: View {
    @State private var currentLight = CurrentLight.red
    @State private var buttonTitle = "Start"
    
    @State private var redOpacity = 0.1
    @State private var yellowOpacity = 0.1
    @State private var greenOpacity = 0.1
    
    var body: some View {
        VStack {
            ZStack {
                VStack(spacing: 20) {
                    LightView(color: .red, opacity: redOpacity)
                    LightView(color: .yellow, opacity: yellowOpacity)
                    LightView(color: .green, opacity: greenOpacity)
                }
            }
            Spacer()
            Button(action: switchColors) {
                Text(buttonTitle)
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
            .frame(width: 160, height: 30)
            .padding(.horizontal)
            .padding(.vertical)
            .background(.blue)
            .cornerRadius(15)
            .shadow(radius: 10)
        }
        .padding()
    }
}

extension ContentView {
    private func switchColors() {
        let lightOn = 1.0
        let lightOff = 0.1
        buttonTitle = "Next"
        
        switch currentLight {
        case .red:
            greenOpacity = lightOff
            redOpacity = lightOn
            currentLight = .yellow
        case .yellow:
            redOpacity = lightOff
            yellowOpacity = lightOn
            currentLight = .green
        case .green:
            yellowOpacity = lightOff
            greenOpacity = lightOn
            currentLight = .red
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
