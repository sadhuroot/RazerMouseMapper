#!/bin/bash

# Razer Mouse Mapper installation script
# Creates all necessary files and compiles the application

# Colored output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${GREEN}=== Creating Razer Mouse Button Mapper ===${NC}"
echo -e "${YELLOW}This script will create and install an app to configure your Razer DeathAdder V2 mouse buttons${NC}"

# Create project directory
PROJECT_DIR="$HOME/RazerMouseMapper"
echo -e "\n${YELLOW}Creating project directory at ${PROJECT_DIR}${NC}"

if [ -d "$PROJECT_DIR" ]; then
    echo -e "${RED}Project directory already exists. Delete it? (y/n)${NC}"
    read -r response
    if [ "$response" = "y" ]; then
        rm -rf "$PROJECT_DIR"
    else
        echo -e "${RED}Operation cancelled.${NC}"
        exit 1
    fi
fi

mkdir -p "$PROJECT_DIR"
cd "$PROJECT_DIR" || exit 1
mkdir -p "RazerMouseMapper.app/Contents/MacOS"
mkdir -p "RazerMouseMapper.app/Contents/Resources"

# Check for custom icon file
echo -e "\n${YELLOW}Checking for custom icon file...${NC}"
if [ -f "$HOME/Desktop/image-Photoroom.icns" ]; then
    echo -e "${GREEN}Found custom ICNS icon file! Using it...${NC}"
    cp "$HOME/Desktop/image-Photoroom.icns" "$PROJECT_DIR/RazerMouseMapper.app/Contents/Resources/razer_icon.icns"
elif [ -f "$HOME/Desktop/image-Photoroom.png" ]; then
    echo -e "${GREEN}Found custom PNG icon file! Using it...${NC}"
    cp "$HOME/Desktop/image-Photoroom.png" "$PROJECT_DIR/RazerMouseMapper.app/Contents/Resources/razer_icon.png"
else
    # Create the Razer Icon directly as PNG if custom icon not found
    echo -e "\n${YELLOW}Creating Razer mouse icon...${NC}"
    cat > "$PROJECT_DIR/razer_icon.txt" << 'EOL'
iVBORw0KGgoAAAANSUhEUgAAAQAAAAEACAYAAABccqhmAAAACXBIWXMAAAsTAAALEwEAmpwYAAAF
EmlUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0w
TXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRh
LyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNS42LWMxNDAgNzkuMTYwNDUxLCAyMDE3LzA1LzA2
LTAxOjA4OjIxICAgICAgICAiPiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3Jn
LzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0i
IiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtbG5zOmRjPSJodHRw
Oi8vcHVybC5vcmcvZGMvZWxlbWVudHMvMS4xLyIgeG1sbnM6cGhvdG9zaG9wPSJodHRwOi8vbnMu
YWRvYmUuY29tL3Bob3Rvc2hvcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNv
bS94YXAvMS4wL21tLyIgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9z
VHlwZS9SZXNvdXJjZUV2ZW50IyIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0Mg
KE1hY2ludG9zaCkiIHhtcDpDcmVhdGVEYXRlPSIyMDI1LTA1LTIxVDEwOjIwOjEwWiIgeG1wOk1v
ZGlmeURhdGU9IjIwMjUtMDUtMjFUMTA6MjE6NTNaIiB4bXA6TWV0YWRhdGFEYXRlPSIyMDI1LTA1
LTIxVDEwOjIxOjUzWiIgZGM6Zm9ybWF0PSJpbWFnZS9wbmciIHBob3Rvc2hvcDpDb2xvck1vZGU9
IjMiIHBob3Rvc2hvcDpJQ0NQcm9maWxlPSJzUkdCIElFQzYxOTY2LTIuMSIgeG1wTU06SW5zdGFu
Y2VJRD0ieG1wLmlpZDphZTQwZWY5ZS05YTM1LTRkNGYtOGZiMC1hNjc3OTkzYTVlOWUiIHhtcE1N
OkRvY3VtZW50SUQ9InhtcC5kaWQ6YWU0MGVmOWUtOWEzNS00ZDRmLThmYjAtYTY3Nzk5M2E1ZTll
IiB4bXBNTTpPcmlnaW5hbERvY3VtZW50SUQ9InhtcC5kaWQ6YWU0MGVmOWUtOWEzNS00ZDRmLThm
YjAtYTY3Nzk5M2E1ZTllIj4gPHhtcE1NOkhpc3Rvcnk+IDxyZGY6U2VxPiA8cmRmOmxpIHN0RXZ0
OmFjdGlvbj0iY3JlYXRlZCIgc3RFdnQ6aW5zdGFuY2VJRD0ieG1wLmlpZDphZTQwZWY5ZS05YTM1
LTRkNGYtOGZiMC1hNjc3OTkzYTVlOWUiIHN0RXZ0OndoZW49IjIwMjUtMDUtMjFUMTA6MjA6MTBa
IiBzdEV2dDpzb2Z0d2FyZUFnZW50PSJBZG9iZSBQaG90b3Nob3AgQ0MgKE1hY2ludG9zaCkiLz4g
PC9yZGY6U2VxPiA8L3htcE1NOkhpc3Rvcnk+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+
IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+GmNoAgAAE9VJREFUeJzt3X9wVNXdx/HPbo
IBwg9JIYkxkkUCAlKwMIiWxkoRFGQsQhVb/P0Dq1aLv9Bp1ZnO2GpHrVidOrVaW1sdi3bUovLDQX
6jUi2tqSBVCoJEEBYSIE0CSfe5f2y4DyHJ3rtn7zl3N+/XTMYHO3vvd8H7yTnnnj0nIyV72JqMYR
sAQ5UEPQAAwSEAAMMRAADjEQAA4xEAAOMRAADjEQAA4xEAAOMRAADjEQAA4xEAAOMRAADjEQAA4xEA
AOMRAADjEQAA4xEAAOMRAADjEQAA4xEAAOMRAADjEQAA4xEAAOMRAADjEQAA4xEAAOMRAADjEQAA4x
EAAOMRAADjEQAA4xEAAMMRAADjEQAA4xEAAOMRAADjEQAA4xEAAOMRAADjEQAA4xEAAOMRAADjEQAA
4xEAAOMRAADjEQAA4xEAAOMRAADjEQAA4xEAAOMRAADjEQAA4xEAAMMRAADjEQAA4xEAAMMRAADjEQ
AA4xEAAMMRAADjEQAA4xEAAOMRAADjEQAA4xEAAOMRAADjEQAA4xEAAMMRAADjEQAA4xEAAMMRAADj
EQAA4xEAAOMRAADjEQAA4xEAAOMRAADjEQAA4xEAAOMRAADjEQAA4xEAAMMRAADjEQAA4xEAAMMRQA
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
xGwXOwAAAABJRU5ErkJggg==
EOL

    # Convert Base64 to PNG
    base64 -D -i "$PROJECT_DIR/razer_icon.txt" -o "$PROJECT_DIR/RazerMouseMapper.app/Contents/Resources/razer_icon.png"
