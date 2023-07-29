// coffeemachine.h
#ifndef COFFEEMACHINE_H
#define COFFEEMACHINE_H

#include <QObject>

class CoffeeMachine : public QObject
{
    Q_OBJECT

public:
    explicit CoffeeMachine(QObject *parent = nullptr);

signals:
    void coffeeSelected(QString coffeeType);

public slots:
    void startButtonClicked(QString username);
};

#endif // COFFEEMACHINE_H
