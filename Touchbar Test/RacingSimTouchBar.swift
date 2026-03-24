//
//  TrainSimTouchBar.swift
//  Touchbar Test
//
//  Created by Mohamad Moukayed on 13/08/2024.
//

import Cocoa
import Carbon.HIToolbox.Events

class RacingSimTouchBar: NSObject, NSTouchBarDelegate {
    func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier identifier: NSTouchBarItem.Identifier) -> NSTouchBarItem? {
        if identifier == .carGasButton {
            let btn = CarControlButton(image:  (NSImage(systemSymbolName: "pedal.accelerator", accessibilityDescription: "")!.withSymbolConfiguration(NSImage.SymbolConfiguration(hierarchicalColor: NSColor.systemGreen)))!,target: self, action: nil)
            btn.imagePosition = .imageOnly
            btn.tag = 0
            let customTouchBarItem = NSCustomTouchBarItem(identifier: identifier)
            customTouchBarItem.view = btn
            return customTouchBarItem
        }
        if identifier == .carBrakesButton {
            let btn = CarControlButton(image:  (NSImage(systemSymbolName: "pedal.brake", accessibilityDescription: "")!.withSymbolConfiguration(NSImage.SymbolConfiguration(hierarchicalColor: NSColor.systemRed)))!,target: self, action: nil)
            btn.imagePosition = .imageOnly
            btn.tag = 1
            let customTouchBarItem = NSCustomTouchBarItem(identifier: identifier)
            customTouchBarItem.view = btn
            return customTouchBarItem
        }
        if identifier == .carGearShifter {
//            let btn = CarControlButton(image:  (NSImage(systemSymbolName: "pedal.brake", accessibilityDescription: "")!.withSymbolConfiguration(NSImage.SymbolConfiguration(hierarchicalColor: NSColor.systemRed)))!,target: self, action: nil)
//            btn.imagePosition = .imageOnly
//            btn.tag = 1
            let customTouchBarItem = NSCustomTouchBarItem(identifier: identifier)
            let slider = CarGearShifterSlider()
            slider.allowsTickMarkValuesOnly = true
            slider.maxValue = 4.0
            slider.minValue = 0.0
            slider.doubleValue = 4.0
            slider.trackFillColor =  NSColor.systemRed
            let shifter = CarGearShifter(slider: slider)
            customTouchBarItem.view = shifter
            return customTouchBarItem
        }
        return nil
    }
}

extension NSTouchBarItem.Identifier {
    static let carGearShifter = NSTouchBarItem.Identifier("com.example.TouchBar.carGearShifter")
    
    static let carGasButton = NSTouchBarItem.Identifier("com.example.TouchBar.carGasButton")
    static let carBrakesButton = NSTouchBarItem.Identifier("com.example.TouchBar.carBrakesButton")
    
//    static let awsBrakeButton = NSTouchBarItem.Identifier("com.example.TouchBar.awsBrakeButton")
}

