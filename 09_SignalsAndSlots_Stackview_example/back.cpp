// back.cpp

#include "back.h"

Back::Back(QObject *parent) : QObject(parent)
{
}

void Back::updateData(const QString &newData)
{
    // dataChanged sinyalini tetikle
    emit dataChanged(newData);
}
