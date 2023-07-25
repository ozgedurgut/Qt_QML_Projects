/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/

import QtQuick 6.2
import QtQuick.Controls 6.2
import CoffeeMachine
import QtQuick.Layouts 1.0

Rectangle {
    id: rectangle
    width: 800
    height: 480
    color: "#a78295"

    Rectangle {
        id: rectangle1
        x: 0
        y: 0
        width: 800
        height: 74
        color: "#331d2c"
    }

    Rectangle {
        id: rectangle2
        x: 0
        y: 74
        width: 200
        height: 406
        color: "#3f2e3e"

        ColumnLayout {
            x: 30
            y: 31
            Button {
                id: usersButton
                text: qsTr("Users")
                Layout.preferredWidth: 140
                Layout.preferredHeight: 52
            }

            Button {
                id: cleanButton
                text: qsTr("Clean")
                Layout.preferredWidth: 140
            }

            Button {
                id: settingsButton
                text: qsTr("Settings")
                Layout.preferredWidth: 140
            }
        }
    }

    Image {
        id: coffee_logo
        x: -54
        y: -18
        width: 188
        height: 107
        source: "images/coffee_logo.png"
        fillMode: Image.PreserveAspectFit

        Label {
            id: label1
            x: 135
            y: 48
            width: 216
            height: 50
            color: "#efe1d1"
            text: qsTr("Coffee Machine")
            font.pointSize: 18
            font.family: "Verdana"
        }
    }

    Button {
        id: cappucinoButton
        x: 260
        y: 289
        width: 148
        height: 149
        text: qsTr("Cappucino")
    }

    Button {
        id: macchiatoButton
        x: 430
        y: 289
        width: 148
        height: 149
        text: qsTr("Macchiato")
    }

    Button {
        id: mochaButton
        x: 602
        y: 289
        width: 148
        height: 149
        text: qsTr("Mocha")
    }

    Button {
        id: espressoButton
        x: 260
        y: 115
        width: 148
        height: 149
        text: qsTr("Espresso")
    }

    Button {
        id: americanoButton
        x: 430
        y: 115
        width: 148
        height: 149
        text: qsTr("Americano")

    }

    Button {
        id: latteButton
        x: 602
        y: 115
        width: 148
        height: 149
        text: qsTr("Latte")
    }
    states: [
        State {
            name: "clicked"
        }
    ]
}
