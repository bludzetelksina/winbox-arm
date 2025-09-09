#!/bin/bash
# Master build script for all platforms

set -e

echo "WinBox ARM - Multi-Platform Build Script"
echo "========================================"

# Make all scripts executable
chmod +x scripts/*.sh

echo "1. Building for Linux..."
./scripts/build_linux.sh

echo "2. Creating DEB package..."
./scripts/package_deb.sh

echo "3. Attempting Windows cross-compilation..."
if ./scripts/build_windows.sh; then
    echo "Windows build successful"
else
    echo "Windows build failed (requires proper cross-compilation setup)"
fi

echo "4. Attempting macOS build..."
if ./scripts/build_macos.sh; then
    echo "macOS build successful" 
else
    echo "macOS build failed (requires macOS environment or osxcross)"
fi

echo "5. Creating RPM package..."
if ./scripts/package_rpm.sh; then
    echo "RPM package created successfully"
else
    echo "RPM packaging failed (requires rpm tools)"
fi

echo ""
echo "Build Summary:"
echo "=============="
echo "✓ Linux native build completed"
echo "✓ DEB package created"
echo "? Windows cross-compilation (check output above)" 
echo "? macOS cross-compilation (check output above)"
echo "? RPM package (check output above)"
echo ""
echo "Check the build-* directories for outputs"