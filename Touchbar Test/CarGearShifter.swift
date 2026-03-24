//
//  TrainThrottleControlButton.swift
//  Touchbar Test
//
//  Created by Mohamad Moukayed on 13/08/2024.
//

import Cocoa
import Carbon.HIToolbox.Events
import CoreHaptics


class CarGearShifter: NSStackView {
    public var slider: CarGearShifterSlider?
    private func setup() {
        self.orientation = .horizontal
        self.alignment = .centerY
        self.distribution = .fill
        let tempView = NSStackView()
        tempView.orientation = .horizontal
        tempView.alignment = .centerY
        tempView.distribution = .fillEqually
        let pImg = NSImageView(image: NSImage(systemSymbolName: "gearshift.layout.sixspeed", accessibilityDescription: "")!.withSymbolConfiguration(NSImage.SymbolConfiguration(hierarchicalColor: NSColor.systemGray))!)
        let label = NSTextField()
        label.isEditable = false
        label.stringValue = "P"
        label.textColor = NSColor.systemRed
        label.sizeToFit()
        label.font = NSFont(name: "SF Pro", size: 13.0)
        self.addView(slider!, in: NSStackView.Gravity.top)
        tempView.addView(pImg, in: NSStackView.Gravity.top)
        tempView.addView(label, in: NSStackView.Gravity.bottom)
        self.addView(tempView, in: NSStackView.Gravity.bottom)
        slider!.label = label
    }
    init(slider: CarGearShifterSlider) {
        super.init(frame: .zero)
        self.slider = slider
        setup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        // Custom setup code here.
        setup()
    }
}
