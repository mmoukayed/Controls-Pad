# Touchbar Test

A macOS menu bar application that provides custom Touch Bar controls for simulation games. Use your MacBook Pro's Touch Bar as a virtual control panel for flight simulators, train simulators, racing games, bus simulators, and traffic control games.

> **Note:** The Touch Bar is only available on MacBook Pro models from 2016–2021. Apple has since discontinued the Touch Bar on newer MacBook models.

## Requirements

- **macOS** 10.12.2 or later
- **Xcode** (for building)
- **MacBook Pro with Touch Bar** (2016–2021 models)

## Building the Project

1. Open `Touchbar Test.xcodeproj` in Xcode
2. Select your Mac as the build target
3. Press **⌘B** to build, or **⌘R** to build and run

The project uses the private `DFRFoundation` framework for system-level Touch Bar integration, which is included from your Mac's System library.

## How to Use

1. **Launch the app** — After building and running, the app runs in the menu bar (no main window).
2. **Open the menu** — Click the game controller icon in the menu bar (top-right of the screen).
3. **Choose a Touch Bar** — Select one of the available simulation modes:
   - **Show Flight Sim TouchBar**
   - **Show Train Sim TouchBar**
   - **Show Racing Sim TouchBar**
   - **Show Bus Sim TouchBar**
   - **Show Traffic Control TouchBar**
4. **Use the Touch Bar** — The selected control panel appears in your Mac's Touch Bar. Interact with the controls as needed.
5. **Switch modes** — Open the menu again and pick another Touch Bar layout at any time.
6. **Quit** — Choose **Quit** from the menu when finished.

## Available Touch Bar Modes

### Flight Sim TouchBar

Controls for flight simulation:

- **Engine** — Toggle engine on/off
- **Reverse** — Toggle reverse thrust
- **Alt Hold** — Toggle altitude hold
- **Throttle Up / Down** — Adjust throttle
- **Brakes** — Apply brakes

### Train Sim TouchBar

Controls for train simulation:

- **Door** — Open/close train doors
- **Throttle Up / Down** — Adjust train speed
- **AWS** — AWS (Automatic Warning System) brake

### Racing Sim TouchBar

Controls for racing games:

- **Gear Shifter** — Slider for gear selection (0–4)
- **Gas** — Accelerator
- **Brakes** — Brake pedal

### Bus Sim TouchBar

Controls for bus simulation:

- **Front Door** — Open/close front door
- **Rear Door** — Open/close rear door
- **Left / Right Turn Signal** — Turn indicators
- **Hazard Lights** — Hazard warning lights
- **Parking Brake** — Engage/release parking brake

### Traffic Control TouchBar

Controls for traffic light simulation:

- Four traffic light buttons for controlling intersection signals

## Project Structure

| File | Description |
|------|-------------|
| `AppDelegate.swift` | Menu bar setup and Touch Bar mode selection |
| `ViewController.swift` | Main view (keyboard simulation for flight controls) |
| `FlightSimTouchBar.swift` | Flight simulator Touch Bar layout |
| `TrainSimTouchBar.swift` | Train simulator Touch Bar layout |
| `RacingSimTouchBar.swift` | Racing simulator Touch Bar layout |
| `BusSimTouchBar.swift` | Bus simulator Touch Bar layout |
| `TrafficTouchBar.swift` | Traffic control Touch Bar layout |
| `*ControlButton.swift` | Custom button components for each simulation type |
| `TouchBar.h` | Bridge to private DFR/Control Strip APIs |

## Integration with Games

The buttons and controls are designed to work with simulation games that support keyboard input. The `ViewController` maps some flight controls to keypresses (e.g., E, R, Y). To use these Touch Bars with your favorite game:

1. Check the game’s key bindings.
2. Customize the button actions in the relevant Swift files to send the correct key codes or inputs your game expects.

---

## Adding Your Own Custom Simulator

You can add a new Touch Bar layout for any simulator (truck, boat, farming, etc.) by following these steps.

### Step 1: Create a new Touch Bar Swift file

Create a new file, e.g. `TruckSimTouchBar.swift`, and implement `NSTouchBarDelegate`:

```swift
import Cocoa
import Carbon.HIToolbox.Events

class TruckSimTouchBar: NSObject, NSTouchBarDelegate {
    func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier identifier: NSTouchBarItem.Identifier) -> NSTouchBarItem? {
        if identifier == .truckHornButton {
            let btn = TruckControlButton(title: "Horn", image: NSImage(systemSymbolName: "speaker.wave.2", accessibilityDescription: "")!, target: self, action: nil)
            btn.tag = 0
            btn.setButtonType(.momentaryPushIn)
            let item = NSCustomTouchBarItem(identifier: identifier)
            item.view = btn
            return item
        }
        // Add more controls...
        return nil
    }
}

// Define identifiers for each control
extension NSTouchBarItem.Identifier {
    static let truckHornButton = NSTouchBarItem.Identifier("com.example.TouchBar.truckHornButton")
}
```

### Step 2: Create a custom control button with keybinds

