#!/bin/bash
# DEB Package Creation Script

set -e

echo "Creating DEB package..."

# Build the application first
./scripts/build_linux.sh

# Create package directory structure
PKG_DIR="winbox-arm_1.0.0_amd64"
rm -rf $PKG_DIR
mkdir -p $PKG_DIR/DEBIAN
mkdir -p $PKG_DIR/usr/bin
mkdir -p $PKG_DIR/usr/share/applications
mkdir -p $PKG_DIR/usr/share/icons/hicolor/256x256/apps

# Copy control file
cp packaging/deb/control $PKG_DIR/DEBIAN/

# Copy binary and files
cp build-linux/src/winbox-arm $PKG_DIR/usr/bin/
cp build-linux/AppDir/usr/share/applications/winbox-arm.desktop $PKG_DIR/usr/share/applications/
cp build-linux/AppDir/usr/share/icons/hicolor/256x256/apps/winbox-arm.png $PKG_DIR/usr/share/icons/hicolor/256x256/apps/

# Set permissions
chmod 755 $PKG_DIR/usr/bin/winbox-arm
chmod 644 $PKG_DIR/usr/share/applications/winbox-arm.desktop

# Build package
dpkg-deb --build $PKG_DIR

echo "DEB package created: ${PKG_DIR}.deb"