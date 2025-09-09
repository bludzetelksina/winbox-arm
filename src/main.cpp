#include <QApplication>
#include <QTranslator>
#include <QLocale>
#include <QLibraryInfo>
#include "ui/main_window.h"

int main(int argc, char *argv[]) {
    QApplication app(argc, argv);
    
    // Set application properties
    app.setApplicationName("WinBox ARM");
    app.setApplicationVersion("1.0.0");
    app.setOrganizationName("WinBox ARM Project");
    
    // Load translations
    QTranslator translator;
    const QStringList uiLanguages = QLocale::system().uiLanguages();
    for (const QString &locale : uiLanguages) {
        const QString baseName = "winbox-arm_" + QLocale(locale).name();
        if (translator.load(":/translations/" + QLocale(locale).name() + ".qm")) {
            app.installTranslator(&translator);
            break;
        }
    }
    
    MainWindow window;
    window.show();
    return app.exec();
}