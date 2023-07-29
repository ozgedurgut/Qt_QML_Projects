#ifndef MESSAGEHANDLER_H
#define MESSAGEHANDLER_H

#include <QObject>
#include <QSerialPort> // Add the QSerialPort header

    class MessageHandler : public QObject
    {
        Q_OBJECT
        Q_PROPERTY(QString currentMessage READ getCurrentMessage NOTIFY messageReceived)

    public:
        explicit MessageHandler(QObject *parent = nullptr);
        QString getCurrentMessage() const;
        bool connectedToUart();
        QSerialPort serialPort; // Add the QSerialPort object as a private member

    signals:
        void buttonClicked(const QString& buttonName);
        void dataReceived(const QByteArray &data);
        void messageReceived();
        void temp1MessageReceived(const QString& message);
        void temp2MessageReceived(const QString& message);
        void currentMessageReceived(const QString& message);
        void modeMessageReceived(const QString& message);

    public slots:
        void processButtonClicked(const QString& buttonName);
        void sendMessage(const QString& message);
        void updateButtonStatus(const QString& buttonName);
        void processIncomingMessage();


    private:
        // Add any other private member variables or helper functions if needed.
        QString currentMessage; // Seri porttan en son alınan mesajı tutacak olan değişken
};

#endif // MESSAGEHANDLER_H
