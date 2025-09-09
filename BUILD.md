# WinBox ARM - Multi-Platform Build Guide

## Quick Build

Execute all builds at once:
```bash
./scripts/build_all.sh
```

## Platform-Specific Builds

### Linux (Native)
```bash
./scripts/build_linux.sh
```
Creates: `build-linux/src/winbox-arm`

### Windows (Cross-compilation)
```bash
./scripts/build_windows.sh
```
Requires: mingw-w64 toolchain and Qt6 for Windows

### macOS
```bash
./scripts/build_macos.sh
```
Best run on macOS or with osxcross toolchain

## Package Creation

### DEB Package (Debian/Ubuntu)
```bash
./scripts/package_deb.sh
```
Creates: `winbox-arm_1.0.0_amd64.deb`

### RPM Package (Red Hat/Fedora)
```bash
./scripts/package_rpm.sh
```
Creates: RPM package in `~/rpmbuild/RPMS/`

## Automated Builds

### GitHub Actions
The project includes GitHub Actions workflow (`.github/workflows/build.yml`) that automatically:
- Builds for Linux, Windows, macOS, ARM64, and ARMv7
- Creates DEB packages
- Uploads artifacts on releases

### Supported Platforms
- **Linux**: x86_64, ARM64, ARMv7
- **Windows**: x86_64 (via MSVC and mingw-w64)
- **macOS**: x86_64 and ARM64 (Apple Silicon)

## Dependencies
- Qt6 (Widgets, Network modules)
- CMake 3.15+
- C++17 compiler

## Binary Outputs
- Linux: `winbox-arm` (ELF executable)
- Windows: `winbox-arm.exe` 
- macOS: `WinBoxARM.app` (Application bundle)
- DEB: `winbox-arm_1.0.0_amd64.deb`
- RPM: `winbox-arm-1.0.0-1.rpm`