fi

# Create main.swift file
echo -e "\n${YELLOW}Creating source code...${NC}"
cat > "$PROJECT_DIR/RazerMouseMapper.swift" << 'EOL'
// RazerMouseMapper.swift
// A comprehensive app to remap all Razer DeathAdder V2 mouse buttons on macOS

import Cocoa
import Foundation
import IOKit
import IOKit.hid
import UserNotifications

// Global variables for event handling
var buttonMappings: [String: String] = [:]
var customShortcuts: [String: String] = [:]
var eventTap: CFMachPort?

// Debug mode: show button numbers when pressed
var debugMode = true

// Button mapping constants - these will be auto-detected
var BACK_BUTTON: Int64 = 3
var FORWARD_BUTTON: Int64 = 4

// Global callback function for event tap that doesn't capture context
func eventTapCallback(proxy: CGEventTapProxy, type: CGEventType, event: CGEvent, refcon: UnsafeMutableRawPointer?) -> Unmanaged<CGEvent>? {
    // Debug info for button detection
    if type == .otherMouseDown {
        let buttonNumber = event.getIntegerValueField(.mouseEventButtonNumber)
        NSLog("Button pressed: \(buttonNumber)")

        // Show button number in a notification if in debug mode
        if debugMode {
            let content = UNMutableNotificationContent()
            content.title = "Button Pressed"
            content.body = "Button number: \(buttonNumber)"
            let request = UNNotificationRequest(identifier: "buttonPress.\(Date().timeIntervalSince1970)", content: content, trigger: nil)
            UNUserNotificationCenter.current().add(request)
        }
    }

    // Handle mouse events
    if type == .otherMouseDown || type == .otherMouseUp {
        let buttonNumber = event.getIntegerValueField(.mouseEventButtonNumber)

        // Check button number and find corresponding action
        let actionKey: String
        switch buttonNumber {
        case 0: // Left click
            actionKey = "leftClickAction"
        case 1: // Right click
            actionKey = "rightClickAction"
        case 2: // Middle click (wheel)
            actionKey = "middleClickAction"
        case BACK_BUTTON: // Back button (usually 3)
            actionKey = "backButtonAction"
        case FORWARD_BUTTON: // Forward button (usually 4)
            actionKey = "forwardButtonAction"
        case 5: // DPI Up
            actionKey = "dpiUpAction"
        case 6: // DPI Down
            actionKey = "dpiDownAction"
        default:
            actionKey = "button\(buttonNumber)Action"
        }

        // Get the action from our in-memory mappings (faster than UserDefaults)
        if let action = buttonMappings[actionKey] {
            // Only handle on button down events (not up events)
            if type == .otherMouseDown {
                NSLog("Executing action: \(action) for button \(buttonNumber)")

                // Execute the configured action
                switch action {
                case "Mission Control":
                    simulateKeyPress(keyCode: 0x7A) // F3
                    return nil
                case "Application Windows":
                    simulateKeyPress(keyCode: 0x73, flags: [.maskCommand]) // Cmd+F3
                    return nil
                case "Desktop":
                    simulateKeyPress(keyCode: 0x76, flags: [.maskCommand]) // Cmd+F4
                    return nil
                case "Copy":
                    simulateKeyPress(keyCode: 0x08, flags: [.maskCommand]) // Cmd+C
                    return nil
                case "Paste":
                    simulateKeyPress(keyCode: 0x09, flags: [.maskCommand]) // Cmd+V
                    return nil
                case "Cut":
                    simulateKeyPress(keyCode: 0x07, flags: [.maskCommand]) // Cmd+X
                    return nil
                case "Clear":
                    simulateKeyPress(keyCode: 0x33, flags: []) // Delete
                    return nil
                case "Screenshot":
                    simulateKeyPress(keyCode: 0x04, flags: [.maskCommand, .maskShift]) // Cmd+Shift+4
                    return nil
                case "Volume Up":
                    simulateKeyPress(keyCode: 0x48) // Volume Up
                    return nil
                case "Volume Down":
                    simulateKeyPress(keyCode: 0x49) // Volume Down
                    return nil
                case "Mute":
                    simulateKeyPress(keyCode: 0x4A) // Mute
                    return nil
                case "Play/Pause":
                    simulateKeyPress(keyCode: 0x34, flags: [.maskControl]) // Control+Space
                    return nil
                case "Forward (Browser)":
                    simulateKeyPress(keyCode: 0x7C, flags: [.maskCommand]) // Cmd+Right
                    return nil
                case "Back (Browser)":
                    simulateKeyPress(keyCode: 0x7B, flags: [.maskCommand]) // Cmd+Left
                    return nil
                case "Spotlight":
                    simulateKeyPress(keyCode: 0x09, flags: [.maskCommand]) // Cmd+Space
                    return nil
                case "Launch Launchpad":
                    simulateKeyPress(keyCode: 0x52, flags: [.maskControl]) // Control+Fn+F4
                    return nil
                case "Custom Shortcut":
                    // Get the custom shortcut for this button
                    if let shortcutString = customShortcuts[actionKey], !shortcutString.isEmpty {
                        executeCustomShortcut(shortcutString)
                        return nil
                    }
                    return Unmanaged.passRetained(event)
                case "None": // Pass through the original click
                    return Unmanaged.passRetained(event)
                default:
                    break
                }
            }
        }
    } else if type == .scrollWheel {
        // Handle scroll wheel customization if needed
        if let action = buttonMappings["scrollWheelAction"],
           action != "Default" && action != "None" {
            // Here you could implement custom scroll wheel behavior
            if action == "Volume Control" {
                let deltaY = event.getIntegerValueField(.scrollWheelEventDeltaAxis1)
                if deltaY > 0 {
                    simulateKeyPress(keyCode: 0x48) // Volume Up
                } else if deltaY < 0 {
                    simulateKeyPress(keyCode: 0x49) // Volume Down
                }
                return nil
            }
        }
    }

    // Return the event unmodified for other buttons/events
    return Unmanaged.passRetained(event)
}

