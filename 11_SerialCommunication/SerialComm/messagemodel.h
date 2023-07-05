#ifndef MESSAGEMODEL_H
#define MESSAGEMODEL_H

#include <QObject>
#include <QStringList>

class MessageModel : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QStringList messages READ messages NOTIFY messagesChanged)

public:
    explicit MessageModel(QObject *parent = nullptr);

    Q_INVOKABLE void addMessage(const QString& message);
    QStringList messages() const;

signals:
    void messagesChanged();

private:
    QStringList m_messages;
};

#endif // MESSAGEMODEL_H
