import QtQuick 2.0
import QtQuick.Window 2.3

import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1
import QtQuick.Layouts 1.2
import "."
Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Project 01")

    GridLayout{
        anchors.centerIn: parent
        columnSpacing: 30
        rowSpacing: 30
        rows: 4
        columns:3
        MyButton{
            text: "first"
            backgroundDefaultColor: "#727Cf5"
            onClicked: {
                console.log("button1 clicked")
            }
        }
        MyButton{
            text: "second"
            backgroundDefaultColor: "#5A6268"
            onClicked: {
                console.log("button2 clicked")
            }
        }
        MyButton{
            text: "third"
            backgroundDefaultColor: "#0ACF97"
            onClicked: {
                console.log("button3 clicked")
            }
        }
        MyButton{
            text: "fourth"
            backgroundDefaultColor: "#F9375E"
            onClicked: {
                console.log("button4 clicked")
            }
        }
    }
}
