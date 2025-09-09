#include "winbox_client.h"
#include <QString>

WinBoxClient::WinBoxClient() : connected(false) {
}

WinBoxClient::~WinBoxClient() {
    disconnect();
}

bool WinBoxClient::connectToRouter(const QString& address, int port) {
    // TODO: Implement WinBox protocol connection
    connected = false;
    return connected;
}

void WinBoxClient::disconnect() {
    connected = false;
}

bool WinBoxClient::isConnected() const {
    return connected;
}