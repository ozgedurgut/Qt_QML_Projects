import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 800
    height: 480
    title: "Coffee Machine App"
    property var users : [
        { username: "ozge"}
    ];
    StackView {
        id: stackView
        initialItem: introPage
        anchors.fill: parent
    }

    Component {
        id: introPage
        Page {
            title: "Giriş Sayfası"
            Column {
                anchors.centerIn: parent
                spacing: 10

                Button {
                    text: "Start"
                    onClicked: stackView.push(coffeeSelectionPage);
                }
            }
        }
    }

    Component {
        id: coffeeSelectionPage
        Page {
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

                    Column {
                        x: 30
                        y: 31
                        Button {
                            id: usersButton
                            text: qsTr("Users")
                            Connections{
                                onClicked: {
                                    onClicked: stackView.push(userPage);
                                }
                            }

                        }

                        Button {
                            id: cleanButton
                            text: qsTr("Clean")

                        }

                        Button {
                            id: settingsButton
                            text: qsTr("Settings")

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
                    onClicked: stackView.push(coffeeSettingPage);

                }

                Button {
                    id: macchiatoButton
                    x: 430
                    y: 289
                    width: 148
                    height: 149
                    text: qsTr("Macchiato")
                    onClicked: stackView.push(coffeeSettingPage);

                }

                Button {
                    id: mochaButton
                    x: 602
                    y: 289
                    width: 148
                    height: 149
                    text: qsTr("Mocha")
                    onClicked: stackView.push(coffeeSettingPage);

                }

                Button {
                    id: espressoButton
                    x: 260
                    y: 115
                    width: 148
                    height: 149
                    text: qsTr("Espresso")
                    onClicked: stackView.push(coffeeSettingPage);
                }

                Button {
                    id: americanoButton
                    x: 430
                    y: 115
                    width: 148
                    height: 149
                    text: qsTr("Americano")
                    onClicked: stackView.push(coffeeSettingPage);

                }

                Button {
                    id: latteButton
                    x: 602
                    y: 115
                    width: 148
                    height: 149
                    text: qsTr("Latte")
                    onClicked: stackView.push(coffeeSettingPage);

                }
                states: [
                    State {
                        name: "clicked"
                    }
                ]
            }
        }
    }

    Component{
        id: userPage
        Page{
            Rectangle {

                Rectangle {
                    id: rectangle
                    x: 0
                    y: 0
                    width:800
                    height: 480

                    color: "#d3cfff"

                    TextField {
                        id: usernameInput
                        x: 297
                        y: 44
                        width: 146
                        placeholderText: "Username"
                        height: 40
                    }
                    Button {
                        x: 449
                        y: 38
                        width: 86
                        height: 52
                        text: "Save"
                        background: Rectangle {
                            color: "#18317c"
                        }
                        contentItem: Text {
                            color: "white"
                            text: "SAVE"
                        }
                        Connections{
                            onClicked: {
                            label4.text=usernameInput;
                            }
                        }
                    }

                    Button {
                        id: button
                        x: 492
                        y: 325
                        width: 86
                        height: 52
                        text: qsTr("OK")
                    }

                    Label {
                        id: label
                        x: 120
                        y: 258
                        width: 122
                        height: 24
                        text: qsTr("Users")
                        font.pointSize: 16
                    }

                    Label {
                        id: label1
                        x: 142
                        y: 295
                        width: 23
                        height: 24
                        text: qsTr("1.")
                        font.pointSize: 16
                    }

                    Label {
                        id: label2
                        x: 179
                        y: 295
                        width: 210
                        height: 24
                        text: qsTr("null")
                        font.pointSize: 16
                    }

                    Label {
                        id: label3
                        x: 142
                        y: 325
                        width: 23
                        height: 24
                        text: qsTr("2.")
                        rotation: 0.434
                        font.pointSize: 16
                    }

                    Label {
                        id: label4
                        x: 179
                        y: 325
                        width: 210
                        height: 24
                        text: qsTr("null")
                        font.pointSize: 16
                    }

                    Label {
                        id: label5
                        x: 142
                        y: 355
                        width: 23
                        height: 24
                        text: qsTr("3.")
                        font.pointSize: 16
                    }

                    Label {
                        id: label6
                        x: 179
                        y: 355
                        width: 210
                        height: 24
                        text: qsTr("null")
                        font.pointSize: 16
                    }
                }
        }
    }
}

    Component {
        id: coffeeSettingPage
        Page {
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
                        id: buttonBack
                        x: 710
                        y: 2
                        width: 90
                        height: 72
                        visible: true
                        text: "Back"

                        Connections{
                            onClicked: {
                                onClicked: stackView.push(coffeeSelectionPage);

                            }
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
                    //Layout.preferredWidth: 200
                    value: progressValue
                    //Layout.preferredHeight: 139
                    rotation: 270
                }

                ProgressBar {
                    id: progressBar1
                    from: 0
                    to: 100
                    x: 164
                    y: 193
                    //Layout.preferredWidth: 200
                    value: progressValue1
                    //Layout.preferredHeight: 139
                    rotation: 270
                }

                ProgressBar {
                    id: progressBar2
                    from: 0
                    to: 100
                    x: 322
                    y: 193
                    //Layout.preferredWidth: 200
                    value: progressValue2
                    //Layout.preferredHeight: 139
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
                            progressValue =progressValue + 25
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
                            progressValue =progressValue - 25
                        }
                    }
                }

                ProgressBar {
                    id: progressBar3
                    from: 0
                    to: 100
                    x: 465
                    y: 193
                    //Layout.preferredWidth: 200
                    value: progressValue3
                    //Layout.preferredHeight: 139
                    rotation: 270
                }

                Image {
                    id: coffee
                    x: 66
                    y: 318
                    width: 100
                    source: "images/coffee.png"
                    //Layout.preferredWidth: 176
                    fillMode: Image.PreserveAspectFit
                    //Layout.preferredHeight: 97
                }

                Image {
                    id: water_icon
                    x: 214
                    y: 314
                    width: 100
                    source: "images/water_icon.png"
                    //Layout.preferredWidth: 167
                    fillMode: Image.PreserveAspectFit
                    //Layout.preferredHeight: 164
                }

                Image {
                    id: milk_icon
                    x: 372
                    y: 318
                    width: 100
                    source: "images/milk_icon.png"
                    //Layout.preferredWidth: 134
                    fillMode: Image.PreserveAspectFit
                    //Layout.preferredHeight: 155
                }

                Image {
                    id: cup
                    x: 520
                    y: 314
                    width: 100
                    source: "images/cup.png"
                    //Layout.preferredWidth: 138
                    fillMode: Image.PreserveAspectFit
                    //Layout.preferredHeight: 162
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
        }
    }
}