Create a new file, e.g. `TruckControlButton.swift`. Choose the behavior:

**Option A: Toggle button** (single tap sends key down + key up) — for toggles like lights or horns:

```swift
import Cocoa
import Carbon.HIToolbox.Events

class TruckControlButton: NSButton {
    override func touchesEnded(with event: NSEvent) {
        var keyCode: CGKeyCode
        switch self.tag {
        case 0: keyCode = CGKeyCode(kVK_ANSI_H)  // H for horn
        case 1: keyCode = CGKeyCode(kVK_ANSI_L)  // L for lights
        default: return
        }
        let keySource = CGEventSource(stateID: .hidSystemState)
        let keyDown = CGEvent(keyboardEventSource: keySource, virtualKey: keyCode, keyDown: true)
        let keyUp = CGEvent(keyboardEventSource: keySource, virtualKey: keyCode, keyDown: false)
        keyDown?.post(tap: .cghidEventTap)
        keyUp?.post(tap: .cghidEventTap)
        super.touchesEnded(with: event)
    }
}
```

**Option B: Hold button** (key down on press, key up on release) — for throttle, brakes, gas:

```swift
class TruckControlButton: NSButton {
    private var kc: CGKeyCode?
    private var ks: CGEventSource?
    private var kde: CGEvent?
    private var kue: CGEvent?

    override func touchesBegan(with event: NSEvent) {
        switch self.tag {
        case 0: kc = CGKeyCode(kVK_ANSI_W)  // W for accelerate
        case 1: kc = CGKeyCode(kVK_ANSI_S)  // S for brake
        default: return
        }
        ks = CGEventSource(stateID: .hidSystemState)
        kde = CGEvent(keyboardEventSource: ks, virtualKey: kc!, keyDown: true)
        kue = CGEvent(keyboardEventSource: ks, virtualKey: kc!, keyDown: false)
        kde?.post(tap: .cghidEventTap)
        super.touchesBegan(with: event)
    }

    override func touchesEnded(with event: NSEvent) {
        kue?.post(tap: .cghidEventTap)
        super.touchesEnded(with: event)
    }
}
```

### Step 3: Virtual key codes

Use `CGKeyCode` with constants from `Carbon.HIToolbox.Events`. Common ones:

| Key | Constant | Key | Constant |
|-----|----------|-----|----------|
| A–Z | `kVK_ANSI_A` … `kVK_ANSI_Z` | 0–9 | `kVK_ANSI_0` … `kVK_ANSI_9` |
| Space | `kVK_Space` | Return | `kVK_Return` |
| Escape | `kVK_Escape` | Tab | `kVK_Tab` |
| F1–F12 | `kVK_F1` … `kVK_F12` | | |

For other keys, search [Apple's HIToolbox documentation](https://developer.apple.com/documentation/coregraphics/1455264-virtual_key_codes) or inspect `Carbon.HIToolbox.Events` in Xcode.

### Step 4: Register in AppDelegate

1. Add a menu item in `applicationDidFinishLaunching`:

```swift
menu.addItem(NSMenuItem(title: "Show Truck Sim TouchBar", action: #selector(createTruckSimTouchBar), keyEquivalent: ""))
```

2. Add the presentation method:

```swift
@objc func createTruckSimTouchBar() {
    var tb = NSTouchBar()
    var tstb = TruckSimTouchBar()
    tb.delegate = tstb
    tb.defaultItemIdentifiers = [.truckHornButton, .flexibleSpace, .truckGasButton, .truckBrakesButton]
    presentTouchBar(tb: tb, idf: AppDelegate.ident!)
}
```

Use `.flexibleSpace` between items to add spacing.

### Step 5: Add files to the Xcode project

1. In Xcode, right‑click the **Touchbar Test** group → **Add Files to "Touchbar Test"...**
2. Select your new `.swift` files
3. Ensure they are checked under the app target

### Button types and existing components

| Use case | Existing class | Behavior |
|----------|----------------|----------|
| Toggle (tap = key press) | `FlightControlButton`, `BusDoorControlButton` | Tap sends key down + up |
| Hold (press and hold) | `ThrottleControlButton`, `CarControlButton`, `TrainThrottleControlButton` | Key down on touch, key up on release |
| Slider with discrete values | `CarGearShifter` + `CarGearShifterSlider` | Sends key events when value changes |
| Toggle with on/off state | `BusDoorControlButton` with `setButtonType(.onOff)` | Toggle switch style |

You can reuse these classes and change the `keyCode` values to match your game's keybinds, or subclass them for a new simulator.

### Quick reference: full flow

1. Create `MySimTouchBar.swift` — define identifiers, implement `touchBar(_:makeItemForIdentifier:)`.
2. Create `MySimControlButton.swift` (if needed) — override `touchesBegan`/`touchesEnded` with your key codes.
3. Add menu item and `createMySimTouchBar()` in `AppDelegate.swift`.
4. Add the Swift files to the Xcode project.

## License

Created by Mohamad Moukayed (2024).
