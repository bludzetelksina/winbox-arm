#pragma once
#include <QString>

class WinBoxClient {
public:
    WinBoxClient();
    ~WinBoxClient();

    bool connectToRouter(const QString& address, int port = 8291);
    void disconnect();
    bool isConnected() const;

private:
    bool connected;
};