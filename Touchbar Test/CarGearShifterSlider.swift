//
//  TrainThrottleControlButton.swift
//  Touchbar Test
//
//  Created by Mohamad Moukayed on 13/08/2024.
//

import Cocoa
import Carbon.HIToolbox.Events
import CoreHaptics


class CarGearShifterSlider: NSSlider {

    private var kc: CGKeyCode?
    private var ks: CGEventSource?
    private var kde: CGEvent?
    private var kue: CGEvent?
    private var prevVal: Int32 = 0
    private var hapticEngine: CHHapticEngine?
    public var label: NSTextField?
    func calculateVal() {
        if(self.intValue == 0) {
            self.trackFillColor = NSColor.systemGreen
            label?.stringValue = "D"
            label?.textColor = NSColor.systemGreen
        }
        else if(self.intValue == 1) {
            self.trackFillColor = NSColor.systemBlue
            label?.stringValue = "N"
            label?.textColor = NSColor.systemBlue
        }
        else if(self.intValue == 2) {
            self.trackFillColor = NSColor.systemOrange
            label?.stringValue = "R"
            label?.textColor = NSColor.systemOrange
        }
        else if(self.intValue == 3) {
            self.trackFillColor = NSColor.systemRed
            label?.stringValue = "P"
            label?.textColor = NSColor.systemRed
        }
    }
    override func touchesMoved(with event: NSEvent) {
        print("pressed")
        kc = CGKeyCode(kVK_ANSI_F) // Replace with the desired media key
        calculateVal()
        ks = CGEventSource(stateID: .hidSystemState)
        kde = CGEvent(keyboardEventSource: ks, virtualKey: kc!, keyDown: true)
        kue = CGEvent(keyboardEventSource: ks, virtualKey: kc!, keyDown: false)
        if(prevVal != self.intValue) {
//            NSHapticFeedbackManager.defaultPerformer.perform(NSHapticFeedbackManager.FeedbackPattern.levelChange, performanceTime: NSHapticFeedbackManager.PerformanceTime.now)
//            do {
//                hapticEngine = try CHHapticEngine()
//                try hapticEngine?.start()
//            } catch {
//                print("Failed to create haptic engine: \(error), \(error.localizedDescription)")
//            }
//            
//            
//            guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
//            
//            let hapticEvent = CHHapticEvent(eventType: .hapticTransient, parameters: [
//                CHHapticEventParameter(parameterID: .hapticIntensity, value: 1.0),
//                CHHapticEventParameter(parameterID: .hapticSharpness, value: 1.0)
//            ], relativeTime: 0)
//            
//            do {
//                let pattern = try CHHapticPattern(events: [hapticEvent], parameters: [])
//                let player = try hapticEngine?.makePlayer(with: pattern)
//                try player?.start(atTime: 0)
//            } catch {
//                print("Failed to play haptic: \(error)")
//            }
            
            kde?.post(tap: .cghidEventTap)
            kue?.post(tap: .cghidEventTap)
        }
        prevVal = self.intValue
        super.touchesMoved(with: event)
    }
    override func touchesEnded(with event: NSEvent) {
        print("released")
        kc = CGKeyCode(kVK_ANSI_F) // Replace with the desired media key
        calculateVal()
        kue?.post(tap: .cghidEventTap)
        super.touchesEnded(with: event)
    }
    
}
