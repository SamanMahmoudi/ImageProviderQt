#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "liveimageprovider.h"
#include <QThread>
int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    QScopedPointer<LiveImageProvider> liveImageProvider (LiveImageProvider::GetInstance());

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("liveImageProvider", liveImageProvider.data());
    engine.addImageProvider("live", liveImageProvider.data());
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;



    return app.exec();
}
