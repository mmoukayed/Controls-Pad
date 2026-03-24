//
//  TrainSimTouchBar.swift
//  Touchbar Test
//
//  Created by Mohamad Moukayed on 13/08/2024.
//

import Cocoa
import Carbon.HIToolbox.Events

class TrainSimTouchBar: NSObject, NSTouchBarDelegate {
    func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier identifier: NSTouchBarItem.Identifier) -> NSTouchBarItem? {
        if identifier == .doorButton {
            let btn = TrainControlButton(title: "Door", image: NSImage(systemSymbolName: "door.sliding.left.hand.closed", accessibilityDescription: "")!,target: self, action: nil)
            btn.imagePosition = .imageLeft
            btn.tag = 0
            btn.setButtonType(.onOff)
            btn.bezelColor = NSColor.systemBlue
            btn.frame = NSRect(x: 0, y: 0, width: 50, height: 15)
            print(btn.frame)
            let customTouchBarItem = NSCustomTouchBarItem(identifier: identifier)
            customTouchBarItem.view = btn
            return customTouchBarItem
        }
        if identifier == .awsBrakeButton {
            let btn = TrainThrottleControlButton(title: "AWS", image: (NSImage(systemSymbolName: "burn", accessibilityDescription: "")!.withSymbolConfiguration(NSImage.SymbolConfiguration(hierarchicalColor: NSColor.systemYellow)))!,target: self, action: nil)
            btn.imagePosition = .imageLeft
            btn.tag = 2
            let customTouchBarItem = NSCustomTouchBarItem(identifier: identifier)
            customTouchBarItem.view = btn
            return customTouchBarItem
        }
        if identifier == .trainThrottleUpButton {
            let btn = TrainThrottleControlButton(image: (NSImage(systemSymbolName: "arrowshape.up", accessibilityDescription: "")!.withSymbolConfiguration(NSImage.SymbolConfiguration(hierarchicalColor: NSColor.systemGreen)))!,target: self, action: nil)
            btn.tag = 0
            let customTouchBarItem = NSCustomTouchBarItem(identifier: identifier)
            customTouchBarItem.view = btn
            return customTouchBarItem
        }
        if identifier == .trainThrottleDownButton {
            let btn = TrainThrottleControlButton(image: (NSImage(systemSymbolName: "arrowshape.down", accessibilityDescription: "")!.withSymbolConfiguration(NSImage.SymbolConfiguration(hierarchicalColor: NSColor.systemRed)))!,target: self, action: nil)
            btn.tag = 1
            let customTouchBarItem = NSCustomTouchBarItem(identifier: identifier)
            customTouchBarItem.view = btn
            return customTouchBarItem
        }
        
        return nil
    }
}

extension NSTouchBarItem.Identifier {
    static let doorButton = NSTouchBarItem.Identifier("com.example.TouchBar.doorButton")
    
    static let trainThrottleDownButton = NSTouchBarItem.Identifier("com.example.TouchBar.trainThrottleDownButton")
    static let trainThrottleUpButton = NSTouchBarItem.Identifier("com.example.TouchBar.trainThrottleUpButton")
    
    static let awsBrakeButton = NSTouchBarItem.Identifier("com.example.TouchBar.awsBrakeButton")
}

