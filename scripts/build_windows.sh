#!/bin/bash
# Windows Cross-Compilation Script for WinBox ARM

set -e

echo "Cross-compiling WinBox ARM for Windows..."

# Install mingw-w64 if not available
if ! command -v x86_64-w64-mingw32-gcc &> /dev/null; then
    echo "Installing mingw-w64 cross-compiler..."
    sudo apt-get update
    sudo apt-get install -y mingw-w64 mingw-w64-tools
fi

# Clean previous build
rm -rf build-windows
mkdir build-windows
cd build-windows

# Configure for Windows cross-compilation
cmake .. \
    -DCMAKE_TOOLCHAIN_FILE=../cmake/Toolchain-mingw64.cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DQt6_DIR=/usr/x86_64-w64-mingw32/lib/cmake/Qt6

# Build (if Qt6 for Windows is available)
if [ -d "/usr/x86_64-w64-mingw32/lib/cmake/Qt6" ]; then
    make -j$(nproc)
    echo "Windows build completed in build-windows/"
else
    echo "Warning: Qt6 for Windows not found. Please install qt6-base-dev-cross package."
    echo "Or use GitHub Actions with Qt6 Windows installation."
fi