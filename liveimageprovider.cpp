// LiveImageProvider.cpp
#include "liveimageprovider.h"

LiveImageProvider* LiveImageProvider::_instance = 0;

/**
* @brief Image provider that is used to handle the live image stream in the QML viewer.
 */
LiveImageProvider::LiveImageProvider() : QQuickImageProvider(QQuickImageProvider::Image)
{
    this->no_image = QImage(":/Persona");
}

LiveImageProvider *LiveImageProvider::GetInstance()
{
    if (!_instance)
        _instance = new LiveImageProvider();
    return _instance;
}

/**
 * @brief Delivers image. The id is not used.
 * @param id The id is the requested image source, with the "image:" scheme and provider identifier removed.
 * For example, if the image source was "image://myprovider/icons/home", the given id would be "icons/home".
 * @param size In all cases, size must be set to the original size of the image. This is used to set the
 * width and height of the relevant Image if these values have not been set explicitly.
 * @param requestedSize The requestedSize corresponds to the Image::sourceSize requested by an Image item.
 * If requestedSize is a valid size, the image returned should be of that size.
 * @return
 */
QImage LiveImageProvider::requestImage(const QString &id, QSize *size, const QSize &requestedSize)
{
    result = this->image;

    if(result.isNull()) {
        result = this->no_image;
    }

    if(size) {
        *size = result.size();
    }

    if(requestedSize.width() > 0 && requestedSize.height() > 0) {
        result = result.scaled(requestedSize.width(), requestedSize.height(), Qt::KeepAspectRatio);
    }

    return result;
}

/**
 * @brief Update of the current image.
 * @param image The new image.
 */
void LiveImageProvider::updateImage(int EmpNo)
{
    emit shiftImageOne();

   db = QSqlDatabase::addDatabase("QSQLITE");
   db.setDatabaseName(DATABASE_Location);
   db.open();
   QSqlQuery *query = new QSqlQuery(db);

   query->exec("SELECT image,name FROM users where Emp_no = " + QString::number(EmpNo));
   query->next();
   array = query->value(0).toByteArray();
   pixmap.loadFromData(array);

   if (pixmap.toImage().isNull())
   {
       this->image = QImage(":/images/Person");
   }
   else {
       this->image = pixmap.toImage();
   }

   emit imageChanged(EmpNo,query->value(1).toString());
   delete query;
}


QStringList LiveImageProvider::imageData(int EmpNo)
 {
    db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName(DATABASE_Location);
    db.open();
    QSqlQuery *query = new QSqlQuery(db);
    query->exec("SELECT image,name FROM users where Emp_no = " + QString::number(EmpNo));
    query->next();
    array = query->value(0).toByteArray();
    pixmap.loadFromData(array);

    QBuffer buffer(&array);
     buffer.open(QIODevice::WriteOnly);
     this->image.save(&buffer, "JPEG");

    QString image("data:image/jpg;base64,");
     image.append(QString::fromLatin1(array.toBase64().data()));
    QStringList result;
    result << image;
    result <<  query->value(1).toString();
    result << QTime::currentTime().toString();
    return result;
 }
