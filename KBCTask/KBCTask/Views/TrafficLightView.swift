//
//  TrafficLightView.swift
//  KBCTask
//
//  Created by Kristina Trendafilova on 2.12.24.
//

import SwiftUI

struct TrafficLightView: View {
    
    let carModel: String
    
    @State private var currentLight: TrafficLightType = .red
    @State private var currentIndex: Int = 2
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Driving a \(carModel)")
                .font(.headline)
                .padding()
            
            
            VStack(spacing: 0) {
                VStack(spacing: 15) {
                    LightView(currentIndex: currentIndex, isOn: currentLight == .red, color: .red)
                    LightView(currentIndex: currentIndex, isOn: currentLight == .yellow, color: .yellow)
                    LightView(currentIndex: currentIndex, isOn: currentLight == .green, color: .green)
                }
                .padding(20)
                .overlay(
                    RoundedRectangle(cornerSize: .init(width: 20, height: 20))
                        .stroke(Color.black, lineWidth: 3)
                )
            }
            
            Spacer()
        }
        .onAppear(perform: startTrafficLight)
        .padding()
    }
    
    private func startTrafficLight() {
        DispatchQueue.main.asyncAfter(deadline: .now() + currentLight.duration) {
            currentIndex = (currentIndex + 1) % 3
            withAnimation {
                currentLight = TrafficLightType(index: currentIndex)
            }
            startTrafficLight()
        }
    }
}
