#include "messagehandler.h"
#include <QDebug>
#include <QSerialPortInfo>
#include <QtSerialPort>

MessageHandler::MessageHandler(QObject *parent)
    : QObject{parent}
{

}

void MessageHandler::MessageHandler::processButtonClicked(const QString &buttonName)
{
    emit buttonClicked(buttonName);

}

void MessageHandler::MessageHandler::sendMessage(const QString &message)
{
    QByteArray data = message.toUtf8();
    serialPort.write(data);
}

void MessageHandler::MessageHandler::updateButtonStatus(const QString &buttonName)
{

}

void MessageHandler::MessageHandler::processIncomingMessage()
{
    QByteArray data = serialPort.readAll();
    //   currentMessage = QString::fromUtf8(data);
    QString message = QString::fromUtf8(data);

}
bool MessageHandler::connectedToUart()
{
    // Initialize your serial port here if needed
    qDebug() << "Available serial ports:";
    foreach (const QSerialPortInfo &portInfo, QSerialPortInfo::availablePorts()) {
        qDebug() << portInfo.portName();
    }
    serialPort.setPortName("/dev/ttyAMA0");
    serialPort.setBaudRate(QSerialPort::Baud115200);
    serialPort.setDataBits(QSerialPort::Data8);
    serialPort.setParity(QSerialPort::NoParity);
    serialPort.setStopBits(QSerialPort::OneStop);

    if (!serialPort.open(QIODevice::ReadWrite)) {
        qWarning("O4688:Failed to open serial port!");
        return false;
    }else{
        qWarning("Opened");
        connect(&serialPort, &QSerialPort::readyRead, this, &MessageHandler::processIncomingMessage);
        return true;
    }
}

QString MessageHandler::getCurrentMessage() const
{
    return currentMessage;
}