// Execute a custom keyboard shortcut from string representation
func executeCustomShortcut(_ shortcutString: String) {
    // Parse shortcut string format like "cmd+shift+a"
    let components = shortcutString.lowercased().components(separatedBy: "+")

    // Initialize flags
    var flags: CGEventFlags = []
    var keyCode: CGKeyCode = 0

    // Process the shortcut components
    for component in components {
        let trimmed = component.trimmingCharacters(in: .whitespacesAndNewlines)

        // Check for modifiers
        switch trimmed {
        case "cmd", "command", "⌘":
            flags.insert(.maskCommand)
        case "shift", "⇧":
            flags.insert(.maskShift)
        case "alt", "option", "⌥":
            flags.insert(.maskAlternate)
        case "ctrl", "control", "⌃":
            flags.insert(.maskControl)
        default:
            // Try to convert to key code - simplified for common keys
            if trimmed.count == 1 {
                let char = trimmed.uppercased().first!
                if char >= "A" && char <= "Z" {
                    keyCode = CGKeyCode(UInt8(char.asciiValue!) - UInt8(("A" as Character).asciiValue!)) + 0
                } else if char >= "0" && char <= "9" {
                    if char == "0" {
                        keyCode = 0x1D
                    } else {
                        keyCode = CGKeyCode(UInt8(char.asciiValue!) - UInt8(("1" as Character).asciiValue!)) + 0x12
                    }
                }
            } else {
                // Function keys and other special keys
                switch trimmed {
                case "f1": keyCode = 0x7A
                case "f2": keyCode = 0x78
                case "f3": keyCode = 0x63
                case "f4": keyCode = 0x76
                case "f5": keyCode = 0x60
                case "f6": keyCode = 0x61
                case "f7": keyCode = 0x62
                case "f8": keyCode = 0x64
                case "f9": keyCode = 0x65
                case "f10": keyCode = 0x6D
                case "f11": keyCode = 0x67
                case "f12": keyCode = 0x6F
                case "return", "enter": keyCode = 0x24
                case "tab": keyCode = 0x30
                case "space": keyCode = 0x31
                case "delete": keyCode = 0x33
                case "escape", "esc": keyCode = 0x35
                case "left": keyCode = 0x7B
                case "right": keyCode = 0x7C
                case "up": keyCode = 0x7E
                case "down": keyCode = 0x7D
                case "home": keyCode = 0x73
                case "end": keyCode = 0x77
                case "pageup": keyCode = 0x74
                case "pagedown": keyCode = 0x79
                default: break
                }
            }
        }
    }

    // Execute the shortcut
    if keyCode != 0 {
        simulateKeyPress(keyCode: keyCode, flags: flags)
    }
}

// Global function to simulate key press
func simulateKeyPress(keyCode: CGKeyCode, flags: CGEventFlags = []) {
    let keyDown = CGEvent(keyboardEventSource: nil, virtualKey: keyCode, keyDown: true)
    keyDown?.flags = flags
    keyDown?.post(tap: CGEventTapLocation.cghidEventTap)

    let keyUp = CGEvent(keyboardEventSource: nil, virtualKey: keyCode, keyDown: false)
    keyUp?.flags = flags
    keyUp?.post(tap: CGEventTapLocation.cghidEventTap)
}

class ShortcutRecorderView: NSView {
    var currentModifiers: NSEvent.ModifierFlags = []
    var currentKeyCode: UInt16 = 0
    var shortcutString: String = ""
    var actionCallback: ((String) -> Void)?

    override var acceptsFirstResponder: Bool {
        return true
    }

    override func keyDown(with event: NSEvent) {
        currentModifiers = event.modifierFlags.intersection(.deviceIndependentFlagsMask)
        currentKeyCode = event.keyCode
        updateShortcutString()

        // Notify about the new shortcut
        if let callback = actionCallback {
            callback(shortcutString)
        }
    }

    override func flagsChanged(with event: NSEvent) {
        currentModifiers = event.modifierFlags.intersection(.deviceIndependentFlagsMask)
        updateShortcutString()
    }

    private func updateShortcutString() {
        var components: [String] = []

        // Add modifier keys
        if currentModifiers.contains(.command) {
            components.append("cmd")
        }
        if currentModifiers.contains(.shift) {
            components.append("shift")
        }
        if currentModifiers.contains(.option) {
            components.append("alt")
        }
        if currentModifiers.contains(.control) {
            components.append("ctrl")
        }

        // Add the key if it's not just a modifier
        if currentKeyCode != 0 {
            // This is a simplified version - a real implementation would have a complete mapping
            let key: String
            if currentKeyCode >= 0 && currentKeyCode <= 25 {  // A-Z
                let ascii = UInt8(currentKeyCode) + UInt8(("a" as Character).asciiValue!)
                key = String(Character(UnicodeScalar(ascii)))
            } else if currentKeyCode >= 0x12 && currentKeyCode <= 0x1B {  // 1-9
                let number = Int(currentKeyCode) - 0x12 + 1
                key = "\(number)"
            } else if currentKeyCode == 0x1D {  // 0
                key = "0"
            } else {
                // Special keys
                switch currentKeyCode {
                case 0x24: key = "return"
                case 0x30: key = "tab"
                case 0x31: key = "space"
                case 0x33: key = "delete"
                case 0x35: key = "esc"
                case 0x7B: key = "left"
                case 0x7C: key = "right"
                case 0x7E: key = "up"
                case 0x7D: key = "down"
                default: key = "key\(currentKeyCode)"
                }
            }
            components.append(key)
        }

        shortcutString = components.joined(separator: "+")
    }
}

