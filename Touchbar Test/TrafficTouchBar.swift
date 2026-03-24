//
//  TrafficTouchBar.swift
//  Touchbar Test
//
//  Created by Mohamad Moukayed on 13/08/2024.
//

import Cocoa

class TrafficTouchBar: NSObject, NSTouchBarDelegate {
    func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier identifier: NSTouchBarItem.Identifier) -> NSTouchBarItem? {
        if [.button, .button2,.button3,.button4].contains(identifier) {
            let customButton = TrafficButton(image: NSImage(systemSymbolName: "lightbulb", accessibilityDescription: "")!,target: self, action: nil)
            let customTouchBarItem = NSCustomTouchBarItem(identifier: identifier)
            customTouchBarItem.view = customButton
            return customTouchBarItem
        }
        return nil
    }
}

extension NSTouchBarItem.Identifier {
    static let button = NSTouchBarItem.Identifier("com.example.TouchBar.button")
    static let button2 = NSTouchBarItem.Identifier("com.example.TouchBar.button2")
    static let button3 = NSTouchBarItem.Identifier("com.example.TouchBar.button3")
    static let button4 = NSTouchBarItem.Identifier("com.example.TouchBar.button4")
}
