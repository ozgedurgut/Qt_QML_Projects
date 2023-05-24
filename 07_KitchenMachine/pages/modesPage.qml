import QtQuick 2.6
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3

Item {
    id: page

    readonly property int itemWidth: Math.max(button.implicitWidth, Math.min(button.implicitWidth * 3, page.availableWidth / 3 * 2))

    ColumnLayout {
        anchors.fill: parent
        spacing: 10

        Frame {
            width: page.itemWidth
            anchors.centerIn: parent
            ColumnLayout {
                spacing: 20


                RadioButton {
                    text: "Ice Cream Mode"
                    checked: true
                    Layout.fillWidth: true
                    onCheckedChanged: {
                        if (checked) {
                            juiceModeRadioButton.checked = false;
                            coffeeModeRadioButton.checked = false;
                            cleanModeRadioButton.checked = false;
                        }
                    }
                }
                RadioButton {
                    id: juiceModeRadioButton
                    text: "Juice Mode"
                    Layout.fillWidth: true
                    onCheckedChanged: {
                        if (checked) {
                            iceCreamModeRadioButton.checked = false;
                            coffeeModeRadioButton.checked = false;
                            cleanModeRadioButton.checked = false;
                        }
                    }
                }
                RadioButton {
                    id: coffeeModeRadioButton
                    text: "Coffee Mode"
                    Layout.fillWidth: true
                    onCheckedChanged: {
                        if (checked) {
                            iceCreamModeRadioButton.checked = false;
                            juiceModeRadioButton.checked = false;
                            cleanModeRadioButton.checked = false;
                        }
                    }
                }
                RadioButton {
                    id: cleanModeRadioButton
                    text: "Clean Mode"
                    Layout.fillWidth: true
                    onCheckedChanged: {
                        if (checked) {
                            iceCreamModeRadioButton.checked = false;
                            juiceModeRadioButton.checked = false;
                            coffeeModeRadioButton.checked = false;
                        }
                    }
                }
            }
        }

        Item {
            x:150
            y:100
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



                }
            }
        }
    }
}