class CustomShortcutWindowController: NSWindowController, NSWindowDelegate {
    var shortcutView: ShortcutRecorderView!
    var shortcutTextField: NSTextField!
    var cancelButton: NSButton!
    var okButton: NSButton!
    var completionHandler: ((String?) -> Void)?

    convenience init() {
        // Create window
        let window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 400, height: 150),
            styleMask: [.titled, .closable],
            backing: .buffered,
            defer: false
        )
        window.title = "Set Custom Shortcut"
        window.center()

        self.init(window: window)
        window.delegate = self

        // Setup the window content
        setupUI()
    }

    func setupUI() {
        guard let window = self.window, let contentView = window.contentView else { return }

        // Instructions label
        let instructionsLabel = NSTextField(labelWithString: "Press the key combination:")
        instructionsLabel.frame = NSRect(x: 20, y: 110, width: 360, height: 20)
        contentView.addSubview(instructionsLabel)

        // Shortcut recorder view - this will capture the key events
        shortcutView = ShortcutRecorderView(frame: NSRect(x: 20, y: 70, width: 360, height: 30))
        shortcutView.wantsLayer = true
        shortcutView.layer?.backgroundColor = NSColor.lightGray.withAlphaComponent(0.3).cgColor
        shortcutView.layer?.cornerRadius = 5.0
        shortcutView.actionCallback = { [weak self] shortcutString in
            self?.shortcutTextField.stringValue = shortcutString
        }
        contentView.addSubview(shortcutView)

        // Text field to display the current shortcut
        shortcutTextField = NSTextField(frame: NSRect(x: 20, y: 40, width: 360, height: 22))
        shortcutTextField.isEditable = false
        shortcutTextField.isBezeled = true
        contentView.addSubview(shortcutTextField)

        // Cancel button
        cancelButton = NSButton(frame: NSRect(x: 200, y: 10, width: 80, height: 24))
        cancelButton.title = "Cancel"
        cancelButton.bezelStyle = .rounded
        cancelButton.target = self
        cancelButton.action = #selector(cancelAction)
        contentView.addSubview(cancelButton)

        // OK button
        okButton = NSButton(frame: NSRect(x: 300, y: 10, width: 80, height: 24))
        okButton.title = "OK"
        okButton.bezelStyle = .rounded
        okButton.target = self
        okButton.action = #selector(okAction)
        contentView.addSubview(okButton)

        // Make shortcut view the first responder
        window.makeFirstResponder(shortcutView)
    }

    @objc func cancelAction() {
        if let handler = completionHandler {
            handler(nil)
        }
        close()
    }

    @objc func okAction() {
        if let handler = completionHandler {
            handler(shortcutTextField.stringValue)
        }
        close()
    }

    func windowWillClose(_ notification: Notification) {
        if let handler = completionHandler, shortcutTextField.stringValue.isEmpty {
            handler(nil)
        }
    }

    func showShortcutRecorder(completionHandler: @escaping (String?) -> Void) {
        self.completionHandler = completionHandler
        self.window?.makeKeyAndOrderFront(nil)
        NSApp.activate(ignoringOtherApps: true)
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    var window: NSWindow!
    var statusItem: NSStatusItem!
    var deviceManager: RazerDeviceManager!

    // Configuration UI elements
    var buttonPopups: [String: NSPopUpButton] = [:]
    var shortcutButtons: [String: NSButton] = [:]
    var statusLabel: NSTextField!
    var debugSwitch: NSButton!

    // Shortcut recorder window controller
    var shortcutRecorder: CustomShortcutWindowController!

    // Properties for detecting button numbers
    var detectingButtons = false
    var detectedButtonNumbers: [Int: String] = [:]

    // Property for auto startup
    var autoStartupEnabled = false

    func applicationDidFinishLaunching(_ notification: Notification) {
        // Request permission for notifications
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { _, _ in }

        deviceManager = RazerDeviceManager()
        deviceManager.findRazerDevices()

        // Create shortcut recorder
        shortcutRecorder = CustomShortcutWindowController()

        // Create status bar item with custom icon
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
        if let button = statusItem.button {
            // Load icon from resources
            if let iconPath = Bundle.main.path(forResource: "razer_icon", ofType: "png") {
                let image = NSImage(contentsOfFile: iconPath)
                image?.size = NSSize(width: 18, height: 18)
                button.image = image
            } else {
                // Fallback to drawing a basic icon
                let iconImage = NSImage(size: NSSize(width: 18, height: 18))
                iconImage.lockFocus()

                // Draw mouse shape
                let bezierPath = NSBezierPath()
                bezierPath.move(to: NSPoint(x: 9, y: 2))
                bezierPath.line(to: NSPoint(x: 4, y: 5))
                bezierPath.line(to: NSPoint(x: 4, y: 13))
                bezierPath.line(to: NSPoint(x: 14, y: 13))
                bezierPath.line(to: NSPoint(x: 14, y: 5))
                bezierPath.line(to: NSPoint(x: 9, y: 2))
                bezierPath.close()

                // Fill with white color
                NSColor.white.setFill()
                bezierPath.fill()

                // Draw scroll wheel
                let wheelPath = NSBezierPath()
                wheelPath.move(to: NSPoint(x: 9, y: 11))
                wheelPath.line(to: NSPoint(x: 9, y: 7))
                NSColor.lightGray.setStroke()
                wheelPath.lineWidth = 1.5
                wheelPath.stroke()

                iconImage.unlockFocus()
                button.image = iconImage
            }

            // Create a menu for the status item
            let menu = NSMenu()
            menu.addItem(NSMenuItem(title: "Open Settings", action: #selector(toggleWindow), keyEquivalent: ""))
            menu.addItem(NSMenuItem.separator())
            menu.addItem(NSMenuItem(title: "Quit", action: #selector(quitApp), keyEquivalent: "q"))

            statusItem.menu = menu
        }

        createWindow()

        // Load initial button mappings from UserDefaults
        updateButtonMappings()

        // Install event tap immediately to handle mouse buttons
        deviceManager.applyButtonSettings()

        // Check auto startup setting
        checkAutoStartup()

        // Show confirmation when app is fully loaded
        showNotification(title: "Razer Mouse Mapper", message: "App is running and ready to use")

        // Request input monitoring permission if needed
        requestInputMonitoringPermission()
    }

    func createWindow() {
        // Create window
        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 380, height: 490),
            styleMask: [.titled, .closable, .miniaturizable],
            backing: .buffered,
            defer: false
        )
        window.title = "Razer Mouse Button Mapper"
        window.center()
        window.isReleasedWhenClosed = false
        if #available(macOS 10.14, *) {
            window.appearance = NSAppearance(named: .darkAqua)
        }

        // Create content view with more height for additional buttons
        let contentView = NSView(frame: NSRect(x: 0, y: 0, width: 380, height: 490))

        // Button configurations - with correct labels
        let buttonConfigs = [
            ("Left Click", "leftClickAction", NSRect(x: 20, y: 450, width: 120, height: 20)),
            ("Right Click", "rightClickAction", NSRect(x: 20, y: 420, width: 120, height: 20)),
            ("Middle Click", "middleClickAction", NSRect(x: 20, y: 390, width: 120, height: 20)),
            ("Back Button (Mouse4)", "backButtonAction", NSRect(x: 20, y: 360, width: 140, height: 20)),
            ("Forward Button (Mouse5)", "forwardButtonAction", NSRect(x: 20, y: 330, width: 140, height: 20)),
            ("DPI Up", "dpiUpAction", NSRect(x: 20, y: 300, width: 120, height: 20)),
            ("DPI Down", "dpiDownAction", NSRect(x: 20, y: 270, width: 120, height: 20)),
            ("Scroll Wheel", "scrollWheelAction", NSRect(x: 20, y: 240, width: 120, height: 20))
        ]

        // Create labels and popups for each button
        for (labelText, actionKey, frame) in buttonConfigs {
            let label = NSTextField(labelWithString: "\(labelText):")
            label.frame = frame
            contentView.addSubview(label)

            let popup = NSPopUpButton(frame: NSRect(x: 170, y: frame.origin.y, width: 180, height: 20))

            // Add appropriate actions based on the button type
            if actionKey == "scrollWheelAction" {
                popup.addItems(withTitles: getScrollWheelActions())
            } else {
                popup.addItems(withTitles: getAvailableActions())
            }

            // Set current value from user defaults or default
            if let savedAction = UserDefaults.standard.string(forKey: actionKey) {
                popup.selectItem(withTitle: savedAction)
            } else {
                // Set default values based on button type
                let defaultAction: String
                switch actionKey {
                case "leftClickAction": defaultAction = "None"
                case "rightClickAction": defaultAction = "None"
                case "middleClickAction": defaultAction = "None"
                case "backButtonAction": defaultAction = "Back (Browser)" // Back button (Mouse4)
                case "forwardButtonAction": defaultAction = "Forward (Browser)" // Forward button (Mouse5)
                case "dpiUpAction": defaultAction = "Volume Up"
                case "dpiDownAction": defaultAction = "Volume Down"
                case "scrollWheelAction": defaultAction = "Default"
                default: defaultAction = "None"
                }
                popup.selectItem(withTitle: defaultAction)
                UserDefaults.standard.set(defaultAction, forKey: actionKey)
            }

            // Add action
            popup.action = #selector(buttonActionChanged(_:))
            popup.target = self

            // Store reference and add to view
            buttonPopups[actionKey] = popup
            contentView.addSubview(popup)

            // Add a "Set Shortcut" button for Custom Shortcut option
            let shortcutButton = NSButton(frame: NSRect(x: 350, y: frame.origin.y, width: 25, height: 20))
            shortcutButton.bezelStyle = .roundRect
            shortcutButton.title = "⌘"
            shortcutButton.isEnabled = (popup.titleOfSelectedItem == "Custom Shortcut")
            shortcutButton.action = #selector(showShortcutRecorder(_:))
            shortcutButton.target = self
            shortcutButton.tag = buttonConfigs.firstIndex(where: { $0.1 == actionKey }) ?? 0
            contentView.addSubview(shortcutButton)

            shortcutButtons[actionKey] = shortcutButton
        }

        // Button Detection switch
        let detectLabel = NSTextField(labelWithString: "Debug Mode:")
        detectLabel.frame = NSRect(x: 20, y: 210, width: 120, height: 20)
        contentView.addSubview(detectLabel)

        debugSwitch = NSButton(checkboxWithTitle: "Show button numbers", target: self, action: #selector(toggleDebugMode(_:)))
        debugSwitch.frame = NSRect(x: 150, y: 210, width: 200, height: 20)
        debugSwitch.state = debugMode ? .on : .off
        contentView.addSubview(debugSwitch)

        // Auto Start checkbox
        let autoStartLabel = NSTextField(labelWithString: "Auto Start:")
        autoStartLabel.frame = NSRect(x: 20, y: 180, width: 120, height: 20)
        contentView.addSubview(autoStartLabel)

        let autoStartSwitch = NSButton(checkboxWithTitle: "Launch at login", target: self, action: #selector(toggleAutoStart(_:)))
        autoStartSwitch.frame = NSRect(x: 150, y: 180, width: 200, height: 20)
        autoStartSwitch.state = checkIfAutoStartEnabled() ? .on : .off
        contentView.addSubview(autoStartSwitch)

        // Apply button
        let applyButton = NSButton(frame: NSRect(x: 140, y: 120, width: 100, height: 30))
        applyButton.title = "Apply"
        applyButton.bezelStyle = .rounded
        applyButton.action = #selector(applySettings)
        contentView.addSubview(applyButton)

        // Help button for button detection
        let helpButton = NSButton(frame: NSRect(x: 20, y: 120, width: 100, height: 30))
        helpButton.title = "Detect Buttons"
        helpButton.bezelStyle = .rounded
        helpButton.action = #selector(startButtonDetection)
        contentView.addSubview(helpButton)

        // Status label
        statusLabel = NSTextField(labelWithString: "Device: " + (deviceManager.foundDevice ? "Connected" : "Not Found"))
        statusLabel.frame = NSRect(x: 20, y: 70, width: 340, height: 20)
        statusLabel.alignment = .center
        statusLabel.textColor = deviceManager.foundDevice ? .systemGreen : .systemRed
        contentView.addSubview(statusLabel)

        // Version label
        let versionLabel = NSTextField(labelWithString: "Version 1.2 - Made by sadhuroot")
        versionLabel.frame = NSRect(x: 20, y: 40, width: 340, height: 20)
        versionLabel.alignment = .center
        versionLabel.textColor = .lightGray
        versionLabel.font = NSFont.systemFont(ofSize: 10)
        contentView.addSubview(versionLabel)

        window.contentView = contentView
    }

    func checkIfAutoStartEnabled() -> Bool {
        // Simplified version that checks if the app is in login items
        // This avoids the LSSharedFileList API which is deprecated

        // Get the current login items using NSAppleScript
        let script = """
            tell application "System Events"
                get the name of every login item
            end tell
            """

        let appleScript = NSAppleScript(source: script)
        var error: NSDictionary?
        if let result = appleScript?.executeAndReturnError(&error).stringValue {
            // Get our app name
            let appName = (Bundle.main.bundlePath as NSString).lastPathComponent

            // Check if our app is in the list
            return result.contains(appName)
        }

        return false
    }

    @objc func toggleAutoStart(_ sender: NSButton) {
        let isEnabled = sender.state == .on

        // Get our app path
        let appPath = Bundle.main.bundlePath

        let script: String
        if isEnabled {
            // Add to login items
            script = """
                tell application "System Events"
                    make new login item at end with properties {path:"\(appPath)", hidden:false}
                end tell
                """
        } else {
            // Remove from login items
            script = """
                tell application "System Events"
                    delete login item "\((appPath as NSString).lastPathComponent)"
                end tell
                """
        }

        let appleScript = NSAppleScript(source: script)
        var error: NSDictionary?
        appleScript?.executeAndReturnError(&error)

        if error != nil {
            NSLog("Error toggling auto start: \(error!)")
            // Revert the checkbox state
            sender.state = isEnabled ? .off : .on
        } else {
            showNotification(
                title: isEnabled ? "Auto Start Enabled" : "Auto Start Disabled",
                message: isEnabled ? "App will launch at login" : "App will not launch at login"
            )
        }
    }

    func checkAutoStartup() {
        autoStartupEnabled = checkIfAutoStartEnabled()
    }

    @objc func showShortcutRecorder(_ sender: NSButton) {
        // Find which button this is for
        guard let index = buttonConfigs.indices.first(where: { $0 == sender.tag }) else { return }
        let actionKey = buttonConfigs[index].1

        // Show the shortcut recorder
        shortcutRecorder.showShortcutRecorder { [weak self] shortcut in
            guard let self = self, let shortcut = shortcut else { return }

            // Save the shortcut
            customShortcuts[actionKey] = shortcut
            UserDefaults.standard.set(shortcut, forKey: "\(actionKey)_shortcut")

            // Show feedback
            self.showNotification(title: "Custom Shortcut Set", message: "Shortcut \(shortcut) set for \(self.buttonConfigs[index].0)")
        }
    }

    @objc func toggleDebugMode(_ sender: NSButton) {
        debugMode = (sender.state == .on)
        NSLog("Debug mode: \(debugMode ? "ON" : "OFF")")

        if debugMode {
            showNotification(title: "Debug Mode Enabled", message: "Press mouse buttons to see their numbers")
        }
    }

    @objc func startButtonDetection() {
        detectingButtons = true
        showNotification(title: "Button Detection", message: "Press the buttons on your mouse to see their numbers")

        statusLabel.stringValue = "Press mouse buttons to detect. ESC to finish."

        // Start listening for button presses
        debugMode = true
        debugSwitch.state = .on
    }

    @objc func buttonActionChanged(_ sender: NSPopUpButton) {
        // Find which button this popup belongs to
        for (key, popup) in buttonPopups {
            if popup == sender {
                let selectedAction = sender.titleOfSelectedItem ?? "None"
                NSLog("\(key) changed to: \(selectedAction)")
                UserDefaults.standard.set(selectedAction, forKey: key)

                // Enable/disable shortcut button based on selection
                if let shortcutButton = shortcutButtons[key] {
                    shortcutButton.isEnabled = (selectedAction == "Custom Shortcut")
                }
                break
            }
        }
    }

    @objc func toggleWindow() {
        if window.isVisible {
            window.orderOut(nil)
        } else {
            window.makeKeyAndOrderFront(nil)
            NSApplication.shared.activate(ignoringOtherApps: true)
        }
    }

    @objc func quitApp() {
        NSApplication.shared.terminate(nil)
    }

    @objc func applySettings() {
        // Save all current popup selections to user defaults
        for (key, popup) in buttonPopups {
            if let selectedAction = popup.titleOfSelectedItem {
                UserDefaults.standard.set(selectedAction, forKey: key)
            }
        }

        // Update in-memory mappings
        updateButtonMappings()

        // Apply the settings (reinstall event tap)
        deviceManager.applyButtonSettings()

        // Show notification
        showNotification(title: "Settings Applied", message: "Mouse button settings have been updated")

        // Show feedback in app
        let originalColor = statusLabel.textColor
        statusLabel.stringValue = "Settings applied successfully!"
        statusLabel.textColor = .systemGreen

        // Reset status message after 2 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.statusLabel.stringValue = "Device: " + (self.deviceManager.foundDevice ? "Connected" : "Not Found")
            self.statusLabel.textColor = originalColor
        }
    }

    func updateButtonMappings() {
        // Clear existing mappings
        buttonMappings.removeAll()
        customShortcuts.removeAll()

        // Load all button mappings into memory for faster access
        let buttonTypes = ["leftClickAction", "rightClickAction", "middleClickAction",
                          "backButtonAction", "forwardButtonAction", "dpiUpAction",
                          "dpiDownAction", "scrollWheelAction"]

        for buttonType in buttonTypes {
            let action = UserDefaults.standard.string(forKey: buttonType) ?? "None"
            buttonMappings[buttonType] = action
            NSLog("Loaded mapping: \(buttonType) -> \(action)")

            // Load custom shortcut if needed
            if action == "Custom Shortcut" {
                if let shortcut = UserDefaults.standard.string(forKey: "\(buttonType)_shortcut") {
                    customShortcuts[buttonType] = shortcut
                    NSLog("Loaded custom shortcut: \(buttonType) -> \(shortcut)")
                }
            }
        }
    }

    func showNotification(title: String, message: String) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = message
        content.sound = UNNotificationSound.default

        let request = UNNotificationRequest(identifier: "com.razer.mousemapper.\(Date().timeIntervalSince1970)", content: content, trigger: nil)
        UNUserNotificationCenter.current().add(request)
    }

    func requestInputMonitoringPermission() {
        // Check if we have permission and request if needed
        let options = [kAXTrustedCheckOptionPrompt.takeRetainedValue() as String: true]
        let trusted = AXIsProcessTrustedWithOptions(options as CFDictionary)

        if !trusted {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.showNotification(title: "Permission Required", message: "Please enable Input Monitoring permission in System Settings")

                // Try to open Security settings directly
                let url = URL(string: "x-apple.systempreferences:com.apple.preference.security?Privacy_ListenEvent")
                if let url = url {
                    NSWorkspace.shared.open(url)
                }
            }
        }
    }

    // Button configurations array
    lazy var buttonConfigs: [(String, String, NSRect)] = [
        ("Left Click", "leftClickAction", NSRect(x: 20, y: 450, width: 120, height: 20)),
        ("Right Click", "rightClickAction", NSRect(x: 20, y: 420, width: 120, height: 20)),
        ("Middle Click", "middleClickAction", NSRect(x: 20, y: 390, width: 120, height: 20)),
        ("Back Button (Mouse4)", "backButtonAction", NSRect(x: 20, y: 360, width: 140, height: 20)),
        ("Forward Button (Mouse5)", "forwardButtonAction", NSRect(x: 20, y: 330, width: 140, height: 20)),
        ("DPI Up", "dpiUpAction", NSRect(x: 20, y: 300, width: 120, height: 20)),
        ("DPI Down", "dpiDownAction", NSRect(x: 20, y: 270, width: 120, height: 20)),
        ("Scroll Wheel", "scrollWheelAction", NSRect(x: 20, y: 240, width: 120, height: 20))
    ]

    func getAvailableActions() -> [String] {
        return [
            "None",
            "Mission Control",
            "Application Windows",
            "Desktop",
            "Dashboard",
            "Launchpad",
            "Forward (Browser)",
            "Back (Browser)",
            "Copy",
            "Paste",
            "Cut",
            "Clear",
            "Play/Pause",
            "Volume Up",
            "Volume Down",
            "Mute",
            "Spotlight",
            "Screenshot",
            "Launch Launchpad",
            "Custom Shortcut"
        ]
    }

    func getScrollWheelActions() -> [String] {
        return [
            "Default",
            "Volume Control",
            "None"
        ]
    }
}

