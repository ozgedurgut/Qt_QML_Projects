import QtQuick 2.6
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.2

ApplicationWindow {
    visible: true
    width: 400
    height: 600
    title: "Messaging App"

    ListModel {
        id: chatListModel
        ListElement { name: "Sohbet 1"; unreadCount: 3 }
        ListElement { name: "Sohbet 2"; unreadCount: 1 }
        ListElement { name: "Sohbet 3"; unreadCount: 0 }
    }

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: chatListPageComponent

        Component {
            id: chatListPageComponent
            Rectangle {
                color: "white"
                anchors.fill: parent

                ListView {
                    id: chatListView
                    width: parent.width
                    height: parent.height
                    model: chatListModel
                    delegate: Item {
                        width: chatListView.width
                        height: 30

                        Rectangle {
                            color: index % 2 === 0 ? "#f2f2f2" : "#ffffff"
                            anchors.fill: parent

                            Text {
                                text: model.name
                                font.pixelSize: 18
                                anchors.left: parent.left
                                anchors.verticalCenter: parent.verticalCenter
                                leftPadding: 10
                            }

                            Text {
                                text: model.unreadCount > 0 ? model.unreadCount.toString() : ""
                                color: "white"
                                font.pixelSize: 12
                                anchors.centerIn: parent
                                padding: 5
                                visible: model.unreadCount > 0
                                Rectangle {
                                    color: "#ff0000"
                                    radius: 10
                                }
                            }
                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    stackView.push(chatPageComponent.createObject(stackView, { "chatName": model.name }))
                                }
                            }
                        }
                    }
                }
            }
        }

        Component {
            id: chatPageComponent
            Rectangle {
                color: "white"
                anchors.fill: parent

                property var chatElement: null
                property ListModel messages: ListModel {}

                ColumnLayout {
                    anchors.fill: parent
                    spacing: 10

                    Label {
                        text: "Chat: " + chatElement.name
                        font.pixelSize: 18
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    ListView {
                        id: messageListView
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        model: chatElement.messages

                        delegate: Item {
                            width: messageListView.width
                            height: 30

                            Text {
                                text: model.message
                                font.pixelSize: 14
                                anchors.left: parent.left
                                anchors.verticalCenter: parent.verticalCenter
                                leftPadding: 10
                            }
                        }
                    }

                    TextField {
                        id: messageInput
                        placeholderText: "Mesajınızı girin..."
                        Layout.fillWidth: true
                        height: 40
                    }

                    Item {
                        x:290
                        y:550
                        Button {
                            text: "Send"
                            background: Rectangle {
                                color: "#660066"
                            }
                            contentItem: Text {
                                text: parent.text
                                color: "white"
                            }
                            onClicked: {
                                var messageText = messageInput.text;
                                     if (messageText !== "") {
                                         chatElement.messages.append({ "message": messageText });
                                         messageInput.text = "";
                                     }
                            }
                        }
                    }

                    Item {
                        x:350
                        y:550
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
                }
            }
        }
    }
}
