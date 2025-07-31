# Rockstar Editor Script for FiveM/ESX

A comprehensive Rockstar Editor integration script for FiveM servers running the ESX framework.

## Features

- **Easy Access**: Open Rockstar Editor with a simple command or key press
- **Recording Controls**: Start and stop recording with notifications
- **Modern UI**: Clean menu interface using ox_lib
- **Customizable**: Easy configuration options
- **Sound Effects**: Optional sound feedback
- **Notifications**: User-friendly notifications for all actions
- **Quick Toggle**: Additional quick record toggle command

## Installation

1. Place the script in your server's resources folder
2. Add the following to your `server.cfg`:
   ```
   ensure Aiben_rockstareditor
   ```
3. Make sure you have the required dependencies:
   - `es_extended`
   - `ox_lib`

## Configuration

Edit `config.lua` to customize:

### Basic Settings
- `Config.Key`: Key to open the menu (default: "F3")
- `Config.Command`: Command to open the menu (default: "rockstar")

### Language
All text can be customized in the `Config.Language` table.

### Features
- `Config.EnableNotifications`: Enable/disable notifications
- `Config.EnableSoundEffects`: Enable/disable sound effects
- `Config.RequirePermission`: Enable permission system (optional)

## Usage

### Commands
- `/rockstar` - Open the main menu
- `/record` - Quick toggle recording (F4 key)

### Keys
- `F3` - Open Rockstar Editor menu
- `F4` - Quick record toggle

### Menu Options
1. **Start Recording** - Begin recording gameplay
2. **Stop Recording** - Stop and save the current recording
3. **Open Rockstar Editor** - Launch the Rockstar Editor interface

## Dependencies

- ESX Framework
- ox_lib (for menu interface)

## Files

- `fxmanifest.lua` - Resource manifest
- `config.lua` - Configuration file
- `client.lua` - Client-side script
- `server.lua` - Server-side script

## Changelog

### Version 1.0.0
- Initial release
- Menu-based Rockstar Editor access
- Recording controls
- Notification system
- Sound effects
- Quick record toggle
- English language support

## Support

For issues or questions, please check the configuration file and ensure all dependencies are properly installed. 
