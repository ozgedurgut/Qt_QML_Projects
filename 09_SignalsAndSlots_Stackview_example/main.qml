// main.qml
import QtQuick 2.6
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Window 2.3

ApplicationWindow {
    visible: true
    width: 400
    height: 400
    title: "Signal-Slot and StackView Example"

    property string data: "Initial Data"


    Connections {
        target: back
        onDataChanged: {
            // Sinyal tetiklendiğinde çalışacak işlemler
            console.log("Data changed:", newData)
            data = newData
        }
    }

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: firstPage

        Component {
            id: firstPage
            Rectangle {
                width: parent.width
                height: parent.height
                color: "lightblue"

                ColumnLayout {
                    anchors.centerIn: parent
                    Text {
                        text: "First Page"
                        font.pointSize: 24
                        Layout.alignment: Qt.AlignHCenter
                    }
                    Button {
                        text: "Go to Second Page"
                        onClicked: stackView.push(secondPage)
                    }
                }
            }
        }

        Component {
            id: secondPage
            Rectangle {
                width: parent.width
                height: parent.height
                color: "lightgreen"
                ColumnLayout {
                    anchors.centerIn: parent
                    Text {
                        text: "Second Page"
                        font.pointSize: 24
                        Layout.alignment: Qt.AlignHCenter
                    }
                    Button {
                        text: "Go Back"
                        onClicked: stackView.pop()
                    }
                }
            }
        }
    }

    Button {
        text: "Update Data"
        anchors {
            horizontalCenter: parent.horizontalCenter
            bottom: parent.bottom
            bottomMargin: 10
        }
        onClicked: {
            // C++ tarafındaki updateData() slotunu çağırarak veriyi güncelle
            back.updateData("New Data")
        }
    }
}
