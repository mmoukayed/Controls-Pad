//
//  ViewController.swift
//  Touchbar Test
//
//  Created by Mohamad Moukayed on 06/08/2024.
//

import Cocoa
import Carbon.HIToolbox.Events

class ViewController: NSViewController, NSTouchBarDelegate {
//    @IBOutlet var touchbar: NSTouchBar!
    @IBOutlet var engine: NSButton!
    @IBOutlet var reverse: NSButton!
    @IBOutlet var althold: NSButton!
    
    @IBOutlet var throttleIncrease: ThrottleControlButton!
    @IBOutlet var throttleDecrease: ThrottleControlButton!
    
    @IBOutlet var popover: NSPopover!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func enginePressed(_ sender: NSButton) {
        let keyCode = CGKeyCode(kVK_ANSI_E) // Replace with the desired media key
        let keySource = CGEventSource(stateID: .hidSystemState)
        let keyDownEvent = CGEvent(keyboardEventSource: keySource, virtualKey: keyCode, keyDown: true)
        let keyUpEvent = CGEvent(keyboardEventSource: keySource, virtualKey: keyCode, keyDown: false)
        
        keyDownEvent?.post(tap: .cghidEventTap)
        keyUpEvent?.post(tap: .cghidEventTap)
    }
    @IBAction func reversePressed(_ sender: NSButton) {
        let keyCode = CGKeyCode(kVK_ANSI_R) // Replace with the desired media key
        let keySource = CGEventSource(stateID: .hidSystemState)
        let keyDownEvent = CGEvent(keyboardEventSource: keySource, virtualKey: keyCode, keyDown: true)
        let keyUpEvent = CGEvent(keyboardEventSource: keySource, virtualKey: keyCode, keyDown: false)
        
        keyDownEvent?.post(tap: .cghidEventTap)
        keyUpEvent?.post(tap: .cghidEventTap)
    }
    @IBAction func altholdPressed(_ sender: NSButton) {
        let keyCode = CGKeyCode(kVK_ANSI_Y) // Replace with the desired media key
        let keySource = CGEventSource(stateID: .hidSystemState)
        let keyDownEvent = CGEvent(keyboardEventSource: keySource, virtualKey: keyCode, keyDown: true)
        let keyUpEvent = CGEvent(keyboardEventSource: keySource, virtualKey: keyCode, keyDown: false)
        
        keyDownEvent?.post(tap: .cghidEventTap)
        keyUpEvent?.post(tap: .cghidEventTap)
    }
    @IBAction func settingsPressed(_ sender: NSButton) {
        let keyCode = CGKeyCode(kVK_ANSI_V) // Replace with the desired media key
        let keySource = CGEventSource(stateID: .hidSystemState)
        let keyDownEvent = CGEvent(keyboardEventSource: keySource, virtualKey: keyCode, keyDown: true)
        let keyUpEvent = CGEvent(keyboardEventSource: keySource, virtualKey: keyCode, keyDown: false)
        
        keyDownEvent?.post(tap: .cghidEventTap)
        keyUpEvent?.post(tap: .cghidEventTap)
    }
    @IBAction func contractsPressed(_ sender: NSButton) {
        let keyCode = CGKeyCode(kVK_ANSI_X) // Replace with the desired media key
        let keySource = CGEventSource(stateID: .hidSystemState)
        let keyDownEvent = CGEvent(keyboardEventSource: keySource, virtualKey: keyCode, keyDown: true)
        let keyUpEvent = CGEvent(keyboardEventSource: keySource, virtualKey: keyCode, keyDown: false)
        
        keyDownEvent?.post(tap: .cghidEventTap)
        keyUpEvent?.post(tap: .cghidEventTap)
    }
    
    func getTouchBar() -> NSTouchBar? {
        return self.touchBar
    }
    override func viewDidAppear() {
        super.viewDidAppear()
        self.view.window?.unbind(NSBindingName(rawValue: #keyPath(touchBar))) // unbind first
        self.view.window?.bind(NSBindingName(rawValue: #keyPath(touchBar)), to: self, withKeyPath: #keyPath(touchBar), options: nil)
    }
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

