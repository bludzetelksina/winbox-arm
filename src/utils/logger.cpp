#include <QDebug>
#include <QString>

class Logger {
public:
    static void info(const QString& message) {
        qDebug() << "[INFO]" << message;
    }
    
    static void error(const QString& message) {
        qDebug() << "[ERROR]" << message;
    }
    
    static void warning(const QString& message) {
        qDebug() << "[WARNING]" << message;
    }
};