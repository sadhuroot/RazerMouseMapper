# Razer Mouse Mapper for macOS
![image-Photoroom](https://github.com/user-attachments/assets/94f3a322-a8d0-40d3-b570-f5e3b627549e)

<p align="center">
  <img src="https://img.shields.io/badge/Platform-macOS-blue.svg" alt="Platform">
  <img src="https://img.shields.io/badge/Language-Swift-orange.svg" alt="Language">
  <img src="https://img.shields.io/badge/Version-1.2-green.svg" alt="Version">
  <img src="https://img.shields.io/badge/License-MIT-purple.svg" alt="License">
</p>

A powerful and intuitive macOS application that allows you to fully customize and remap all buttons on your Razer mouse. Originally designed for the Razer DeathAdder V2, but compatible with most Razer mice and even generic mice.

## 🎯 Features

### Core Functionality
- **Complete Button Remapping**: Customize all mouse buttons including:
  - Left/Right/Middle click
  - Back/Forward buttons (Mouse4/Mouse5)
  - DPI Up/Down buttons
  - Scroll wheel actions

### Pre-configured Actions
- **System Controls**
  - Mission Control
  - Application Windows
  - Show Desktop
  - Launchpad
  - Spotlight Search

- **Media Controls**
  - Volume Up/Down
  - Mute
  - Play/Pause

- **Productivity**
  - Copy/Paste/Cut
  - Screenshot
  - Browser Back/Forward

- **Custom Shortcuts**
  - Create any keyboard shortcut combination
  - Visual shortcut recorder
  - Support for modifier keys (⌘, ⇧, ⌥, ⌃)

### Additional Features
- 🔍 **Debug Mode**: Identify button numbers for advanced configuration
- 🚀 **Launch at Login**: Optional auto-startup
- 📊 **Status Bar Integration**: Quick access from menu bar

## 📋 Requirements

- macOS 10.13 (High Sierra) or later
- Xcode Command Line Tools (for installation from source)
- Input Monitoring permissions (granted during first launch)

## 🚀 Installation

### Quick Install (Recommended)

1. **Download the installer script**:
   ```bash
   curl -O https://raw.githubusercontent.com/sadhuroot/razer-mouse-mapper/main/install_razer_mapper.sh
   ```

2. **Make it executable**:
   ```bash
   chmod +x install_razer_mapper.sh
   ```

3. **Run the installer**:
   ```bash
   ./install_razer_mapper.sh
   ```

4. **Follow the prompts** to:
   - Install to Applications folder (optional)
   - Launch the application
   - Grant necessary permissions

### Manual Installation

If you prefer to build from source:

```bash
# Clone the repository
git clone https://github.com/sadhuroot/razer-mouse-mapper.git
cd razer-mouse-mapper

# Run the installation script
./install_razer_mapper.sh
```

##  Usage

### First Launch

1. **Grant Permissions**: 
   - The app will request Input Monitoring permissions
   - Go to **System Preferences → Security & Privacy → Privacy → Input Monitoring**
   - Enable the checkbox for RazerMouseMapper

2. **Configure Your Buttons**:
   - Click the Razer icon in your menu bar
   - Select "Open Settings"
   - Choose actions for each button from the dropdown menus
   - Click "Apply" to save your configuration

<img width="448" alt="Screenshot 2025-05-24 at 17 25 45" src="https://github.com/user-attachments/assets/2467a267-c91c-4374-9472-4b2c734b0f41" />


### Button Detection

If you're unsure which button is which:

1. Click "Detect Buttons" in the settings window
2. Enable "Debug Mode"
3. Press any mouse button to see its number in a notification
4. Use this information to configure the correct button

### Custom Shortcuts

1. Select "Custom Shortcut" from any button's dropdown
2. Click the ⌘ button next to the dropdown
3. Press your desired key combination in the recorder window
4. Click "OK" to save

### Examples of Custom Shortcuts:
- `cmd+shift+a` - Select all
- `cmd+space` - Spotlight
- `ctrl+left` - Switch desktop left
- `F12` - Dashboard

## 🛡️ Permissions Explained

This app requires **Input Monitoring** permission to:
- Detect mouse button presses
- Intercept and remap button actions
- Provide system-wide functionality

Your privacy is important. The app:
- ✅ Only monitors mouse events
- ✅ Doesn't collect or transmit any data
- ✅ Runs entirely locally on your Mac
- ✅ Is open source for transparency


## 🔧 Troubleshooting

### App doesn't detect mouse clicks
1. Ensure Input Monitoring permission is granted
2. Restart the application
3. Try toggling the permission off and on in System Preferences

### Custom shortcuts not working
1. Verify the shortcut isn't already used by macOS or another app
2. Use the debug mode to confirm button presses are detected
3. Check that the shortcut syntax is correct (e.g., `cmd+shift+a`)

### Mouse not detected
- The app works with most mice, not just Razer
- Try unplugging and reconnecting your mouse
- Check if your mouse appears in System Information → USB



## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes:

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Built with Swift and native macOS APIs
- Icon design inspired by Razer's aesthetic
- Thanks to the macOS development community


---

<p align="center">
  Made with ❤️ by sadhuroot
</p>

<p align="center">
  If you find this tool useful, please ⭐ star the repository!
</p>
