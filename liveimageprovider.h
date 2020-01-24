// LiveImageProvider.h
#ifndef LIVEIMAGEPROVIDER_H
#define LIVEIMAGEPROVIDER_H

#include <QImage>
#include <QQuickImageProvider>
#include <QSqlQuery>
#include <QBuffer>
#include <QDebug>
#include <QStringList>
#include <QTime>
//#define DEVICEFLAG 1
#ifdef DEVICEFLAG
    #define DATABASE_Location "/home/pi/Device.db"
#endif
#ifndef DEVICEFLAG
    #define DATABASE_Location "/home/saman/Downloads/Device.db"
#endif

class LiveImageProvider : public QObject, public QQuickImageProvider
{
    Q_OBJECT
public:
    LiveImageProvider();
    static LiveImageProvider *GetInstance();
    Q_INVOKABLE QImage requestImage(const QString &id, QSize *size, const QSize &requestedSize) override;
    Q_INVOKABLE QStringList imageData(int EmpNo);
public slots:
    void updateImage(int EmpNo);

signals:
    void imageChanged(int frameNumber,QString name);
    void shiftImageOne();
    void shiftImageTwo();

private:
    static LiveImageProvider *_instance;
    QImage image = QImage(":/Persona");
    QImage no_image;
    QByteArray array;
    QPixmap pixmap;
    QSqlDatabase db;
    QImage result;
};

#endif // LIVEIMAGEPROVIDER_H
