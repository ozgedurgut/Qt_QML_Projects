import QtQuick 2.6
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.1
import QtQuick.Window 2.3

ApplicationWindow {
    visible: true
    width: 400
    height: 600
    title: "To-Do List"

    Rectangle {
        color: "#F2F2F2"
        anchors.fill: parent

        ColumnLayout {
            anchors.fill: parent
            spacing: 10

            RowLayout {
                spacing: 10
                Text {
                    text: "To-Do List"
                    font.pixelSize: 15
                    font.family: "Arial"
                    font.weight: Font.Thin
                    anchors.verticalCenter: parent.verticalCenter
                }
            }

            RowLayout {
                spacing: 10
                TextField {
                    id: taskInput
                    placeholderText: "Enter a task"
                    Layout.fillWidth: true
                    height: 40
                }

                TextField {
                    id: timeInput
                    placeholderText: "Time"
                    Layout.minimumWidth: 100
                    Layout.maximumWidth: 100
                    height: 40
                }

                MyButton {
                    text: "Add Task"
                    onClicked: {
                        if (taskInput.text !== "") {
                            taskListModel.append({ task: taskInput.text, done: false, time: timeInput.text })
                            taskInput.text = ""
                            timeInput.text = ""
                        }
                    }
                }
            }

            ScrollView {
                Layout.fillHeight: true
                width: parent.width

                ListView {
                    width: parent.width
                    height: contentHeight

                    model: ListModel {
                        id: taskListModel
                    }

                    delegate: Item {
                        width: parent.width
                        height: 40

                        Rectangle {
                            color: done ? "lightgreen" : "white"
                            width: parent.width
                            height: parent.height

                            RowLayout {
                                anchors.fill: parent
                                spacing: 5

                                CheckBox {
                                    id: doneCheckBox
                                    checked: done
                                    onClicked: {
                                        taskListModel.setProperty(index, "done", doneCheckBox.checked)
                                    }
                                }

                                Text {
                                    text: index + 1 + ". " + model.task + " (Time: " + model.time + ")"
                                    anchors.verticalCenter: parent.verticalCenter
                                    leftPadding: 5
                                    font.pixelSize: 16
                                    color: done ? "gray" : "black"
                                    elide: Text.ElideRight
                                }

                                MyButton {
                                    text: "Delete"
                                    onClicked: {
                                        taskListModel.remove(index)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
