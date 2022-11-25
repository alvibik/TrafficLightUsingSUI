//
//  ContentView.swift
//  TrafficLightUsingSUI
//
//  Created by albik on 25.11.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var redlight = 0.3
    @State private var yellowlight = 0.3
    @State private var greenlight = 0.3
    @State private var buttonLabel = "START"
    
    private let lightOff = 0.3
    private let lightOn = 1.0
    
    var body: some View {
        VStack {
            Circle()
                .frame(width: 130)
                .foregroundColor(.red)
                .opacity(redlight)
            Circle()
                .frame(width: 130)
                .foregroundColor(.yellow)
                .opacity(yellowlight)
            Circle()
                .frame(width: 130)
                .foregroundColor(.green)
                .opacity(greenlight)
            
            Spacer()
            
            Button(action: {
                buttonLabel = "NEXT"
                if redlight == yellowlight {
                    greenlight = lightOff
                    redlight = lightOn
                } else if redlight == lightOn {
                    redlight = lightOff
                    yellowlight = lightOn
                } else if yellowlight == lightOn {
                    yellowlight = lightOff
                    greenlight = lightOn
                } else {
                    greenlight = lightOff
                }
            })
            {
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 100, height: 32)
                        .shadow(color: .black, radius: 5)
                        .opacity(0.7)
            
                    Text("\(buttonLabel)")
                        .font(.title3)
                        .foregroundColor(Color.white)
                }
            }
        }
        .padding(60)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