class RazerDeviceManager {
    var foundDevice = false
    var deviceHandle: IOHIDDevice?

    func findRazerDevices() {
        let managerRef = IOHIDManagerCreate(kCFAllocatorDefault, IOOptionBits(0))
        IOHIDManagerSetDeviceMatching(managerRef, createDeviceMatchDictionary())
        IOHIDManagerScheduleWithRunLoop(managerRef, CFRunLoopGetCurrent(), CFRunLoopMode.defaultMode.rawValue)
        IOHIDManagerOpen(managerRef, IOOptionBits(0))

        if let devices = IOHIDManagerCopyDevices(managerRef) as? Set<IOHIDDevice> {
            for device in devices {
                let vendorID = IOHIDDeviceGetProperty(device, "VendorID" as CFString) as? Int ?? 0
                let productID = IOHIDDeviceGetProperty(device, "ProductID" as CFString) as? Int ?? 0
                let productName = IOHIDDeviceGetProperty(device, kIOHIDProductKey as CFString) as? String ?? "Unknown"

                NSLog("Found device: \(productName) (VendorID: \(vendorID), ProductID: \(productID))")

                // Razer's VendorID is 0x1532
                if vendorID == 0x1532 {
                    NSLog("Found Razer device: \(productName) (ProductID: \(productID))")

                    // DeathAdder V2 ProductID is 0x0084, but also detect other Razer mice
                    if productName.contains("Razer") || productName.contains("DeathAdder") {
                        NSLog("Found Razer mouse: \(productName)!")
                        foundDevice = true
                        deviceHandle = device
                        break
                    }
                }
            }
        }

        // If no Razer mouse is found, try to detect any mouse
        if !foundDevice {
            let genericManagerRef = IOHIDManagerCreate(kCFAllocatorDefault, IOOptionBits(0))
            let genericCriteria = [
                kIOHIDDeviceUsagePageKey: kHIDPage_GenericDesktop,
                kIOHIDDeviceUsageKey: kHIDUsage_GD_Mouse
            ] as [CFString: Any]

            IOHIDManagerSetDeviceMatching(genericManagerRef, genericCriteria as CFDictionary)
            IOHIDManagerScheduleWithRunLoop(genericManagerRef, CFRunLoopGetCurrent(), CFRunLoopMode.defaultMode.rawValue)
            IOHIDManagerOpen(genericManagerRef, IOOptionBits(0))

            if let devices = IOHIDManagerCopyDevices(genericManagerRef) as? Set<IOHIDDevice> {
                if let device = devices.first {
                    let productName = IOHIDDeviceGetProperty(device, kIOHIDProductKey as CFString) as? String ?? "Generic Mouse"
                    NSLog("Found generic mouse: \(productName)")
                    foundDevice = true
                    deviceHandle = device
                }
            }
        }
    }

