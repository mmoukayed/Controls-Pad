//
//  TrainThrottleControlButton.swift
//  Touchbar Test
//
//  Created by Mohamad Moukayed on 13/08/2024.
//

import Cocoa
import Carbon.HIToolbox.Events

class TrainThrottleControlButton: NSButton {

    private var kc: CGKeyCode?
    private var ks: CGEventSource?
    private var kde: CGEvent?
    private var kue: CGEvent?
    override func touchesBegan(with event: NSEvent) {
        print("pressed")
        if(self.tag == 0) {
            kc = CGKeyCode(kVK_ANSI_W) // Replace with the desired media key
            self.image = NSImage(systemSymbolName: "arrowshape.up", accessibilityDescription: "")?.withSymbolConfiguration(NSImage.SymbolConfiguration(hierarchicalColor: NSColor.white))
            self.bezelColor = NSColor.systemGreen
        }
        else if(self.tag == 1){
            kc = CGKeyCode(kVK_ANSI_S)
            self.image = NSImage(systemSymbolName: "arrowshape.down", accessibilityDescription: "")?.withSymbolConfiguration(NSImage.SymbolConfiguration(hierarchicalColor: NSColor.white))
            self.bezelColor = NSColor.systemRed
        }
        else {
            kc = CGKeyCode(kVK_ANSI_Q)
            self.image = NSImage(systemSymbolName: "burn", accessibilityDescription: "")?.withSymbolConfiguration(NSImage.SymbolConfiguration(hierarchicalColor: NSColor.black))
            self.bezelColor = NSColor.systemYellow
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
            self.image = NSImage(systemSymbolName: "arrowshape.up", accessibilityDescription: "")?.withSymbolConfiguration(NSImage.SymbolConfiguration(hierarchicalColor: NSColor.systemGreen))
        }
        else if(self.tag == 1){
            self.image = NSImage(systemSymbolName: "arrowshape.down", accessibilityDescription: "")?.withSymbolConfiguration(NSImage.SymbolConfiguration(hierarchicalColor: NSColor.systemRed))
        }
        else {
            self.image = NSImage(systemSymbolName: "burn", accessibilityDescription: "")?.withSymbolConfiguration(NSImage.SymbolConfiguration(hierarchicalColor: NSColor.systemYellow))
        }
        self.bezelColor = nil
        kue?.post(tap: .cghidEventTap)
        super.touchesEnded(with: event)
    }
    
}
