//
//  ThrottleControlButton.swift
//  Touchbar Test
//
//  Created by Mohamad Moukayed on 11/08/2024.
//

import Cocoa
import Carbon.HIToolbox.Events

class ThrottleControlButton: NSButton {
    private var kc: CGKeyCode?
    private var ks: CGEventSource?
    private var kde: CGEvent?
    private var kue: CGEvent?
    override func touchesBegan(with event: NSEvent) {
        print("pressed")
        if(self.tag == 0) {
            kc = CGKeyCode(kVK_ANSI_S) // Replace with the desired media key
            self.image = NSImage(systemSymbolName: "arrowshape.down", accessibilityDescription: "")?.withSymbolConfiguration(NSImage.SymbolConfiguration(hierarchicalColor: NSColor.white))
            self.bezelColor = NSColor.systemRed
        }
        else if(self.tag == 1){
            kc = CGKeyCode(kVK_ANSI_B)
            self.image = NSImage(systemSymbolName: "brakesignal", accessibilityDescription: "")?.withSymbolConfiguration(NSImage.SymbolConfiguration(hierarchicalColor: NSColor.black))
            self.bezelColor = NSColor.white
        }
        else if(self.tag == 2) {
            kc = CGKeyCode(kVK_ANSI_W)
            self.image = NSImage(systemSymbolName: "arrowshape.down", accessibilityDescription: "")?.withSymbolConfiguration(NSImage.SymbolConfiguration(hierarchicalColor: NSColor.white))
            self.bezelColor = NSColor.systemGreen
        }
        else {
            kc = CGKeyCode(kVK_ANSI_B)
            self.image = NSImage(systemSymbolName: "brakesignal", accessibilityDescription: "")?.withSymbolConfiguration(NSImage.SymbolConfiguration(hierarchicalColor: NSColor.black))
            self.bezelColor = NSColor.white
        }
        ks = CGEventSource(stateID: .hidSystemState)
        kde = CGEvent(keyboardEventSource: ks, virtualKey: kc!, keyDown: true)
        kue = CGEvent(keyboardEventSource: ks, virtualKey: kc!, keyDown: false)
        
        kde?.post(tap: .cghidEventTap)
        super.touchesBegan(with: event)
    }
    override func touchesEnded(with event: NSEvent) {
        print("released")
        if(self.tag == 0) {
            self.image = NSImage(systemSymbolName: "arrowshape.down", accessibilityDescription: "")?.withSymbolConfiguration(NSImage.SymbolConfiguration(hierarchicalColor: NSColor.systemRed))
        }
        else if(self.tag == 1){
            self.image = NSImage(systemSymbolName: "brakesignal", accessibilityDescription: "")?.withSymbolConfiguration(NSImage.SymbolConfiguration(hierarchicalColor: NSColor.white))
        }
        else if(self.tag == 2) {
            self.image = NSImage(systemSymbolName: "arrowshape.down", accessibilityDescription: "")?.withSymbolConfiguration(NSImage.SymbolConfiguration(hierarchicalColor: NSColor.systemGreen))
        }
        else {
            self.image = NSImage(systemSymbolName: "brakesignal", accessibilityDescription: "")?.withSymbolConfiguration(NSImage.SymbolConfiguration(hierarchicalColor: NSColor.white))
        }
        self.bezelColor = nil
        kue?.post(tap: .cghidEventTap)
        super.touchesEnded(with: event)
    }
    
}
