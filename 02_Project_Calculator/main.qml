import QtQuick 2.0
import QtQuick.Window 2.3

import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1
import QtQuick.Layouts 1.2
import "."
Window {
    visible: true
    width: 400
    height: 300
    title: qsTr("Calculator")

    Column {
        spacing: 10
        anchors.centerIn: parent

        TextField {
            id: inputField
            placeholderText: "Enter Numbers and Operators"
            height: 40
        }

        Row {
            spacing: 10

            MyButton {
                text: "7"

                onClicked: {
                    appendText(text)
                }
            }

            MyButton {
                text: "8"

                onClicked: {
                    appendText(text)
                }
            }

            MyButton {
                text: "9"

                onClicked: {
                    appendText(text)
                }
            }

            MyButton {
                text: "+"
                    backgroundDefaultColor: "#727Cf5"
                onClicked: {
                    appendText(text)
                }
            }
        }

        Row {
            spacing: 10

            MyButton {
                text: "4"
                onClicked: {
                    appendText(text)
                }
            }

            MyButton {
                text: "5"
                onClicked: {
                    appendText(text)
                }
            }

            MyButton {
                text: "6"
                onClicked: {
                    appendText(text)
                }
            }

            MyButton {
                text: "-"
                       backgroundDefaultColor: "#727Cf5"
                onClicked: {
                    appendText(text)
                }
            }
        }

        Row {
            spacing: 10

            MyButton {
                text: "1"
                onClicked: {
                    appendText(text)
                }
            }

            MyButton {
                text: "2"
                onClicked: {
                    appendText(text)
                }
            }

            MyButton {
                text: "3"
                onClicked: {
                    appendText(text)
                }
            }

            MyButton {
                text: "*"
                       backgroundDefaultColor: "#727Cf5"
                onClicked: {
                    appendText(text)
                }
            }
        }

        Row {
            spacing: 10

           MyButton {
                text: "0"
                onClicked: {
                    appendText(text)
                }
            }

           MyButton {
                text: "."
                       backgroundDefaultColor: "#727Cf5"
                onClicked: {
                    appendText(text)
                }
            }

           MyButton {
                text: "Calculate"
                       backgroundDefaultColor: "#727Cf4"
                onClicked: {
                    calculateResult()
                }
            }
        }

        Label {
            id: resultLabel
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    function appendText(text) {
        if (inputField.text === "" && (text === "+" || text === "*" || text === ".")) {
            return
        }

        inputField.text += text
    }

    function calculateResult() {
        var expression = inputField.text

        if (expression === "") {
            return
        }

        try {
            var result = eval(expression)
            resultLabel.text = "Result: " + result
            inputField.text = ""
        } catch (e) {
            resultLabel.text = "Invalid expression"
        }
    }
}