    func createDeviceMatchDictionary() -> CFDictionary {
        let criteria = [
            kIOHIDDeviceUsagePageKey: kHIDPage_GenericDesktop,
            kIOHIDDeviceUsageKey: kHIDUsage_GD_Mouse
        ] as [CFString: Any]

        return criteria as CFDictionary
    }

    func applyButtonSettings() {
        // Remove existing event tap if there is one
        if let existingTap = eventTap {
            CGEvent.tapEnable(tap: existingTap, enable: false)
            NSLog("Removed existing event tap")
        }

        setupEventTap()
    }

    func setupEventTap() {
        // This function installs a CGEventTap to intercept mouse events
        // and remap the buttons according to the user's preferences

        let eventMask = (1 << CGEventType.otherMouseDown.rawValue) |
                        (1 << CGEventType.otherMouseUp.rawValue) |
                        (1 << CGEventType.leftMouseDown.rawValue) |
                        (1 << CGEventType.leftMouseUp.rawValue) |
                        (1 << CGEventType.rightMouseDown.rawValue) |
                        (1 << CGEventType.rightMouseUp.rawValue) |
                        (1 << CGEventType.scrollWheel.rawValue)

        // Use the global callback function that doesn't capture context
        guard let newEventTap = CGEvent.tapCreate(
            tap: .cghidEventTap,
            place: .headInsertEventTap,
            options: .defaultTap,
            eventsOfInterest: CGEventMask(eventMask),
            callback: eventTapCallback,
            userInfo: nil
        ) else {
            NSLog("Failed to create event tap")

            // Show notification about failed event tap
            let content = UNMutableNotificationContent()
            content.title = "Permission Error"
            content.body = "Cannot create event tap. Please check Input Monitoring permissions."
            content.sound = UNNotificationSound.default
            let request = UNNotificationRequest(identifier: "eventTapError", content: content, trigger: nil)
            UNUserNotificationCenter.current().add(request)

            return
        }

        // Store the event tap reference globally
        eventTap = newEventTap

        let runLoopSource = CFMachPortCreateRunLoopSource(kCFAllocatorDefault, newEventTap, 0)
        CFRunLoopAddSource(CFRunLoopGetCurrent(), runLoopSource, .commonModes)
        CGEvent.tapEnable(tap: newEventTap, enable: true)
        NSLog("Event tap installed for mouse button remapping")

        // Debug current mappings
        NSLog("Current button mappings:")
        for (key, value) in buttonMappings {
            NSLog("  \(key): \(value)")
        }
    }
}

