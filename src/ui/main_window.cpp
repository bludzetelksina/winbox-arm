#include "main_window.h"
#include <QVBoxLayout>
#include <QHBoxLayout>
#include <QLabel>
#include <QMessageBox>
#include <QWidget>
#include <QPushButton>
#include <QLineEdit>
#include <QIcon>
#include <QApplication>

MainWindow::MainWindow(QWidget *parent) : QMainWindow(parent) {
    setWindowTitle(tr("WinBox ARM - RouterOS Client"));
    setMinimumSize(400, 300);
    setWindowIcon(QIcon(":/icons/app_icon.png"));

    auto centralWidget = new QWidget(this);
    setCentralWidget(centralWidget);

    auto mainLayout = new QVBoxLayout(centralWidget);

    // Title
    auto titleLabel = new QLabel(tr("WinBox ARM - RouterOS Client"), this);
    titleLabel->setStyleSheet("font-size: 18px; font-weight: bold; margin: 10px;");
    mainLayout->addWidget(titleLabel);

    // Connection section
    auto connectionLayout = new QHBoxLayout();
    connectionLayout->addWidget(new QLabel(tr("Router Address:"), this));
    
    addressInput = new QLineEdit(this);
    addressInput->setPlaceholderText(tr("192.168.88.1 or MAC address"));
    connectionLayout->addWidget(addressInput);

    connectButton = new QPushButton(tr("Connect"), this);
    connect(connectButton, &QPushButton::clicked, this, &MainWindow::connectToRouter);
    connectionLayout->addWidget(connectButton);

    mainLayout->addLayout(connectionLayout);

    // Status
    statusLabel = new QLabel(tr("Ready to connect"), this);
    statusLabel->setStyleSheet("color: green; margin: 10px;");
    mainLayout->addWidget(statusLabel);

    mainLayout->addStretch();
}

void MainWindow::connectToRouter() {
    QString address = addressInput->text().trimmed();
    if (address.isEmpty()) {
        QMessageBox::warning(this, tr("Error"), tr("Please enter a router address"));
        return;
    }
    
    statusLabel->setText(tr("Connecting to %1...").arg(address));
    statusLabel->setStyleSheet("color: orange; margin: 10px;");
    
    // TODO: Implement actual connection logic
    QMessageBox::information(this, tr("Info"), tr("Connection feature will be implemented"));
    
    statusLabel->setText(tr("Ready to connect"));
    statusLabel->setStyleSheet("color: green; margin: 10px;");
}

