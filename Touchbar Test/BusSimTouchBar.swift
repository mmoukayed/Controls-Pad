//
//  TrainSimTouchBar.swift
//  Touchbar Test
//
//  Created by Mohamad Moukayed on 13/08/2024.
//

import Cocoa
import Carbon.HIToolbox.Events

class BusSimTouchBar: NSObject, NSTouchBarDelegate {
    func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier identifier: NSTouchBarItem.Identifier) -> NSTouchBarItem? {
        if identifier == .frontDoorButton {
            let btn = BusDoorControlButton(title: "Front Door", image: NSImage(systemSymbolName: "door.sliding.left.hand.closed", accessibilityDescription: "")!,target: self, action: nil)
            btn.imagePosition = .imageLeft
            btn.tag = 1
            btn.setButtonType(.onOff)
            btn.bezelColor = NSColor.systemBlue
            btn.frame = NSRect(x: 0, y: 0, width: 50, height: 15)
            print(btn.frame)
            let customTouchBarItem = NSCustomTouchBarItem(identifier: identifier)
            customTouchBarItem.view = btn
            return customTouchBarItem
        }
        if identifier == .RearDoorButton {
            let btn = BusDoorControlButton(title: "Rear Door", image: NSImage(systemSymbolName: "door.sliding.left.hand.closed", accessibilityDescription: "")!,target: self, action: nil)
            btn.imagePosition = .imageLeft
            btn.tag = 0
            btn.setButtonType(.onOff)
            btn.bezelColor = NSColor.systemYellow
            btn.frame = NSRect(x: 0, y: 0, width: 50, height: 15)
            print(btn.frame)
            let customTouchBarItem = NSCustomTouchBarItem(identifier: identifier)
            customTouchBarItem.view = btn
            return customTouchBarItem
        }
        if identifier == .LeftTurnSignalButton {
            let btn = BusDoorControlButton(image: NSImage(systemSymbolName: "arrowshape.left", accessibilityDescription: "")!,target: self, action: nil)
            btn.imagePosition = .imageOnly
            btn.tag = 2
            btn.setButtonType(.onOff)
            btn.bezelColor = NSColor.systemGreen
            btn.frame = NSRect(x: 0, y: 0, width: 50, height: 15)
            print(btn.frame)
            let customTouchBarItem = NSCustomTouchBarItem(identifier: identifier)
            customTouchBarItem.view = btn
            return customTouchBarItem
        }
        if identifier == .HazardLightButton {
            let btn = BusDoorControlButton(image: NSImage(systemSymbolName: "hazardsign", accessibilityDescription: "")!,target: self, action: nil)
            btn.imagePosition = .imageOnly
            btn.tag = 3
            btn.setButtonType(.onOff)
            btn.bezelColor = NSColor.systemRed
            btn.frame = NSRect(x: 0, y: 0, width: 50, height: 15)
            print(btn.frame)
            let customTouchBarItem = NSCustomTouchBarItem(identifier: identifier)
            customTouchBarItem.view = btn
            return customTouchBarItem
        }
        if identifier == .RightTurnSignalButton {
            let btn = BusDoorControlButton(image: NSImage(systemSymbolName: "arrowshape.right", accessibilityDescription: "")!,target: self, action: nil)
            btn.imagePosition = .imageOnly
            btn.tag = 4
            btn.setButtonType(.onOff)
            btn.bezelColor = NSColor.systemGreen
            btn.frame = NSRect(x: 0, y: 0, width: 50, height: 15)
            print(btn.frame)
            let customTouchBarItem = NSCustomTouchBarItem(identifier: identifier)
            customTouchBarItem.view = btn
            return customTouchBarItem
        }
        
        if identifier == .ParkingBrakeButton {
            let btn = BusControlButton(image: (NSImage(systemSymbolName: "parkingsign.brakesignal", accessibilityDescription: "")!.withSymbolConfiguration(NSImage.SymbolConfiguration(hierarchicalColor: NSColor.systemRed)))!,target: self, action: nil)
            btn.tag = 0
            btn.setButtonType(.onOff)
            let customTouchBarItem = NSCustomTouchBarItem(identifier: identifier)
            customTouchBarItem.view = btn
            return customTouchBarItem
        }
        
        return nil
    }
}

extension NSTouchBarItem.Identifier {
    static let frontDoorButton = NSTouchBarItem.Identifier("com.example.TouchBar.frontDoorButton")
    static let RearDoorButton = NSTouchBarItem.Identifier("com.example.TouchBar.RearDoorButton")
    
    static let LeftTurnSignalButton = NSTouchBarItem.Identifier("com.example.TouchBar.LeftTurnSignalButton")
    static let RightTurnSignalButton = NSTouchBarItem.Identifier("com.example.TouchBar.RightTurnSignalButton")
    static let HazardLightButton = NSTouchBarItem.Identifier("com.example.TouchBar.HazardLightButton")
    
    static let ParkingBrakeButton = NSTouchBarItem.Identifier("com.example.TouchBar.ParkingBrakeButton")
    
//    static let awsBrakeButton = NSTouchBarItem.Identifier("com.example.TouchBar.awsBrakeButton")
}