// Main entry point
let app = NSApplication.shared
let delegate = AppDelegate()
app.delegate = delegate
app.run()
EOL

# Create Info.plist with high-resolution icon settings
echo -e "\n${YELLOW}Creating Info.plist...${NC}"
cat > "$PROJECT_DIR/RazerMouseMapper.app/Contents/Info.plist" << 'EOL'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>CFBundleExecutable</key>
    <string>RazerMouseMapper</string>
    <key>CFBundleIdentifier</key>
    <string>com.razer.mousemapper</string>
    <key>CFBundleName</key>
    <string>RazerMouseMapper</string>
    <key>CFBundleDisplayName</key>
    <string>Razer Mouse Mapper</string>
    <key>CFBundleInfoDictionaryVersion</key>
    <string>6.0</string>
    <key>CFBundlePackageType</key>
    <string>APPL</string>
    <key>CFBundleShortVersionString</key>
    <string>1.2</string>
    <key>CFBundleVersion</key>
    <string>3</string>
    <key>NSPrincipalClass</key>
    <string>NSApplication</string>
    <key>NSHighResolutionCapable</key>
    <true/>
    <key>LSUIElement</key>
    <true/>
    <key>NSSupportsAutomaticTermination</key>
    <true/>
    <key>NSSupportsSuddenTermination</key>
    <true/>
    <key>NSAppleEventsUsageDescription</key>
    <string>This app needs to control other apps to execute your custom shortcuts</string>
    <key>NSInputMonitoringUsageDescription</key>
    <string>This app needs to monitor input to detect and remap your mouse buttons</string>
    <key>NSDesktopFolderUsageDescription</key>
    <string>This app needs access to the Desktop folder to save configuration files</string>
    <key>NSAppleScriptEnabled</key>
    <true/>
    <key>LSApplicationCategoryType</key>
    <string>public.app-category.utilities</string>
    <key>CFBundleIconFile</key>
    <string>razer_icon</string>
