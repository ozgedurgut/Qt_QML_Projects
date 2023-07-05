#include "serialcommunication.h"

SerialCommunication::SerialCommunication(QObject *parent) : QObject(parent)
{
    // Seri port ayarlarını yapmadan önce QSerialPort objesini oluşturun
    m_serialPort.setPortName("/dev/ttyACM1"); // Seri portunuzu uygun şekilde ayarlayın
    m_serialPort.setBaudRate(QSerialPort::Baud9600); // Baud hızını ayarlayın
    m_serialPort.setDataBits(QSerialPort::Data8);
    m_serialPort.setParity(QSerialPort::NoParity);
    m_serialPort.setStopBits(QSerialPort::OneStop);
    m_serialPort.setFlowControl(QSerialPort::NoFlowControl);

    connect(&m_serialPort, &QSerialPort::readyRead, this, &SerialCommunication::handleReadyRead);
    connect(&m_serialPort, static_cast<void (QSerialPort::*)(QSerialPort::SerialPortError)>(&QSerialPort::error),
            this, &SerialCommunication::handleError);
}

void SerialCommunication::sendData(const QString& message)
{
    if (!m_serialPort.isOpen()) {
        m_serialPort.setPortName("/dev/ttyACM1"); // Seri portunuzu uygun şekilde ayarlayın
        m_serialPort.setBaudRate(QSerialPort::Baud9600); // Baud hızını ayarlayın
        m_serialPort.setDataBits(QSerialPort::Data8);
        m_serialPort.setParity(QSerialPort::NoParity);
        m_serialPort.setStopBits(QSerialPort::OneStop);
        m_serialPort.setFlowControl(QSerialPort::NoFlowControl);

        if (!m_serialPort.open(QIODevice::ReadWrite)) {
            emit errorOccurred("Failed to open serial port: " + m_serialPort.errorString());
            return;
        }
    }

    if (!m_serialPort.isWritable()) {
        emit errorOccurred("Serial port is not writable.");
        return;
    }

    QByteArray data = message.toUtf8();
    m_serialPort.write(data);
    emit messageSent(message);
}


void SerialCommunication::receiveData()
{
    if (m_serialPort.isOpen() && m_serialPort.isReadable()) {
        QByteArray data = m_serialPort.readAll();
        QString message = QString::fromUtf8(data);
        emit messageReceived(message);
    } else {
        emit errorOccurred("Serial port is not open or not readable.");
    }
}

void SerialCommunication::handleReadyRead()
{
    receiveData();
}

void SerialCommunication::handleError(QSerialPort::SerialPortError error)
{
    if (error != QSerialPort::NoError) {
        emit errorOccurred(m_serialPort.errorString());
    }
}
