#ifndef BACK_H
#define BACK_H

#include <QObject>
#include <QString>

class Back : public QObject {

    Q_OBJECT

public:
    explicit Back(QObject *parent = nullptr);

signals:
    void valueChanged(QString s);

public slots:
    void changeValue(int a);

};


#endif // BACK_H
