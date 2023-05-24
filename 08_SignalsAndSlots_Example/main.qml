import QtQuick 2.6
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Window 2.3
import QtQuick.Dialogs 1.2

ApplicationWindow {
    visible: true
    width: 430
    height: 480
    title: qsTr("Hello World")


    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: firstPageComponent

        Component {
            id: firstPageComponent
            Rectangle {
                color: "#bfcef9"
                anchors.fill: parent

                ColumnLayout {
                    anchors.centerIn: parent
                    spacing: 10


                    Button {
                        id: button1
                        x:47
                        y:229
                        text: qsTr("Button 1")
                        antialiasing: true
                        scale: 1.3
                        onClicked: back.changeValue(1);
                    }
                    Button {
                        id: button2
                        x:163
                        y:229
                        text: qsTr("Button 2")
                        antialiasing: true
                        scale: 1.3
                        onClicked: back.changeValue(2);
                    }
                    Button {
                        id: button3
                        x:279
                        y:229
                        text: qsTr("Button 3")
                        antialiasing: true
                        scale: 1.3
                        onClicked:  stackView.push(secondPageComponent);

                    }

                    Label {
                        id: label
                        x:23
                        y:88
                        width:355
                        height: 62
                        text: qsTr("Label")
                        horizontalAlignment: Text.AlignHCenter
                        elide: Text.ElideMiddle
                        font.capitalization: Font.MixedCase
                        font.family: "Arial"
                        font.pointSize: 20

                        Connections{
                            target: back
                            onValueChanged: label.text = s;
                        }
                    }
                }
            }
        }
        Component{
            id: secondPageComponent
            Rectangle{
                color: "#dfcef2"
                anchors.fill: parent

                ColumnLayout {
                    anchors.centerIn: parent
                    spacing: 10

                    Item {
                        anchors.horizontalCenter: parent.horizontalCenter
                        Button {
                            text: "Back"
                            background: Rectangle {
                                color: "#18317c"
                            }
                            contentItem: Text {
                                text: parent.text
                                color: "white"
                            }
                            onClicked: {
                                stackView.pop();
                            }
                        }
                    }
                }
            }
        }
    }
}
