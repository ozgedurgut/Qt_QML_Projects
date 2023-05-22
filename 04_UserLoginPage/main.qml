import QtQuick 2.6
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Window 2.3
import QtQuick.Dialogs 1.2

ApplicationWindow {
    visible: true
    width: 400
    height: 600
    title: "User Login"

    property bool isLoggedIn: false
    property var users : [
        { username: "buttercup", password: "1234" },
        { username: "blossom", password: "1234" },
        { username: "bubbles", password: "1234" }
    ];

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

                            var validUser = users.find(function(user) {
                                return user.username === usernameInput.text && user.password === passwordInput.text;
                            });

                            if (validUser) {
                                console.log("Login successful");
                                stackView.push(welcomePageComponent(validUser.username));
                            } else {
                                console.log("Login failed");
                                messageBox.text = "Invalid username or password.";
                                messageBox.visible = true;
                            }
                            usernameInput.text = "";
                            passwordInput.text = "";
                        }
                    }

                    Button {
                        text: "Sign in"
                        background: Rectangle {
                            color: "#18317c"
                        }
                        contentItem: Text {
                            text: parent.text
                            color: "white"
                        }
                        onClicked: {
                            stackView.push(signinComponent);
                        }
                    }

                    MessageDialog {
                        id: messageBox
                        title: "Warning"
                        text: ""
                        visible: false
                        onAccepted: {
                            messageBox.visible = false;
                        }
                    }
                }
            }
        }

        Component{
            id: welcomePageComponent
            Rectangle{
                color: "#dfcef2"
                anchors.fill: parent

                ColumnLayout {
                    anchors.centerIn: parent
                    spacing: 10
                    Text {
                        text: "Welcome, " + username
                        font.pixelSize: 20
                        color: "black"
                    }

                    Item {
                        anchors.horizontalCenter: parent.horizontalCenter
                        Button {
                            text: "Logout"
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

        Component {
            id: signinComponent
            Rectangle {
                color: "#dfcef2"
                anchors.fill: parent

                ColumnLayout {
                    anchors.centerIn: parent
                    spacing: 10

                    TextField {
                        id: username1Input
                        placeholderText: "Username"
                        Layout.fillWidth: true
                        height: 40
                    }

                    TextField {
                        id: password1Input
                        placeholderText: "Password"
                        Layout.fillWidth: true
                        height: 40
                        echoMode: TextInput.Password
                    }

                    TextField {
                        id: password2Input
                        placeholderText: "Confirm Password"
                        Layout.fillWidth: true
                        height: 40
                        echoMode: TextInput.Password
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
                                stackView.pop();
                            }
                        }
                    }

                    Item {
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 75
                        Button {
                            text: "Sign Up"
                            background: Rectangle {
                                color: "#18317c"
                            }
                            contentItem: Text {
                                text: parent.text
                                color: "white"
                            }
                            onClicked: {
                                var inputUsername = username1Input.text;
                                var inputPassword = password1Input.text;
                                var confirmPassword = password2Input.text;

                                if (inputUsername.length >= 3 && inputPassword.length >= 3) {
                                    if (inputPassword === confirmPassword) {
                                        console.log("Successful sign up");
                                        var newUser = { username: inputUsername, password: inputPassword };
                                        users.push(newUser);
                                        stackView.push(loginPageComponent.createObject(stackView, { "username": newUser.username }));
                                    } else {
                                        console.log("Passwords do not match");
                                        messageBox.text = "Passwords do not match.";
                                        messageBox.visible = true;
                                    }
                                } else {
                                    console.log("Username and password must be at least 3 characters long");
                                    messageBox.text = "Username and password must be at least 3 characters long.";
                                    messageBox.visible = true;
                                }

                                username1Input.text = "";
                                password1Input.text = "";
                                password2Input.text = "";
                            }
                        }
                    }

                    MessageDialog {
                        id: messageBox
                        title: "Warning"
                        text: ""
                        visible: false
                        onAccepted: {
                            messageBox.visible = false;
                        }
                    }
                }
            }
        }
    }
}
