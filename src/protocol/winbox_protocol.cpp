#include "winbox_protocol.h"
#include <QTcpSocket>

WinBoxProtocol::WinBoxProtocol(QObject *parent) : QObject(parent) {
    socket = new QTcpSocket(this);
    
    QObject::connect(socket, &QTcpSocket::connected, this, &WinBoxProtocol::connected);
    QObject::connect(socket, &QTcpSocket::disconnected, this, &WinBoxProtocol::disconnected);
}

WinBoxProtocol::~WinBoxProtocol() {
    disconnect();
}

bool WinBoxProtocol::connectToHost(const QString& host, quint16 port) {
    socket->connectToHost(host, port);
    return socket->waitForConnected(5000);
}

void WinBoxProtocol::disconnect() {
    if (socket->state() != QTcpSocket::UnconnectedState) {
        socket->disconnectFromHost();
    }
}

