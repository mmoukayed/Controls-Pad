//
//  TrainControlButton.swift
//  Touchbar Test
//
//  Created by Mohamad Moukayed on 13/08/2024.
//

import Cocoa
import Carbon.HIToolbox.Events

class TrainControlButton: NSButton {
    override func touchesEnded(with event: NSEvent) {
        
        if(self.tag == 0) {
            let keyCode = CGKeyCode(kVK_ANSI_T) // Replace with the desired media key
            let keySource = CGEventSource(stateID: .hidSystemState)
            let keyDownEvent = CGEvent(keyboardEventSource: keySource, virtualKey: keyCode, keyDown: true)
            let keyUpEvent = CGEvent(keyboardEventSource: keySource, virtualKey: keyCode, keyDown: false)
            
            keyDownEvent?.post(tap: .cghidEventTap)
            keyUpEvent?.post(tap: .cghidEventTap)
        }
        if(self.tag == 1) {
            let keyCode = CGKeyCode(kVK_ANSI_Q) // Replace with the desired media key
            let keySource = CGEventSource(stateID: .hidSystemState)
            let keyDownEvent = CGEvent(keyboardEventSource: keySource, virtualKey: keyCode, keyDown: true)
            let keyUpEvent = CGEvent(keyboardEventSource: keySource, virtualKey: keyCode, keyDown: false)
            
            keyDownEvent?.post(tap: .cghidEventTap)
            keyUpEvent?.post(tap: .cghidEventTap)
        }
        super.touchesEnded(with: event)
    }
    
}
