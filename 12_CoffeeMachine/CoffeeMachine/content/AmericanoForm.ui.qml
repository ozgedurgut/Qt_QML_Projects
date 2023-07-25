

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 6.2
import QtQuick.Controls 6.2
//import CoffeeMachine
import QtQuick.Layouts 1.0

Rectangle {
    id: coffeeSetPage1
    width: 800
    height: 480
    color: "#a78295"

    property int progressValue: 0
    property int progressValue1: 0
    property int progressValue2: 0
    property int progressValue3: 0

    Rectangle {
        id: rectangle1
        x: 0
        y: 0
        width: 800
        height: 74
        color: "#331d2c"

        Button {
            id: button
            x: 724
            y: 2
            width: 62
            height: 72
            visible: false
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
            y: 49
            width: 216
            height: 50
            color: "#efe1d1"
            text: qsTr("Coffee Machine")
            font.pointSize: 18
            font.family: "Verdana"
        }
    }

    ProgressBar {
        id: progressBar
        from: 0
        to: 100
        x: 21
        y: 193
        Layout.preferredWidth: 200
        value: progressValue
        Layout.preferredHeight: 139
        rotation: 270
    }

    ProgressBar {
        id: progressBar1
        from: 0
        to: 100
        x: 164
        y: 193
        Layout.preferredWidth: 200
        value: progressValue1
        Layout.preferredHeight: 139
        rotation: 270
    }

    ProgressBar {
        id: progressBar2
        from: 0
        to: 100
        x: 322
        y: 193
        Layout.preferredWidth: 200
        value: progressValue2
        Layout.preferredHeight: 139
        rotation: 270

    }

    Button {
        id: buttonIncrease1
        x: 129
        y: 141
        width: 52
        height: 52
        text: "+"
        Connections{
            onClicked: {
                // Progress bar değerini arttır
                progressValue = Math.min(progressValue + step, 100);
            }
        }
    }

    Button {
        id: buttonDecrease1
        x: 129
        y: 199
        width: 52
        height: 56
        text: "-"
        Connections{
            onClicked: {
                // Progress bar değerini azalt
                progressValue = Math.max(progressValue - step, 0);
            }
        }
    }

    ProgressBar {
        id: progressBar3
        from: 0
        to: 100
        x: 465
        y: 193
        Layout.preferredWidth: 200
        value: progressValue3
        Layout.preferredHeight: 139
        rotation: 270
    }

    Image {
        id: coffee
        x: 66
        y: 318
        width: 100
        source: "images/coffee.png"
        Layout.preferredWidth: 176
        fillMode: Image.PreserveAspectFit
        Layout.preferredHeight: 97
    }

    Image {
        id: water_icon
        x: 214
        y: 314
        width: 100
        source: "images/water_icon.png"
        Layout.preferredWidth: 167
        fillMode: Image.PreserveAspectFit
        Layout.preferredHeight: 164
    }

    Image {
        id: milk_icon
        x: 372
        y: 318
        width: 100
        source: "images/milk_icon.png"
        Layout.preferredWidth: 134
        fillMode: Image.PreserveAspectFit
        Layout.preferredHeight: 155
    }

    Image {
        id: cup
        x: 520
        y: 314
        width: 100
        source: "images/cup.png"
        Layout.preferredWidth: 138
        fillMode: Image.PreserveAspectFit
        Layout.preferredHeight: 162
    }

    Button {
        id: button1
        x: 690
        y: 328
        width: 90
        height: 100
    }

    Image {
        id: ok_icon
        x: 682
        y: 301
        width: 106
        height: 155
        source: "images/ok_icon.png"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: back_icon
        x: 736
        y: 0
        width: 64
        height: 74
        source: "images/back_icon.png"
        fillMode: Image.PreserveAspectFit
    }

    Button {
        id: buttonIncrease2
        x: 272
        y: 141
        width: 52
        height: 52
        text: "+"
        Connections {
            onClicked: {
                // Progress bar değerini arttır
                progressValue1 +=25
            }
        }
    }

    Button {
        id: buttonDecrease2
        x: 272
        y: 199
        width: 52
        height: 56
        text: "-"
        Connections {
            onClicked: {
                // Progress bar değerini azalt
                progressValue1 -=25
            }
        }
    }

    Button {
        id: buttonIncrease3
        x: 430
        y: 141
        width: 52
        height: 52
        text: "+"
        Connections {
            onClicked: {
                // Progress bar değerini arttır
                progressValue2 +=25
            }
        }
    }

    Button {
        id: buttonDecrease3
        x: 430
        y: 199
        width: 52
        height: 56
        text: "-"
        Connections {
            onClicked: {
                // Progress bar değerini azalt
                progressValue2 -=25
            }
        }
    }

    Button {
        id: buttonIncrease4
        x: 573
        y: 141
        width: 52
        height: 52
        text: "+"
        Connections {
            onClicked: {
                // Progress bar değerini arttır
                progressValue3 +=25
            }
        }
    }

    Button {
        id: buttonDecrease4
        x: 573
        y: 199
        width: 52
        height: 56
        text: "-"
        Connections {
            onClicked: {
                // Progress bar değerini azalt
                progressValue3-=25
            }
        }
    }
    states: [
        State {
            name: "clicked"
        }
    ]
}

