import QtQuick 2.6
import QtQuick.Controls 2.2
import CustomTypes 1.0

ApplicationWindow {
    visible: true
    width: 200
    height: 200
    title: "Counter Example"

    Counter {
        id: counter
    }

    Column {
        anchors.centerIn: parent
        spacing: 20

        Text {
            id: counterValueText
            text: "Counter Value: " + counter.value
        }

        Button {
            text: "Increment"
            onClicked: counter.increment()
        }

        Button {
            text: "Decrement"
            onClicked: counter.decrement()
        }
    }

    Connections {
        target: counter
        onValueChanged: {
            counterValueText.text = "Counter Value: " + counter.value
        }
    }
}
