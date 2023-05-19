import QtQuick 2.6
import QtQuick.Controls 2.2
import QtQuick.Window 2.2

Window {
    visible: true
    width: 400
    height: 300
    title: "Calculator"

    Column {
        spacing: 10
        anchors.centerIn: parent

        TextField {
            id: firstNumberField
            placeholderText: "Enter First Number"
        }

        TextField {
            id: secondNumberField
            placeholderText: "Enter Second Number"
        }

        Row {
            spacing: 10

            ComboBox {
                id: operatorComboBox
                width: 100
                model: ["+", "-", "*", "/"]
            }

            Button {
                text: "Calculate"
                onClicked: {
                    var firstNumber = parseFloat(firstNumberField.text)
                    var secondNumber = parseFloat(secondNumberField.text)
                    var result

                    switch (operatorComboBox.currentText) {
                        case "+":
                            result = firstNumber + secondNumber
                            break
                        case "-":
                            result = firstNumber - secondNumber
                            break
                        case "*":
                            result = firstNumber * secondNumber
                            break
                        case "/":
                            result = firstNumber / secondNumber
                            break
                    }

                    resultLabel.text = "Result: " + result
                }
            }
        }

        Label {
            id: resultLabel
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
