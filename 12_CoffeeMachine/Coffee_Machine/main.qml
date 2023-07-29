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


    property int progressValue: 0
    property int progressValue1: 0
    property int progressValue2: 0
    property int progressValue3: 0


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
                    Connections{
                        target: MessageHandler
                        onClicked: {
                            stackView.push(coffeeSettingPage);
                            MessageHandler.sendMessage("Cappucino selected");
                        }
                    }
                }

                Button {
                    id: macchiatoButton
                    x: 430
                    y: 289
                    width: 148
                    height: 149
                    text: qsTr("Macchiato")
                    Connections{
                        target: MessageHandler
                        onClicked: {stackView.push(coffeeSettingPage);
                            MessageHandler.sendMessage("Macchiato selected");
                        }}
                }

                Button {
                    id: mochaButton
                    x: 602
                    y: 289
                    width: 148
                    height: 149
                    text: qsTr("Mocha")
                    Connections{
                        target: MessageHandler
                        onClicked:{
                            stackView.push(coffeeSettingPage);
                            MessageHandler.sendMessage("Mocha selected");
                        }}
                }

                Button {
                    id: espressoButton
                    x: 260
                    y: 115
                    width: 148
                    height: 149
                    text: qsTr("Espresso")
                    Connections{
                        target: MessageHandler
                        onClicked:{ stackView.push(coffeeSettingPage);
                            MessageHandler.sendMessage("Espresso selected");
                        }}
                }

                Button {
                    id: americanoButton
                    x: 430
                    y: 115
                    width: 148
                    height: 149
                    text: qsTr("Americano")
                    Connections{
                        target: MessageHandler
                        onClicked: {stackView.push(coffeeSettingPage);
                            MessageHandler.sendMessage("Americano selected");

                        }}
                }

                Button {
                    id: latteButton
                    x: 602
                    y: 115
                    width: 148
                    height: 149
                    text: qsTr("Latte")
                    Connections{
                        target: MessageHandler
                        onClicked:{
                            stackView.push(coffeeSettingPage);
                            MessageHandler.sendMessage("Latte selected");
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
                                label2.text=usernameInput.text;
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
                        Connections{
                            onClicked: {
                                onClicked: stackView.push(coffeeSelectionPage);
                            }
                        }
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

                    Connections{
                        onClicked: stackView.push(coffeeProgressPage);
                    }
                }

                Image {
                    id: ok_icon
                    x: 682
                    y: 301
                    width: 106
                    height: 155
                    source: "data:image/png;base64,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"
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



    Component{
        id: coffeeProgressPage
        Page{

            Rectangle {
                id: rectangle
                x: 0
                y: 0
                width: 800
                height: 480
                color: "#a78295"

                ProgressBar {
                    id: progressBar
                    x: 216
                    y: 348
                    width: 369
                    height: 83
                    indeterminate: true
                }

                AnimatedImage {
                    id: animatedImage
                    x: 288
                    y: 24
                    width: 224
                    height: 284
                    source: "../Coffee_Machine/content/images/coffee-lover-coffee.gif"
                }
            }
        }
    }
}
