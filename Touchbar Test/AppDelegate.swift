//
//  AppDelegate.swift
//  Touchbar Test
//
//  Created by Mohamad Moukayed on 06/08/2024.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, NSTouchBarDelegate, NSMenuDelegate {

    var statusItem: NSStatusItem!
    var viewController: ViewController?
    static var ident: NSTouchBarItem.Identifier?
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        if let window = NSApplication.shared.windows.first,
           let rootVC = window.contentViewController as? ViewController {
            self.viewController = rootVC
        }
        // Insert code here to initialize your application
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        statusItem.button?.image = NSImage(systemSymbolName: "gamecontroller",accessibilityDescription: "")!
//        statusItem.button?.target = self
//        statusItem.button?.action = #selector(menuWillOpen)
        statusItem.button?.action = nil
        var menu = NSMenu()
        menu.addItem(NSMenuItem(title: "Show Flight Sim TouchBar", action: #selector(createFlightSimTouchBar), keyEquivalent: ""))
        menu.addItem(NSMenuItem(title: "Show Train Sim TouchBar", action: #selector(createTrainSimTouchBar), keyEquivalent: ""))
        menu.addItem(NSMenuItem(title: "Show Racing Sim TouchBar", action: #selector(createRaceSimTouchBar), keyEquivalent: ""))
        menu.addItem(NSMenuItem(title: "Show Bus Sim TouchBar", action: #selector(createBusSimTouchBar), keyEquivalent: ""))
        menu.addItem(NSMenuItem(title: "Show Traffic Control TouchBar", action: #selector(createTrafficTouchBar), keyEquivalent: ""))
        menu.addItem(NSMenuItem(title: "Quit", action: #selector(quitApp), keyEquivalent: ""))
        statusItem.menu = menu
        
        DFRSystemModalShowsCloseBoxWhenFrontMost(true)
        let touchBarIdentifier = NSTouchBarItem.Identifier(rawValue: "TouchBar")
        let touchBarItem = NSCustomTouchBarItem.init(identifier: touchBarIdentifier)
        let touchBarButton = NSButton(image: NSImage(systemSymbolName: "gamecontroller",accessibilityDescription: "")!, target: nil, action: #selector(createFlightSimTouchBar))
        touchBarItem.view = touchBarButton
//        NSTouchBarItem.addSystemTrayItem(touchBarItem)
        DFRElementSetControlStripPresenceForIdentifier(touchBarIdentifier, true)
        AppDelegate.ident = touchBarIdentifier
    }
    @objc func quitApp() {
        NSApplication.shared.terminate(self)
    }
    @objc func createTrafficTouchBar() {
        var touchbar = NSTouchBar()
        var ttb = TrafficTouchBar()
        touchbar.delegate = ttb
        touchbar.defaultItemIdentifiers = [.button,.button2,.button3,.button4]
        presentTouchBar(tb: touchbar, idf: AppDelegate.ident!)
    }
    
    @objc func createFlightSimTouchBar() {
        var tb = NSTouchBar()
        var fstb = FlightSimTouchBar()
        tb.delegate = fstb
        tb.defaultItemIdentifiers = [.engineButton, .reverseButton, .altholdButton, .flexibleSpace, .throttleDownButton, .brakesButton, .throttleUpButton]
        presentTouchBar(tb: tb, idf: AppDelegate.ident!)
//        presentTouchBar(tb: (viewController?.touchBar)!, idf: AppDelegate.ident!)
    }
    @objc func createTrainSimTouchBar() {
        var tb = NSTouchBar()
        var fstb = TrainSimTouchBar()
        tb.delegate = fstb
        tb.defaultItemIdentifiers = [.doorButton, .flexibleSpace,.trainThrottleDownButton, .trainThrottleUpButton, .flexibleSpace, .awsBrakeButton]
        presentTouchBar(tb: tb, idf: AppDelegate.ident!)
//        presentTouchBar(tb: (viewController?.touchBar)!, idf: AppDelegate.ident!)
    }
    @objc func createRaceSimTouchBar() {
        var tb = NSTouchBar()
        var fstb = RacingSimTouchBar()
        tb.delegate = fstb
        tb.defaultItemIdentifiers = [.carGearShifter, .carGasButton, .carBrakesButton]
        presentTouchBar(tb: tb, idf: AppDelegate.ident!)
//        presentTouchBar(tb: (viewController?.touchBar)!, idf: AppDelegate.ident!)
    }
    @objc func createBusSimTouchBar() {
        var tb = NSTouchBar()
        var fstb = BusSimTouchBar()
        tb.delegate = fstb
        tb.defaultItemIdentifiers = [.RearDoorButton, .frontDoorButton, .flexibleSpace, .LeftTurnSignalButton, .HazardLightButton, .RightTurnSignalButton, .flexibleSpace, .ParkingBrakeButton]
        presentTouchBar(tb: tb, idf: AppDelegate.ident!)
//        presentTouchBar(tb: (viewController?.touchBar)!, idf: AppDelegate.ident!)
    }
    
    @objc func presentTouchBar(tb: NSTouchBar, idf: NSTouchBarItem.Identifier) {
        NSTouchBar.presentSystemModalTouchBar(tb, systemTrayItemIdentifier: idf)
    }
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }


}
