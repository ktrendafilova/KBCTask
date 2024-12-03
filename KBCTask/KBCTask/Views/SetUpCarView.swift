//
//  ContentView.swift
//  KBCTask
//
//  Created by Kristina Trendafilova on 2.12.24.
//

import SwiftUI

struct SetUpCarView: View {
    @State private var carModel: String = ""
    @State private var showAlert: Bool = false
    @State private var navigateToNextScreen: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Enter Your Car Model")
                    .font(.headline)
                
                TextField("Car Model", text: $carModel)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                    .padding([.leading, .trailing], 16)
                
                Button(action: {
                    if carModel.count >= 3 {
                        navigateToNextScreen = true
                    } else {
                        showAlert = true
                    }
                }) {
                    Text("Start Driving")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal, 16)
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Invalid Input"), message: Text("Car model must have at least 3 characters"), dismissButton: .default(Text("OK")))
                }
                
                NavigationLink(
                    destination: TrafficLightView(carModel: carModel),
                    isActive: $navigateToNextScreen
                ) {
                    EmptyView()
                }
            }
        }
    }
}
