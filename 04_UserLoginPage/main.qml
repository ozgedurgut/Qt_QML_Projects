import QtQuick 2.6
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.1
import QtQuick.Window 2.3

ApplicationWindow {
    visible: true
    width: 400
    height: 400
    title: "User Login"

    property bool isLoggedIn: false

    StackView {
        id: stackView
        anchors.fill: parent

        initialItem: loginPageComponent


        Component {
            id: loginPageComponent
            Rectangle {
                color: "#bfcef9"
                anchors.fill: parent

                ColumnLayout {
                    anchors.centerIn: parent
                    spacing: 10

                    Item {
                        width: 250
                        height: 250

                        Image {
                            anchors.centerIn: parent
                            source: "qrc:/images/powerpuff-girls.png"
                            width: parent.width
                            height: parent.height
                            fillMode: Image.PreserveAspectFit
                        }
                    }

                    TextField {
                        id: usernameInput
                        placeholderText: "Username"
                        Layout.fillWidth: true
                        height: 40
                    }

                    TextField {
                        id: passwordInput
                        placeholderText: "Password"
                        Layout.fillWidth: true
                        height: 40
                        echoMode: TextInput.Password
                    }

                    Button {
                        text: "Login"
                        background: Rectangle {
                            color: "#18317c"
                        }
                        contentItem: Text {
                            text: parent.text
                            color: "white"
                        }
                        onClicked: {
                            if (usernameInput.text === "buttercup" && passwordInput.text === "1234") {
                                console.log("Login successful");
                                stackView.push(buttercupComponent);
                            } else if (usernameInput.text === "blossom" && passwordInput.text === "1234") {
                                console.log("Login successful");
                                stackView.push(blossomComponent);
                            }  else if (usernameInput.text === "bubbles" && passwordInput.text === "1234") {
                                console.log("Login successful");
                                stackView.push(bubblesComponent);
                            }


                            else {
                                console.log("Login failed");
                            }

                        }
                    }
                }
            }
        }


        Component {
            id: buttercupComponent
            Rectangle {
                color: "#8dff8b"
                anchors.fill: parent

                Label {
                    text: "Welcome Buttercup!"
                    font.pixelSize: 24
                    anchors.centerIn: parent
                }
                Item {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 75
                    Button {
                        text: "Back"
                        background: Rectangle {
                            color: "#660066"
                        }
                        contentItem: Text {
                            text: parent.text
                            color: "white"
                        }
                        onClicked: {

                            console.log("back");
                            stackView.push(loginPageComponent);
                        }
                    }
                }
            }
        }
        Component {
            id: blossomComponent
            Rectangle {
                color: "#ff87d6"
                anchors.fill: parent

                Label {
                    text: "Welcome Blossom!"
                    font.pixelSize: 24
                    anchors.centerIn: parent
                }
                Item {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 75
                    Button {
                        text: "Back"
                        background: Rectangle {
                            color: "#660066"
                        }
                        contentItem: Text {
                            text: parent.text
                            color: "white"
                        }
                        onClicked: {

                            console.log("back");
                            stackView.push(loginPageComponent);
                        }
                    }
                }
            }
        }
        Component {
            id: bubblesComponent
            Rectangle {
                color: "#62f3ff"
                anchors.fill: parent

                Label {
                    text: "Welcome Bubbles!"
                    font.pixelSize: 24
                    anchors.centerIn: parent
                }
                Item {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 75
                    Button {
                        text: "Back"
                        background: Rectangle {
                            color: "#660066"
                        }
                        contentItem: Text {
                            text: parent.text
                            color: "white"
                        }
                        onClicked: {

                            console.log("back");
                            stackView.push(loginPageComponent);
                        }
                    }
                }
            }
        }
    }
}
