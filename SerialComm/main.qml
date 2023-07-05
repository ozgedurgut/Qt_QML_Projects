import QtQuick 2.0
import QtQuick.Controls 2.0

ApplicationWindow {
    width: 400
    height: 300
    visible: true
    title: "Serial Communication"

    Column {
        spacing: 10
        anchors.centerIn: parent

        Text {
            text: "Enter a message:"
        }

        TextField {
            id: messageInput
            width: parent.width
        }

        Button {
            text: "Send"
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
