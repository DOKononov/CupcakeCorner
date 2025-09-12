//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Dmitry Kononov on 10.09.25.
//

import SwiftUI
import CoreHaptics

struct ContentView: View {
//    @State private var counter =  0
    @State private var engine: CHHapticEngine?
   
    
    var body: some View {
        Button("Play haptic", action: complexSuccess)
            .onAppear(perform: prepareHaptics)
//        .sensoryFeedback(.increase, trigger: counter)
    }
    
    private func prepareHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        do {
            engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print ("Error starting haptics engine: \(error.localizedDescription)")
        }
    }
    
    private func complexSuccess() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }

        var events: [CHHapticEvent] = []
        
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1)
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1)
        let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0)
        events.append(event)
        
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makeAdvancedPlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Error \(error.localizedDescription)")
        }
    }
}

#Preview {
    ContentView()
}
