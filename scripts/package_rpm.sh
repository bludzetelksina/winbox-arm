#!/bin/bash
# RPM Package Creation Script

set -e

echo "Creating RPM package..."

# Install rpmbuild if not available
if ! command -v rpmbuild &> /dev/null; then
    echo "Installing rpm build tools..."
    sudo apt-get update
    sudo apt-get install -y rpm
fi

# Create RPM build environment
mkdir -p ~/rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS}

# Copy spec file
cp packaging/rpm/winbox-arm.spec ~/rpmbuild/SPECS/

# Create source tarball
tar czf ~/rpmbuild/SOURCES/winbox-arm-1.0.0.tar.gz \
    --transform 's,^,winbox-arm-1.0.0/,' \
    --exclude='build*' \
    --exclude='.git*' \
    .

# Build RPM
rpmbuild -ba ~/rpmbuild/SPECS/winbox-arm.spec

echo "RPM package created in ~/rpmbuild/RPMS/"