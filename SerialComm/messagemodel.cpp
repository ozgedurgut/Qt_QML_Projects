#include "messagemodel.h"
#include <QObject>
#include <QStringList>
MessageModel::MessageModel(QObject *parent) : QObject(parent)
{
}

void MessageModel::addMessage(const QString& message)
{
    m_messages.append(message);
    emit messagesChanged();
}


QStringList MessageModel::messages() const
{
    return m_messages;
}
