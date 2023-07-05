#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "serialcommunication.h"
#include "messagemodel.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    // Seri haberleşme sınıfını oluştur
    SerialCommunication serialCommunication;

    // Mesaj modelini oluştur
    MessageModel messageModel;

    // QML tarafına sınıfları kaydet
    engine.rootContext()->setContextProperty("serialCommunication", &serialCommunication);
    engine.rootContext()->setContextProperty("messageModel", &messageModel);

    // QML dosyasını yükle
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
