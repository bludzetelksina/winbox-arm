#!/bin/bash
# macOS Cross-Compilation Script for WinBox ARM

set -e

echo "Cross-compiling WinBox ARM for macOS..."

# This requires osxcross toolchain or running on macOS
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Running on macOS - native build"
    
    # Clean previous build
    rm -rf build-macos
    mkdir build-macos
    cd build-macos
    
    # Configure and build
    cmake .. -DCMAKE_BUILD_TYPE=Release
    make -j$(sysctl -n hw.ncpu)
    
    # Create app bundle
    mkdir -p WinBoxARM.app/Contents/MacOS
    mkdir -p WinBoxARM.app/Contents/Resources
    
    cp src/winbox-arm WinBoxARM.app/Contents/MacOS/
    
    # Create Info.plist
    cat > WinBoxARM.app/Contents/Info.plist << EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>CFBundleExecutable</key>
    <string>winbox-arm</string>
    <key>CFBundleIdentifier</key>
    <string>com.example.winboxarm</string>
    <key>CFBundleName</key>
    <string>WinBox ARM</string>
    <key>CFBundleVersion</key>
    <string>1.0</string>
</dict>
</plist>
EOF
    
    echo "macOS build completed in build-macos/"
else
    echo "Warning: macOS cross-compilation requires osxcross toolchain"
    echo "Use GitHub Actions with macOS runner for native macOS builds"
fi