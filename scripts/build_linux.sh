#!/bin/bash
# Linux Build Script for WinBox ARM

set -e

echo "Building WinBox ARM for Linux..."

# Clean previous build
rm -rf build-linux
mkdir build-linux
cd build-linux

# Configure and build
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j$(nproc)

# Create AppDir structure for AppImage
mkdir -p AppDir/usr/bin
mkdir -p AppDir/usr/share/applications
mkdir -p AppDir/usr/share/icons/hicolor/256x256/apps

# Copy binary
cp src/winbox-arm AppDir/usr/bin/

# Create desktop file
cat > AppDir/usr/share/applications/winbox-arm.desktop << EOF
[Desktop Entry]
Type=Application
Name=WinBox ARM
Comment=RouterOS Client for ARM devices
Exec=winbox-arm
Icon=winbox-arm
Categories=Network;
EOF

# Create icon (placeholder)
if command -v convert &> /dev/null; then
    convert -size 256x256 xc:blue AppDir/usr/share/icons/hicolor/256x256/apps/winbox-arm.png
else
    # Create a simple placeholder PNG without ImageMagick
    echo "Creating placeholder icon..."
    cat > AppDir/usr/share/icons/hicolor/256x256/apps/winbox-arm.png << 'EOF'
iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNk+M9QDwADhgGAWjR9awAAAABJRU5ErkJggg==
EOF
fi

echo "Linux build completed in build-linux/"