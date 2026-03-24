//
//  FlightSimTouchBar.swift
//  Touchbar Test
//
//  Created by Mohamad Moukayed on 13/08/2024.
//

import Cocoa
import Carbon.HIToolbox.Events

class FlightSimTouchBar: NSObject,NSTouchBarDelegate {
    func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier identifier: NSTouchBarItem.Identifier) -> NSTouchBarItem? {
        if identifier == .engineButton {
            let btn = FlightControlButton(title: "Engine", image: NSImage(systemSymbolName: "engine.combustion", accessibilityDescription: "")!,target: self, action: nil)
            btn.imagePosition = .imageLeft
            btn.tag = 0
            btn.setButtonType(.onOff)
            btn.bezelColor = NSColor.systemOrange
            btn.frame = NSRect(x: 0, y: 0, width: 50, height: 15)
            print(btn.frame)
            let customTouchBarItem = NSCustomTouchBarItem(identifier: identifier)
            customTouchBarItem.view = btn
            return customTouchBarItem
        }
        if identifier == .reverseButton {
            let btn = FlightControlButton(title: "Reverse", image: NSImage(systemSymbolName: "gearshift.layout.sixspeed", accessibilityDescription: "")!,target: self, action: nil)
            btn.imagePosition = .imageLeft
            btn.tag = 1
            btn.setButtonType(.onOff)
            btn.bezelColor = NSColor.systemRed
            let customTouchBarItem = NSCustomTouchBarItem(identifier: identifier)
            customTouchBarItem.view = btn
            return customTouchBarItem
        }
        if identifier == .altholdButton {
            let btn = FlightControlButton(title: "Alt Hold", image: NSImage(systemSymbolName: "airplane", accessibilityDescription: "")!,target: self, action: nil)
            btn.imagePosition = .imageLeft
            btn.tag = 2
            btn.setButtonType(.onOff)
            btn.bezelColor = NSColor.systemYellow
            let customTouchBarItem = NSCustomTouchBarItem(identifier: identifier)
            customTouchBarItem.view = btn
            return customTouchBarItem
        }
        if identifier == .contractsButton {
            let btn = FlightControlButton(title: "Contracts", image: NSImage(systemSymbolName: "cube.box", accessibilityDescription: "")!,target: self, action: nil)
            btn.imagePosition = .imageLeft
            btn.setButtonType(.onOff)
            btn.tag = 3
            btn.bezelColor = NSColor.white
            let customTouchBarItem = NSCustomTouchBarItem(identifier: identifier)
            customTouchBarItem.view = btn
            return customTouchBarItem
        }
        
        if identifier == .throttleUpButton {
            let btn = ThrottleControlButton(image: (NSImage(systemSymbolName: "arrowshape.up", accessibilityDescription: "")!.withSymbolConfiguration(NSImage.SymbolConfiguration(hierarchicalColor: NSColor.systemGreen)))!,target: self, action: nil)
            btn.tag = 2
            btn.frame = NSRect(x: 0, y: 0, width: 72, height: 30)
            let customTouchBarItem = NSCustomTouchBarItem(identifier: identifier)
            customTouchBarItem.view = btn
            return customTouchBarItem
        }
        if identifier == .throttleDownButton {
            let btn = ThrottleControlButton(image: (NSImage(systemSymbolName: "arrowshape.down", accessibilityDescription: "")!.withSymbolConfiguration(NSImage.SymbolConfiguration(hierarchicalColor: NSColor.systemRed)))!,target: self, action: nil)
            btn.tag = 0
            btn.frame = NSRect(x: 0, y: 0, width: 72, height: 30)
            let customTouchBarItem = NSCustomTouchBarItem(identifier: identifier)
            customTouchBarItem.view = btn
            return customTouchBarItem
        }
        if identifier == .brakesButton {
            let btn = ThrottleControlButton(image: (NSImage(systemSymbolName: "brakesignal", accessibilityDescription: "")!.withSymbolConfiguration(NSImage.SymbolConfiguration(hierarchicalColor: NSColor.white)))!,target: self, action: nil)
            btn.tag = 1
            btn.frame = NSRect(x: 0, y: 0, width: 72, height: 30)
            let customTouchBarItem = NSCustomTouchBarItem(identifier: identifier)
            customTouchBarItem.view = btn
            return customTouchBarItem
        }
        
        return nil
    }
    
}

extension NSTouchBarItem.Identifier {
    static let engineButton = NSTouchBarItem.Identifier("com.example.TouchBar.engineButton")
    static let reverseButton = NSTouchBarItem.Identifier("com.example.TouchBar.reverseButton")
    static let altholdButton = NSTouchBarItem.Identifier("com.example.TouchBar.altholdButton")
    static let contractsButton = NSTouchBarItem.Identifier("com.example.TouchBar.contractsButton")
    
    static let throttleDownButton = NSTouchBarItem.Identifier("com.example.TouchBar.throttleDownButton")
    static let throttleUpButton = NSTouchBarItem.Identifier("com.example.TouchBar.throttleUpButton")
    static let brakesButton = NSTouchBarItem.Identifier("com.example.TouchBar.brakesButton")
}

