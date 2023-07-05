#ifndef SERIALCOMMUNICATION_H
#define SERIALCOMMUNICATION_H

#include <QObject>
#include <QSerialPort>

class SerialCommunication : public QObject
{
    Q_OBJECT
public:
    explicit SerialCommunication(QObject *parent = nullptr);

    Q_INVOKABLE void sendData(const QString& message);
    Q_INVOKABLE void receiveData();

signals:
    void messageSent(const QString& message);
    void messageReceived(const QString& message);
    void errorOccurred(const QString& error);

private:
    QSerialPort m_serialPort;

private slots:
    void handleReadyRead();
    void handleError(QSerialPort::SerialPortError error);
};

#endif // SERIALCOMMUNICATION_H
