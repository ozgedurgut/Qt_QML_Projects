#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "back.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    Back *back = new Back;

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("back", back);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
