import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

ApplicationWindow {
    width: 400
    height: 500
    visible: true
    color: "#E8DADB"
    title: "Serial Communication"
    Item {
        width: parent.width
        height: parent.height
        anchors.centerIn: parent

        ColumnLayout {
            spacing: 10
            anchors.centerIn: parent
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                text: "Enter a message:"
            }

            TextField {
                id: messageInput
                width: parent.width
            }

            Button {
                text: "Send"
                //color: "#727Cf5"

                onClicked: {
                    serialCommunication.sendData(messageInput.text)
                    messageInput.text = ""
                }
            }

            ListView {
                id: messageList
                width: parent.width
                height: 200
                model: messageModel.messages
                delegate: Text {
                    text: modelData
                }
                onModelChanged: positionViewAtEnd()
            }
        }
    }
    Connections {
        target: serialCommunication
        onMessageSent: {
            messageModel.addMessage("Sent: " + message)
        }
        onMessageReceived: {
            messageModel.addMessage("Received: " + message)
        }
        onErrorOccurred: {
            messageModel.addMessage("Error: " + error)
        }
    }
}
