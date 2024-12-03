//
//  TraficLight.swift
//  KBCTask
//
//  Created by Kristina Trendafilova on 2.12.24.
//

import SwiftUI
import Foundation

enum TrafficLightType: CaseIterable {
    
    init(index: Int) {
        self = TrafficLightType.lightOrder[index]
    }
    
    case red, yellow, green
    
    var color: Color {
        switch self {
        case .red: return .red
        case .yellow: return .yellow
        case .green: return .green
        }
    }
    
    var duration: TimeInterval {
        switch self {
        case .red:
            return Constants.redLightDuration
        case .yellow:
            return Constants.orangeLightDuration
        case .green:
            return Constants.greenLightDuration
        }
    }
    
    static let lightOrder: [Self] = [.green, .yellow, .red]
    
    // Used for testing
    static func nextLight(after light: TrafficLightType) -> TrafficLightType {
        let currentIndex = lightOrder.firstIndex(of: light) ?? 0
        let nextIndex = (currentIndex + 1) % lightOrder.count
        return lightOrder[nextIndex]
    }
}
