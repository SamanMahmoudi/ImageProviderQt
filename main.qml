import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
ApplicationWindow {
    visible: true
    width: 640
    height: 480
    property int currentFrameNumber: 0
    property int ssss: 0
    FontLoader { id: webFont; source: "qrc:/IRHoma.ttf" }
    header: Rectangle {
        id: backButton
        width: parent.width
        height: 50
        color: "transparent"
        Text {
            font.family: webFont.name
            font.bold: true
            font.pixelSize: ((parent.width + parent.height) / 2 )* 0.06
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            text: "لیست تردد پرسنل"
        }
    }
    Connections {
        target: liveImageProvider
        onImageChanged: {
            currentFrameNumber = frameNumber;
            firstname.text = name
            console.log("onImageChanged")
        }
    }


    Timer {
        id:saman
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            var test
            if (ssss === 0) {
                shiftRect()
                test =  liveImageProvider.imageData(9092)
                firstliveImage.source = test[0]
                firstname.text = test[1]
                firstdate.text = test[2]
            }
            else if (ssss === 1) {
               shiftRect()
                test =  liveImageProvider.imageData(299)
                firstliveImage.source = test[0]
                firstname.text = test[1]
                firstdate.text = test[2]
            }
            else if (ssss === 2) {
                shiftRect()
                test = liveImageProvider.imageData(2404)
                firstliveImage.source = test[0]
                firstname.text = test[1]
                firstdate.text = test[2]
            }
            else if (ssss === 3) {
                shiftRect()
                test = liveImageProvider.imageData(2282)
                firstliveImage.source = test[0]
                firstname.text = test[1]
                firstdate.text = test[2]
            }
            else {
                shiftRect()
                test = liveImageProvider.imageData(2067)
                firstliveImage.source = test[0]
                firstname.text = test[1]
                firstdate.text = test[2]
            }
            ssss = ssss + 1
        }
    }
    GridLayout {
        id:grid
        layoutDirection: Qt.RightToLeft
        anchors.fill: parent
        rows    : 2
        columns : 3
        rowSpacing: 5
        columnSpacing: 5
        anchors.leftMargin: 5
        anchors.rightMargin: 5
        anchors.topMargin: 5
        anchors.bottomMargin: 5

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: "transparent"
            border.color: "red"
            border.width: 1
            radius: 5
            Rectangle {
                width: parent.width
                height: 3*parent.height / 4
                anchors.top: parent.top
                color: "transparent"
                Image {
                  id: firstliveImage
                  visible: true
                  source: "qrc:/Personal1.png"
                  anchors.fill: parent
                  fillMode: Image.PreserveAspectFit
                  cache: false
                }
            }

            Rectangle {
                width: parent.width
                height: parent.height / 4
                anchors.bottom: parent.bottom
                color: "transparent"
                Rectangle {
                    width: parent.width
                    height: parent.height / 2
                    anchors.top: parent.top
                    color: "transparent"
                    Text {
                        id: firstdate
                        font.family: webFont.name
                        font.bold: true
                        font.pixelSize: ((parent.width + parent.height) / 2 )*0.08
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }

                Rectangle {
                    width: parent.width
                    height: parent.height / 2
                    anchors.bottom: parent.bottom
                    color: "transparent"
                    Text {
                        id: firstname
                        font.family: webFont.name
                        font.bold: true
                        font.pixelSize: ((parent.width + parent.height) / 2 )*0.08
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
            }
        }

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: "transparent"
            border.color: "blue"
            border.width: 1
            radius: 5
            Rectangle {
                width: parent.width
                height: 3*parent.height / 4
                anchors.top: parent.top
                color: "transparent"
                Image {
                  id: secondliveImage
                  visible: true
                  source: "qrc:/Personal1.png"
                  anchors.fill: parent
                  fillMode: Image.PreserveAspectFit
                  cache: false
                }
            }

            Rectangle {
                width: parent.width
                height: parent.height / 4
                anchors.bottom: parent.bottom
                color: "transparent"
                Rectangle {
                    width: parent.width
                    height: parent.height / 2
                    anchors.top: parent.top
                    color: "transparent"
                    Text {
                        id: seconddate
                        font.family: webFont.name
                        font.bold: true
                        font.pixelSize: ((parent.width + parent.height) / 2 )*0.08
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }

                Rectangle {
                    width: parent.width
                    height: parent.height / 2
                    anchors.bottom: parent.bottom
                    color: "transparent"
                    Text {
                        id: secondname
                        font.family: webFont.name
                        font.bold: true
                        font.pixelSize: ((parent.width + parent.height) / 2 )*0.08
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
            }
        }

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: "transparent"
            border.color: "blue"
            border.width: 1
            radius: 5
            Rectangle {
                width: parent.width
                height: 3*parent.height / 4
                anchors.top: parent.top
                color: "transparent"
                Image {
                  id: thirdliveImage
                  visible: true
                  source: "qrc:/Personal1.png"
                  anchors.fill: parent
                  fillMode: Image.PreserveAspectFit
                  cache: false
                }
            }

            Rectangle {
                width: parent.width
                height: parent.height / 4
                anchors.bottom: parent.bottom
                color: "transparent"
                Rectangle {
                    width: parent.width
                    height: parent.height / 2
                    anchors.top: parent.top
                    color: "transparent"
                    Text {
                        id: thirddate
                        font.family: webFont.name
                        font.bold: true
                        font.pixelSize: ((parent.width + parent.height) / 2 )*0.08
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }

                Rectangle {
                    width: parent.width
                    height: parent.height / 2
                    anchors.bottom: parent.bottom
                    color: "transparent"
                    Text {
                        id: thirdname
                        font.family: webFont.name
                        font.bold: true
                        font.pixelSize: ((parent.width + parent.height) / 2 )*0.08
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
            }

        }

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: "transparent"
            border.color: "blue"
            border.width: 1
            radius: 5

            Rectangle {
                width: parent.width
                height: 3*parent.height / 4
                anchors.top: parent.top
                color: "transparent"
                Image {
                  id: fourthliveImage
                  visible: true
                  source: "qrc:/Personal1.png"
                  anchors.fill: parent
                  fillMode: Image.PreserveAspectFit
                  cache: false
                }
            }

            Rectangle {
                width: parent.width
                height: parent.height / 4
                anchors.bottom: parent.bottom
                color: "transparent"
                Rectangle {
                    width: parent.width
                    height: parent.height / 2
                    anchors.top: parent.top
                    color: "transparent"
                    Text {
                        id: fourthdate
                        font.family: webFont.name
                        font.bold: true
                        font.pixelSize: ((parent.width + parent.height) / 2 )*0.08
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }

                Rectangle {
                    width: parent.width
                    height: parent.height / 2
                    anchors.bottom: parent.bottom
                    color: "transparent"
                    Text {
                        id: fourthname
                        font.family: webFont.name
                        font.bold: true
                        font.pixelSize: ((parent.width + parent.height) / 2 )*0.08
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
            }
        }

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: "transparent"
            border.color: "blue"
            border.width: 1
            radius: 5
            Rectangle {
                width: parent.width
                height: 3*parent.height / 4
                anchors.top: parent.top
                color: "transparent"
                Image {
                  id: fivethliveImage
                  visible: true
                  source: "qrc:/Personal1.png"
                  anchors.fill: parent
                  fillMode: Image.PreserveAspectFit
                  cache: false
                }
            }

            Rectangle {
                width: parent.width
                height: parent.height / 4
                anchors.bottom: parent.bottom
                color: "transparent"
                Rectangle {
                    width: parent.width
                    height: parent.height / 2
                    anchors.top: parent.top
                    color: "transparent"
                    Text {
                        id: fivethdate
                        font.family: webFont.name
                        font.bold: true
                        font.pixelSize: ((parent.width + parent.height) / 2 )*0.08
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }

                Rectangle {
                    width: parent.width
                    height: parent.height / 2
                    anchors.bottom: parent.bottom
                    color: "transparent"
                    Text {
                        id: fivethname
                        font.family: webFont.name
                        font.bold: true
                        font.pixelSize: ((parent.width + parent.height) / 2 )*0.08
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
            }
        }

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: "transparent"
            border.color: "blue"
            border.width: 1
            radius: 5

            Rectangle {
                width: parent.width
                height: 3*parent.height / 4
                anchors.top: parent.top
                color: "transparent"
                Image {
                  id: sixthliveImage
                  visible: true
                  source: "qrc:/Personal1.png"
                  anchors.fill: parent
                  fillMode: Image.PreserveAspectFit
                  cache: false
                }
            }

            Rectangle {
                width: parent.width
                height: parent.height / 4
                anchors.bottom: parent.bottom
                color: "transparent"
                Rectangle {
                    width: parent.width
                    height: parent.height / 2
                    anchors.top: parent.top
                    color: "transparent"
                    Text {
                        id: sixthdate
                        font.family: webFont.name
                        font.bold: true
                        font.pixelSize: ((parent.width + parent.height) / 2 )*0.08
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }

                Rectangle {
                    width: parent.width
                    height: parent.height / 2
                    anchors.bottom: parent.bottom
                    color: "transparent"
                    Text {
                        id: sixthname
                        font.family: webFont.name
                        font.bold: true
                        font.pixelSize: ((parent.width + parent.height) / 2 )*0.08
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
            }
        }


        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: "transparent"
            border.color: "red"
            border.width: 1
            radius: 5
            Rectangle {
                width: parent.width
                height: 3*parent.height / 4
                anchors.top: parent.top
                color: "transparent"
                Image {
                  id: seventhliveImage
                  visible: true
                  source: "qrc:/Personal1.png"
                  anchors.fill: parent
                  fillMode: Image.PreserveAspectFit
                  cache: false
                }
            }

            Rectangle {
                width: parent.width
                height: parent.height / 4
                anchors.bottom: parent.bottom
                color: "transparent"
                Rectangle {
                    width: parent.width
                    height: parent.height / 2
                    anchors.top: parent.top
                    color: "transparent"
                    Text {
                        id: seventhdate
                        font.family: webFont.name
                        font.bold: true
                        font.pixelSize: ((parent.width + parent.height) / 2 )*0.08
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }

                Rectangle {
                    width: parent.width
                    height: parent.height / 2
                    anchors.bottom: parent.bottom
                    color: "transparent"
                    Text {
                        id: seventhname
                        font.family: webFont.name
                        font.bold: true
                        font.pixelSize: ((parent.width + parent.height) / 2 )*0.08
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
            }
        }

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: "transparent"
            border.color: "blue"
            border.width: 1
            radius: 5
            Rectangle {
                width: parent.width
                height: 3*parent.height / 4
                anchors.top: parent.top
                color: "transparent"
                Image {
                  id: eighthliveImage
                  visible: true
                  source: "qrc:/Personal1.png"
                  anchors.fill: parent
                  fillMode: Image.PreserveAspectFit
                  cache: false
                }
            }

            Rectangle {
                width: parent.width
                height: parent.height / 4
                anchors.bottom: parent.bottom
                color: "transparent"
                Rectangle {
                    width: parent.width
                    height: parent.height / 2
                    anchors.top: parent.top
                    color: "transparent"
                    Text {
                        id: eighthdate
                        font.family: webFont.name
                        font.bold: true
                        font.pixelSize: ((parent.width + parent.height) / 2 )*0.08
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }

                Rectangle {
                    width: parent.width
                    height: parent.height / 2
                    anchors.bottom: parent.bottom
                    color: "transparent"
                    Text {
                        id: eighthname
                        font.family: webFont.name
                        font.bold: true
                        font.pixelSize: ((parent.width + parent.height) / 2 )*0.08
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
            }
        }

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: "transparent"
            border.color: "blue"
            border.width: 1
            radius: 5
            Rectangle {
                width: parent.width
                height: 3*parent.height / 4
                anchors.top: parent.top
                color: "transparent"
                Image {
                  id: ninethliveImage
                  visible: true
                  source: "qrc:/Personal1.png"
                  anchors.fill: parent
                  fillMode: Image.PreserveAspectFit
                  cache: false
                }
            }

            Rectangle {
                width: parent.width
                height: parent.height / 4
                anchors.bottom: parent.bottom
                color: "transparent"
                Rectangle {
                    width: parent.width
                    height: parent.height / 2
                    anchors.top: parent.top
                    color: "transparent"
                    Text {
                        id: ninethdate
                        font.family: webFont.name
                        font.bold: true
                        font.pixelSize: ((parent.width + parent.height) / 2 )*0.08
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }

                Rectangle {
                    width: parent.width
                    height: parent.height / 2
                    anchors.bottom: parent.bottom
                    color: "transparent"
                    Text {
                        id: ninethname
                        font.family: webFont.name
                        font.bold: true
                        font.pixelSize: ((parent.width + parent.height) / 2 )*0.08
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
            }

        }

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: "transparent"
            border.color: "blue"
            border.width: 1
            radius: 5

            Rectangle {
                width: parent.width
                height: 3*parent.height / 4
                anchors.top: parent.top
                color: "transparent"
                Image {
                  id: tenthliveImage
                  visible: true
                  source: "qrc:/Personal1.png"
                  anchors.fill: parent
                  fillMode: Image.PreserveAspectFit
                  cache: false
                }
            }

            Rectangle {
                width: parent.width
                height: parent.height / 4
                anchors.bottom: parent.bottom
                color: "transparent"
                Rectangle {
                    width: parent.width
                    height: parent.height / 2
                    anchors.top: parent.top
                    color: "transparent"
                    Text {
                        id: tenthdate
                        font.family: webFont.name
                        font.bold: true
                        font.pixelSize: ((parent.width + parent.height) / 2 )*0.08
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }

                Rectangle {
                    width: parent.width
                    height: parent.height / 2
                    anchors.bottom: parent.bottom
                    color: "transparent"
                    Text {
                        id: tenthname
                        font.family: webFont.name
                        font.bold: true
                        font.pixelSize: ((parent.width + parent.height) / 2 )*0.08
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
            }
        }

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: "transparent"
            border.color: "blue"
            border.width: 1
            radius: 5
            Rectangle {
                width: parent.width
                height: 3*parent.height / 4
                anchors.top: parent.top
                color: "transparent"
                Image {
                  id: eleventhliveImage
                  visible: true
                  source: "qrc:/Personal1.png"
                  anchors.fill: parent
                  fillMode: Image.PreserveAspectFit
                  cache: false
                }
            }

            Rectangle {
                width: parent.width
                height: parent.height / 4
                anchors.bottom: parent.bottom
                color: "transparent"
                Rectangle {
                    width: parent.width
                    height: parent.height / 2
                    anchors.top: parent.top
                    color: "transparent"
                    Text {
                        id: eleventhdate
                        font.family: webFont.name
                        font.bold: true
                        font.pixelSize: ((parent.width + parent.height) / 2 )*0.08
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }

                Rectangle {
                    width: parent.width
                    height: parent.height / 2
                    anchors.bottom: parent.bottom
                    color: "transparent"
                    Text {
                        id: eleventhname
                        font.family: webFont.name
                        font.bold: true
                        font.pixelSize: ((parent.width + parent.height) / 2 )*0.08
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
            }
        }

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: "transparent"
            border.color: "blue"
            border.width: 1
            radius: 5

            Rectangle {
                width: parent.width
                height: 3*parent.height / 4
                anchors.top: parent.top
                color: "transparent"
                Image {
                  id: twelvethliveImage
                  visible: true
                  source: "qrc:/Personal1.png"
                  anchors.fill: parent
                  fillMode: Image.PreserveAspectFit
                  cache: false
                }
            }

            Rectangle {
                width: parent.width
                height: parent.height / 4
                anchors.bottom: parent.bottom
                color: "transparent"
                Rectangle {
                    width: parent.width
                    height: parent.height / 2
                    anchors.top: parent.top
                    color: "transparent"
                    Text {
                        id: twelvethdate
                        font.family: webFont.name
                        font.bold: true
                        font.pixelSize: ((parent.width + parent.height) / 2 )*0.08
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }

                Rectangle {
                    width: parent.width
                    height: parent.height / 2
                    anchors.bottom: parent.bottom
                    color: "transparent"
                    Text {
                        id: twelvethname
                        font.family: webFont.name
                        font.bold: true
                        font.pixelSize: ((parent.width + parent.height) / 2 )*0.08
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }
            }
        }



    }

    function shiftRect(){
        twelvethliveImage.source = eleventhliveImage.source
        eleventhliveImage.source = tenthliveImage.source
        tenthliveImage.source = ninethliveImage.source
        ninethliveImage.source = eighthliveImage.source
        eighthliveImage.source = seventhliveImage.source
        seventhliveImage.source = sixthliveImage.source
        sixthliveImage.source = fivethliveImage.source
        fivethliveImage.source = fourthliveImage.source
        fourthliveImage.source = thirdliveImage.source
        thirdliveImage.source = secondliveImage.source
        secondliveImage.source = firstliveImage.source
        twelvethname.text = eleventhname.text

        eleventhname.text = tenthname.text
        tenthname.text = ninethname.text
        ninethname.text = eighthname.text
        eighthname.text = seventhname.text
        seventhname.text = sixthname.text
        sixthname.text = fivethname.text
        fivethname.text = fourthname.text
        fourthname.text = thirdname.text
        thirdname.text = secondname.text
        secondname.text = firstname.text

        eleventhdate.text = tenthdate.text
        tenthdate.text = ninethdate.text
        ninethdate.text = eighthdate.text
        eighthdate.text = seventhdate.text
        seventhdate.text = sixthdate.text
        sixthdate.text = fivethdate.text
        fivethdate.text = fourthdate.text
        fourthdate.text = thirddate.text
        thirddate.text = seconddate.text
        seconddate.text = firstdate.text
    }
}
