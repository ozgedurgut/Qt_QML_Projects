// back.h

#ifndef BACK_H
#define BACK_H

#include <QObject>

class Back : public QObject
{
    Q_OBJECT
public:
    explicit Back(QObject *parent = nullptr);

signals:
    void dataChanged(const QString &newData);

public slots:
    void updateData(const QString &newData);
};

#endif // BACK_H
