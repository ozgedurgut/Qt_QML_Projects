#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "counter.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    qmlRegisterType<Counter>("CustomTypes", 1, 0, "Counter");



  //  engine.rootContext()->setContextProperty("back",back);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;



    return app.exec();
}
