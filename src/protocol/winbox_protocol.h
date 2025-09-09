#pragma once
#include <QObject>
#include <QTcpSocket>
#include <QString>

class WinBoxProtocol : public QObject {
    Q_OBJECT

public:
    WinBoxProtocol(QObject *parent = nullptr);
    ~WinBoxProtocol();

    bool connectToHost(const QString& host, quint16 port = 8291);
    void disconnect();

signals:
    void connected();
    void disconnected();
    void error(const QString& message);

private:
    QTcpSocket *socket;
};