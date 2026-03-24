//
//  TrafficButton.swift
//  Touchbar Test
//
//  Created by Mohamad Moukayed on 13/08/2024.
//

import Cocoa

class TrafficButton: NSButton {
    
    override func touchesEnded(with event: NSEvent) {
        self.bezelColor = NSColor.systemGreen
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.bezelColor = NSColor.systemYellow
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.bezelColor = NSColor.systemRed
            }
        }
    }
}