</dict>
</plist>
EOL

# Compile the application
echo -e "\n${YELLOW}Compiling the application...${NC}"
cd "$PROJECT_DIR" || exit 1
swiftc -o "RazerMouseMapper.app/Contents/MacOS/RazerMouseMapper" RazerMouseMapper.swift

# Check if compilation was successful
if [ $? -eq 0 ]; then
    echo -e "\n${GREEN}Application compiled successfully!${NC}"

    # Set execution permissions
    chmod +x "RazerMouseMapper.app/Contents/MacOS/RazerMouseMapper"

    # Create launch script
    cat > "$PROJECT_DIR/launch_razer_mapper.sh" << 'EOL'
#!/bin/bash
# Script to launch Razer Mouse Mapper
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
killall RazerMouseMapper 2>/dev/null
sleep 1
open "$SCRIPT_DIR/RazerMouseMapper.app"
EOL
    chmod +x "$PROJECT_DIR/launch_razer_mapper.sh"

    echo -e "\n${GREEN}========== INSTALLATION COMPLETE ===========${NC}"
    echo -e "${YELLOW}Application created at: ${NC}$PROJECT_DIR/RazerMouseMapper.app"
    echo -e "${YELLOW}To launch the application, run:${NC}"
    echo -e "  cd $PROJECT_DIR"
    echo -e "  ./launch_razer_mapper.sh"
    echo ""
    echo -e "${RED}IMPORTANT: The app will automatically request permissions${NC}"
    echo -e "${RED}to input monitoring in macOS Security & Privacy settings.${NC}"

    # Create a copy in Applications folder for better integration
    echo -e "\n${YELLOW}Would you like to copy the app to your Applications folder? (y/n)${NC}"
    read -r response
    if [ "$response" = "y" ]; then
        echo -e "${YELLOW}Copying to Applications folder...${NC}"
        cp -R "$PROJECT_DIR/RazerMouseMapper.app" "/Applications/"
        echo -e "${GREEN}Application copied to Applications folder.${NC}"
        echo -e "${YELLOW}You can now launch it from Launchpad.${NC}"
    fi

    # Auto-launch app and open permissions
    echo -e "\n${YELLOW}Launch the app now? (y/n)${NC}"
    read -r response
    if [ "$response" = "y" ]; then
        echo -e "${YELLOW}Launching app...${NC}"
        open "$PROJECT_DIR/RazerMouseMapper.app"

        # Open Security & Privacy settings after a short delay
        echo -e "${YELLOW}Opening Security & Privacy settings in 2 seconds...${NC}"
        (
          sleep 2
          open "x-apple.systempreferences:com.apple.preference.security?Privacy_ListenEvent"
        ) &
    fi
else
    echo -e "\n${RED}Error compiling the application!${NC}"
    echo -e "${YELLOW}Make sure you have the necessary development tools installed:${NC}"
    echo "  xcode-select --install"
    exit 1
fi
