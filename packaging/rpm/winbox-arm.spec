Name:           winbox-arm
Version:        1.0.0
Release:        1%{?dist}
Summary:        RouterOS Client for ARM devices

License:        GPL
URL:            https://github.com/example/winbox-arm
Source0:        %{name}-%{version}.tar.gz

BuildRequires:  cmake >= 3.15
BuildRequires:  gcc-c++
BuildRequires:  qt6-qtbase-devel
BuildRequires:  qt6-qtnetworkauth-devel

Requires:       qt6-qtbase
Requires:       qt6-qtnetworkauth

%description
WinBox ARM is a lightweight, cross-platform client application 
designed to manage MikroTik RouterOS devices from ARM-based systems 
like Raspberry Pi and Android devices.

%prep
%setup -q

%build
mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make %{?_smp_mflags}

%install
cd build
make install DESTDIR=%{buildroot}

%files
%{_bindir}/winbox-arm
%{_datadir}/applications/winbox-arm.desktop

%changelog
* Mon Jan 01 2024 Developer <developer@example.com> - 1.0.0-1
- Initial package