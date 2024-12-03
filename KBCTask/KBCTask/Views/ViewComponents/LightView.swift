//
//  LightView.swift
//  KBCTask
//
//  Created by Kristina Trendafilova on 2.12.24.
//

import SwiftUI

struct LightView: View {
    
    let currentIndex: Int
    let isOn: Bool
    let color: Color
    
    var body: some View {
        Circle()
            .fill(color.opacity(isOn ? 1.0 : 0.2))
            .frame(width: 100, height: 100)
            .animation(.easeInOut(duration: 0.5), value: currentIndex)
    }
}

